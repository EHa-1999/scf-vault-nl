---
id: "EXT-O.3"
type: control
category: "EXT-O1"
category_name: "Security Governance"
control_name: "Functiescheiding"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.3"
nis2: "-"
bio2: "B5.6"
security_requirement:
  - "SR-3"
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

# EXT-O.3 - Functiescheiding

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.3 |
| **Categorie** | EXT-O1 - Security Governance |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.3 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B5.6 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-3|SR-3]]

## Beschrijving

Implementeer functiescheiding om conflicterende taken te scheiden en risico op fraude en fouten te verminderen.

## Implementatie Richtlijnen

### Stappen

1. Identificeer kritieke processen
2. Analyseer conflicterende rollen
3. Definieer SoD matrix
4. Implementeer technische afdwinging
5. Monitor en rapporteer

### Best Practices

- Vier-ogen principe voor kritieke handelingen
- Automatische detectie van toxic combinations
- Compenserende maatregelen documenteren

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
