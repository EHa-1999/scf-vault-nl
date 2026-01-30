---
id: "EXT-T.33"
type: control
category: "EXT-T"
category_name: "Technical Operations"
control_name: "Testgegevens Bescherming"
priority: 4
priority_label: "High"
baseline: true
control_type: "Technical"
iso27001: "A.8.33"
nis2: "-"
bio2: "-"
security_requirement:
  - "SR-5"
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

# EXT-T.33 - Testgegevens Bescherming

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-T.33 |
| **Categorie** | EXT-T - Technical Operations |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Technical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.33 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | - |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-5|SR-5]]

## Beschrijving

Bescherm testgegevens door selectie, masking en beperkte toegang.

## Implementatie Richtlijnen

### Stappen

1. Stel testdata beleid op
2. Implementeer data masking
3. Vermijd productiedata in test
4. Beperk toegang
5. Verwijder na gebruik

### Best Practices

- Synthetische testdata
- Data masking tools
- Geen productiedata in test
- Toegang alleen developers

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
