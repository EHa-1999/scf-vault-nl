---
id: "EXT-O.37"
type: control
category: "EXT-O5"
category_name: "Compliance & Audit"
control_name: "Operationele Procedures Documentatie"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.37"
nis2: "-"
bio2: "B8.1"
security_requirement:
  - "SR-1"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-o

# ─────────────────────────────────────────────────────────────────────
# Implementatie Tracking
# ─────────────────────────────────────────────────────────────────────
impl_status: "gepland"
impl_percentage: 0
impl_validated: false
impl_date: null
impl_owner: ""
impl_system: ""

# ─────────────────────────────────────────────────────────────────────
# Compliance Tracking
# ─────────────────────────────────────────────────────────────────────
compliance_status: "niet_beoordeeld"
compliance_score: null
compliance_assessed: null
compliance_assessor: ""
compliance_evidence: []
---

# EXT-O.37 - Operationele Procedures Documentatie

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.37 |
| **Categorie** | EXT-O5 - Compliance & Audit |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.37 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B8.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-1|SR-1]]

## Beschrijving

Documenteer operationele procedures en maak deze beschikbaar voor alle relevante medewerkers.

## Implementatie Richtlijnen

### Stappen

1. Inventariseer kritieke processen
2. Documenteer procedures
3. Implementeer versiebeheer
4. Maak toegankelijk
5. Review jaarlijks

### Best Practices

- SharePoint SOP bibliotheek
- Confluence voor IT
- Goedkeuring workflow
- Verplichte leesbevestiging

## Component Implementaties

```dataview
TABLE 
  component as "Component",
  system as "Systeem", 
  impl_status as "Status",
  next_review as "Review"
FROM "Implementations"
WHERE contains(string(control), this.id)
SORT system ASC
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(string(controls), this.id)
```

## Gerelateerde Controls

- Zie andere controls in categorie [[Controls/EXT-O|EXT-O]]
