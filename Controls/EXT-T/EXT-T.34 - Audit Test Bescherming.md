---
id: "EXT-T.34"
type: control
category: "EXT-T"
category_name: "Technical Operations"
control_name: "Audit Test Bescherming"
priority: 4
priority_label: "High"
baseline: false
control_type: "Technical"
iso27001: "A.8.34"
nis2: "-"
bio2: "-"
security_requirement:
  - "SR-9"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-t

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

# EXT-T.34 - Audit Test Bescherming

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-T.34 |
| **Categorie** | EXT-T - Technical Operations |
| **Prioriteit** | 4 (High) |
| **Baseline** | Nee - Optioneel |
| **Type** | Technical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.34 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | - |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-9|SR-9]]

## Beschrijving

Plan en beperk audit tests om verstoring van productiesystemen te minimaliseren.

## Implementatie Richtlijnen

### Stappen

1. Definieer audit testprocedure
2. Plan tests in change process
3. Maak backup voor test
4. Beperk scope
5. Documenteer resultaten

### Best Practices

- Tests in maintenance window
- Backup voor pentest
- Scope beperking
- Rollback procedure

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

- Zie andere controls in categorie [[Controls/EXT-T|EXT-T]]
