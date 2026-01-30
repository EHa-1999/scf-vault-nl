---
id: "EXT-PHY.12"
type: control
category: "EXT-PHY4"
category_name: "Infrastructure"
control_name: "Bekabelingsbeveiliging"
priority: 4
priority_label: "High"
baseline: false
control_type: "Physical"
iso27001: "A.7.12"
nis2: "-"
bio2: "-"
security_requirement:
  - "SR-7"
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

# EXT-PHY.12 - Bekabelingsbeveiliging

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-PHY.12 |
| **Categorie** | EXT-PHY4 - Infrastructure |
| **Prioriteit** | 4 (High) |
| **Baseline** | Nee - Optioneel |
| **Type** | Physical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.7.12 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | - |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-7|SR-7]]

## Beschrijving

Bescherm bekabeling tegen onderschepping en beschadiging.

## Implementatie Richtlijnen

### Stappen

1. Definieer bekabelingsstandaard
2. Documenteer routing
3. Sluit patchkasten af
4. Voer inspecties uit
5. Gebruik glasvezel extern

### Best Practices

- Afgesloten patchkasten
- Kabelgoten beschermd
- Glasvezel extern
- Jaarlijkse inspectie

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
