# SCF-Vault Export Scripts

Scripts voor het exporteren van SCF-Vault data naar externe systemen.

## Beschikbare Scripts

### export_to_jira.py

Exporteert Bevindingen en Implementations naar Jira/Redmine CSV formaat.

#### Installatie

```bash
pip install pyyaml
```

#### Gebruik

```bash
# Navigeer naar de vault folder
cd /pad/naar/SCF-Vault

# Exporteer alleen bevindingen
python Scripts/export_to_jira.py --type findings --output bevindingen.csv

# Exporteer alleen openstaande implementations  
python Scripts/export_to_jira.py --type implementations --output taken.csv

# Exporteer alles (maakt 2 bestanden)
python Scripts/export_to_jira.py --type all --output export.csv
```

#### Output Formaat

**Bevindingen CSV:**
| Kolom | Beschrijving |
|-------|--------------|
| Summary | [FIND-ID] Titel |
| Description | Volledige beschrijving met links |
| Issue Type | Task |
| Priority | Highest/High/Medium/Low/Lowest |
| Assignee | Eigenaar uit frontmatter |
| Due Date | Deadline |
| Labels | security, audit-finding, control-ids |
| Epic Link | Security Remediation |
| Custom Fields | Finding ID, Classification, Root Cause, Linked Control |

**Implementations CSV:**
| Kolom | Beschrijving |
|-------|--------------|
| Summary | [IMPL-ID] Naam |
| Description | Control, Component, DoD |
| Issue Type | Task |
| Priority | Op basis van priority field |
| Labels | security, implementation, systeem |
| Epic Link | Security Implementation |
| Custom Fields | Implementation ID, Control, Component, Status |

#### Jira Import

1. Ga naar Jira → Projects → Import Issues
2. Selecteer "CSV"
3. Upload het gegenereerde bestand
4. Map de kolommen naar Jira velden
5. Voor Custom Fields: maak deze eerst aan in Jira

#### Redmine Import

Voor Redmine gebruik de CSV import plugin of converteer naar XML:

```bash
# Optioneel: converteer naar Redmine XML
python Scripts/export_to_jira.py --type findings --format redmine --output issues.xml
```

## Troubleshooting

### "Geen bevindingen gevonden"
- Controleer of je in de juiste vault folder staat
- Controleer of bestanden `type: finding` in frontmatter hebben

### Encoding problemen
- De scripts gebruiken UTF-8 encoding
- Open CSV in Excel via Data → From Text/CSV met UTF-8 selectie

## Uitbreiden

De `VaultExporter` class kan eenvoudig worden uitgebreid:

```python
from export_to_jira import VaultExporter

exporter = VaultExporter('/pad/naar/vault')

# Eigen export functie
risks = exporter.find_files('Risks', 'risk')
for risk in risks:
    print(f"{risk['id']}: {risk['name']}")
```
