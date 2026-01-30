#!/usr/bin/env python3
"""
LISA SCF-Vault Export Script
Exporteert Bevindingen en Implementations naar Jira/Redmine CSV formaat.

Gebruik:
    python export_to_jira.py --type findings --output findings.csv
    python export_to_jira.py --type implementations --output impl.csv
    python export_to_jira.py --type all --output export.csv

Vereisten:
    pip install pyyaml
"""

import os
import re
import csv
import yaml
import argparse
from datetime import datetime
from pathlib import Path


class VaultExporter:
    """Exporteert SCF-Vault data naar Jira/Redmine formaat."""
    
    def __init__(self, vault_path: str):
        self.vault_path = Path(vault_path)
        
    def parse_frontmatter(self, file_path: Path) -> dict:
        """Parse YAML frontmatter uit een markdown bestand."""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Extract frontmatter tussen ---
            match = re.match(r'^---\s*\n(.*?)\n---', content, re.DOTALL)
            if match:
                return yaml.safe_load(match.group(1)) or {}
            return {}
        except Exception as e:
            print(f"Warning: Could not parse {file_path}: {e}")
            return {}
    
    def find_files(self, folder: str, file_type: str = None) -> list:
        """Vind alle markdown bestanden in een folder."""
        folder_path = self.vault_path / folder
        if not folder_path.exists():
            return []
        
        files = []
        for md_file in folder_path.rglob('*.md'):
            data = self.parse_frontmatter(md_file)
            if file_type is None or data.get('type') == file_type:
                data['_file_path'] = str(md_file)
                files.append(data)
        
        return files
    
    def export_findings(self, output_file: str):
        """Exporteer alle bevindingen naar Jira CSV."""
        findings = self.find_files('Audits', 'finding')
        
        if not findings:
            print("Geen bevindingen gevonden.")
            return
        
        # Jira CSV headers
        headers = [
            'Summary',
            'Description', 
            'Issue Type',
            'Priority',
            'Assignee',
            'Due Date',
            'Labels',
            'Epic Link',
            'Original Estimate',
            'Custom Field (Finding ID)',
            'Custom Field (Classification)',
            'Custom Field (Root Cause)',
            'Custom Field (Linked Control)'
        ]
        
        rows = []
        for finding in findings:
            # Map classificatie naar Jira priority
            priority_map = {
                'Critical': 'Highest',
                'High': 'High', 
                'Medium': 'Medium',
                'Low': 'Low',
                'Observation': 'Lowest'
            }
            
            # Bouw description
            description = f"""*Bevinding uit LISA Security Control Framework*

h3. Situatie
{finding.get('name', 'Geen beschrijving')}

h3. Gerelateerde Controls
{', '.join(finding.get('linked_controls', [])) or 'Geen'}

h3. Root Cause
{finding.get('root_cause', 'Niet gespecificeerd')}

h3. Audit
{finding.get('audit', 'Onbekend')}

----
_Geëxporteerd uit SCF-Vault op {datetime.now().strftime('%Y-%m-%d %H:%M')}_
"""
            
            # Labels genereren
            labels = ['security', 'audit-finding']
            if finding.get('linked_controls'):
                for ctrl in finding.get('linked_controls', []):
                    if ctrl:
                        labels.append(ctrl.replace(' ', '-').lower())
            
            row = {
                'Summary': f"[{finding.get('id', 'FIND-XXX')}] {finding.get('name', 'Untitled')}",
                'Description': description,
                'Issue Type': 'Task',
                'Priority': priority_map.get(finding.get('classification', 'Medium'), 'Medium'),
                'Assignee': finding.get('owner', ''),
                'Due Date': finding.get('due_date', ''),
                'Labels': ' '.join(labels),
                'Epic Link': 'Security Remediation',
                'Original Estimate': self._estimate_from_classification(finding.get('classification')),
                'Custom Field (Finding ID)': finding.get('id', ''),
                'Custom Field (Classification)': finding.get('classification', ''),
                'Custom Field (Root Cause)': finding.get('root_cause', ''),
                'Custom Field (Linked Control)': ', '.join(finding.get('linked_controls', []) or [])
            }
            rows.append(row)
        
        self._write_csv(output_file, headers, rows)
        print(f"✅ {len(rows)} bevindingen geëxporteerd naar {output_file}")
    
    def export_implementations(self, output_file: str):
        """Exporteer niet-afgeronde implementations naar Jira CSV."""
        implementations = self.find_files('Implementations', 'implementation')
        
        # Filter op niet-afgeronde implementations
        todo_statuses = ['Not Started', 'Planned', 'In Progress', 'Partial']
        implementations = [i for i in implementations if i.get('status') in todo_statuses]
        
        if not implementations:
            print("Geen openstaande implementations gevonden.")
            return
        
        headers = [
            'Summary',
            'Description',
            'Issue Type',
            'Priority',
            'Assignee',
            'Labels',
            'Epic Link',
            'Custom Field (Implementation ID)',
            'Custom Field (Control)',
            'Custom Field (Component)',
            'Custom Field (Status)'
        ]
        
        rows = []
        for impl in implementations:
            # Bouw description met DoD
            dod_items = impl.get('definition_of_done', [])
            dod_text = '\n'.join([f"* {item}" for item in dod_items]) if dod_items else 'Niet gedefinieerd'
            
            description = f"""*Implementation uit LISA Security Control Framework*

h3. Control
{impl.get('control', 'Niet gespecificeerd')}

h3. Component  
{impl.get('component', 'Niet gespecificeerd')}

h3. Definition of Done
{dod_text}

h3. Huidige Status
{impl.get('status', 'Onbekend')}

----
_Geëxporteerd uit SCF-Vault op {datetime.now().strftime('%Y-%m-%d %H:%M')}_
"""
            
            # Priority bepalen
            priority_map = {
                'Critical': 'Highest',
                'High': 'High',
                'Medium': 'Medium', 
                'Low': 'Low'
            }
            
            labels = ['security', 'implementation']
            if impl.get('system'):
                labels.append(impl.get('system', '').lower().replace(' ', '-'))
            
            row = {
                'Summary': f"[{impl.get('id', 'IMPL-XXX')}] {impl.get('name', 'Untitled')}",
                'Description': description,
                'Issue Type': 'Task',
                'Priority': priority_map.get(impl.get('priority', 'Medium'), 'Medium'),
                'Assignee': impl.get('owner', ''),
                'Labels': ' '.join(labels),
                'Epic Link': 'Security Implementation',
                'Custom Field (Implementation ID)': impl.get('id', ''),
                'Custom Field (Control)': impl.get('control', ''),
                'Custom Field (Component)': impl.get('component', ''),
                'Custom Field (Status)': impl.get('status', '')
            }
            rows.append(row)
        
        self._write_csv(output_file, headers, rows)
        print(f"✅ {len(rows)} implementations geëxporteerd naar {output_file}")
    
    def export_all(self, output_file: str):
        """Exporteer zowel findings als implementations."""
        base_name = output_file.rsplit('.', 1)[0]
        
        self.export_findings(f"{base_name}_findings.csv")
        self.export_implementations(f"{base_name}_implementations.csv")
    
    def _estimate_from_classification(self, classification: str) -> str:
        """Schat werk-uren op basis van classificatie."""
        estimates = {
            'Critical': '8h',
            'High': '4h',
            'Medium': '2h',
            'Low': '1h',
            'Observation': '30m'
        }
        return estimates.get(classification, '2h')
    
    def _write_csv(self, output_file: str, headers: list, rows: list):
        """Schrijf data naar CSV bestand."""
        with open(output_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=headers)
            writer.writeheader()
            writer.writerows(rows)


def main():
    parser = argparse.ArgumentParser(
        description='Export LISA SCF-Vault data naar Jira/Redmine CSV'
    )
    parser.add_argument(
        '--vault', '-v',
        default='.',
        help='Pad naar SCF-Vault folder (default: huidige directory)'
    )
    parser.add_argument(
        '--type', '-t',
        choices=['findings', 'implementations', 'all'],
        default='all',
        help='Type export: findings, implementations, of all'
    )
    parser.add_argument(
        '--output', '-o',
        default='export.csv',
        help='Output bestandsnaam (default: export.csv)'
    )
    
    args = parser.parse_args()
    
    exporter = VaultExporter(args.vault)
    
    if args.type == 'findings':
        exporter.export_findings(args.output)
    elif args.type == 'implementations':
        exporter.export_implementations(args.output)
    else:
        exporter.export_all(args.output)


if __name__ == '__main__':
    main()
