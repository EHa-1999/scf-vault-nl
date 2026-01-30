---
id: "Audits-README"
type: documentation
name: "Audits Handleiding"
created: 2026-01-28
modified: 2026-01-28
tags:
  - documentation
  - audits
  - templater
---

# Audits Handleiding

## Overzicht

Deze folder bevat alle audit-gerelateerde documentatie volgens de LISA audit-dossier structuur. Elke interne audit heeft een eigen map met alle gerelateerde documenten bij elkaar.

## Folder Structuur

```
Audits/
├── 2026/                              ← Jaar
│   └── IA-2026-001-XENA/             ← Audit dossier
│       ├── _IA-2026-001-XENA.md      ← Hoofdrapport (prefix _)
│       ├── Self-Assessments/          ← Self-assessments in scope
│       │   └── SA-2026-Q1-XENA.md
│       ├── Bevindingen/               ← Findings uit deze audit
│       │   └── FIND-2026-001.md
│       └── Evidence/                  ← Lokale evidence kopieën
│
├── Scripts/                           ← Templater scripts
│   ├── Nieuwe Interne Audit.md
│   ├── Nieuw Self-Assessment.md
│   └── Nieuwe Bevinding.md
│
└── Templates/                         ← Backup templates
```

## Nieuwe Audit Aanmaken

### Vereisten

Installeer de **Templater** plugin:

1. Open Obsidian Settings → Community Plugins → Browse
2. Zoek "Templater" en installeer
3. Schakel de plugin in

### Templater Configureren

1. Open Settings → Templater
2. Stel **Template folder location** in op: `Audits/Scripts`
3. Schakel **Trigger Templater on new file creation** UIT (we gebruiken handmatige triggers)

### Nieuwe Interne Audit

1. Open Command Palette (`Ctrl/Cmd + P`)
2. Zoek "Templater: Open Insert Template modal"
3. Selecteer **Nieuwe Interne Audit**
4. Vul de prompts in:
   - Jaar (bijv. 2026)
   - Audit nummer (bijv. 001)
   - Scope (bijv. XENA, Domeinen-Q1)
   - Auditor naam

Het script maakt automatisch:
- Een audit folder met subfolders
- Het hoofdrapport met Dataview queries
- Opent het nieuwe rapport

### Nieuw Self-Assessment Toevoegen

1. Navigeer naar een bestaand audit dossier
2. Open Command Palette → Templater: Open Insert Template modal
3. Selecteer **Nieuw Self-Assessment**
4. Vul de prompts in:
   - Type (Systeem/Domein)
   - Scope (systeem of domein naam)
   - Kwartaal
   - Assessor naam

### Nieuwe Bevinding Toevoegen

1. Navigeer naar een bestaand audit dossier
2. Open Command Palette → Templater: Open Insert Template modal
3. Selecteer **Nieuwe Bevinding**
4. Vul de prompts in:
   - Titel
   - Classificatie (Critical/High/Medium/Low)
   - Eigenaar
   - Gerelateerde Control (optioneel)

De deadline wordt automatisch berekend op basis van classificatie:
- Critical: 7 dagen
- High: 30 dagen
- Medium: 90 dagen
- Low/Observation: 180 dagen

## Naamconventies

| Type | Format | Voorbeeld |
|------|--------|-----------|
| Interne Audit | `IA-{YYYY}-{NNN}-{Scope}` | IA-2026-001-XENA |
| Self-Assessment | `SA-{YYYY}-{QX}-{Scope}` | SA-2026-Q1-XENA |
| Bevinding | `FIND-{YYYY}-{NNN}` | FIND-2026-001 |

## Dataview Queries

De audit documenten bevatten Dataview queries die automatisch gerelateerde items tonen:

### In Audit Rapport
```dataview
TABLE FROM "Audits/2026/IA-2026-001-XENA/Bevindingen"
WHERE type = "finding"
```

### Cross-Audit Bevindingen
```dataview
TABLE FROM "Audits"
WHERE type = "finding" AND status = "Open"
```

## Workflow

### Audit Cyclus

1. **Planning** - Maak nieuw audit dossier aan
2. **Self-Assessment** - System owner voert assessment uit
3. **Review** - Auditor reviewt self-assessment
4. **Bevindingen** - Registreer gaps als bevindingen
5. **Acties** - Export naar Jira/Redmine
6. **Verificatie** - Sluit bevindingen na verificatie
7. **Rapportage** - Finaliseer audit rapport

### Status Waarden

**Audit:**
- Planning → In Progress → Review → Completed

**Self-Assessment:**
- Draft → In Review → Completed

**Bevinding:**
- Open → In Progress → Resolved → Verified → Closed

## Tips

- Gebruik de `_` prefix voor het hoofdrapport zodat het bovenaan de folder verschijnt
- Plaats evidence als kopie in de Evidence subfolder voor archivering
- Link naar Controls en Implementations voor traceerbaarheid
- Gebruik tags voor filtering in dashboards

## Zie Ook

- [[Frameworks/LISA/7-LISA-Audits|LISA Audits Framework]]
- [[Dashboards/Audit Dashboard|Audit Dashboard]]
