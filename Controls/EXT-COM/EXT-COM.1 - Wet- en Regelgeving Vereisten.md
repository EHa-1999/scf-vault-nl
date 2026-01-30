---
id: "EXT-COM.1"
type: control
category: "EXT-COM"
category_name: "Compliance"
control_name: "Wet- en Regelgeving Vereisten"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.31"
nis2: "-"
bio2: "B13.1"
security_requirement:
  - "SR-9"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-com

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

# EXT-COM.1 - Wet- en Regelgeving Vereisten

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-COM.1 |
| **Categorie** | EXT-COM - Compliance |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.31 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B13.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-9|SR-9]]

## Beschrijving

Identificeer en documenteer alle relevante wettelijke, regelgevende en contractuele vereisten.

## Implementatie Richtlijnen

### Stappen

1. Inventariseer wetgeving
2. Documenteer vereisten
3. Wijs verantwoordelijken aan
4. Monitor naleving
5. Rapporteer status

### Best Practices

- Compliance register: NIS2, AVG, BIO, Archiefwet, WOO
- FG voor privacy
- CISO voor security
- Kwartaalrapportage

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

- Zie andere controls in categorie [[Controls/EXT-COM|EXT-COM]]
