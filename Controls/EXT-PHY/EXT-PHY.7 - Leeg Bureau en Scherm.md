---
id: "EXT-PHY.7"
type: control
category: "EXT-PHY3"
category_name: "Equipment Security"
control_name: "Leeg Bureau en Scherm"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Physical"
iso27001: "A.7.7"
nis2: "-"
bio2: "B7.8"
security_requirement:
  - "SR-4"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-phy

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

# EXT-PHY.7 - Leeg Bureau en Scherm

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-PHY.7 |
| **Categorie** | EXT-PHY3 - Equipment Security |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Physical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.7.7 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B7.8 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-4|SR-4]]

## Beschrijving

Implementeer clean desk policy en automatische screen lock.

## Implementatie Richtlijnen

### Stappen

1. Stel clean desk policy op
2. Configureer automatische screen lock
3. Voer controles uit
4. Implementeer sancties
5. Communiceer

### Best Practices

- Screen lock na 5 minuten
- Vertrouwelijk in kasten
- Maandelijkse controles
- Papierversnipperaar

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

- Zie andere controls in categorie [[Controls/EXT-PHY|EXT-PHY]]
