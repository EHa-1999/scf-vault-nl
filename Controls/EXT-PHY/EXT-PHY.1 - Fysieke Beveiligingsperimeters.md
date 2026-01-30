---
id: "EXT-PHY.1"
type: control
category: "EXT-PHY1"
category_name: "Secure Areas"
control_name: "Fysieke Beveiligingsperimeters"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Physical"
iso27001: "A.7.1"
nis2: "-"
bio2: "B7.1"
security_requirement:
  - "SR-11"
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

# EXT-PHY.1 - Fysieke Beveiligingsperimeters

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-PHY.1 |
| **Categorie** | EXT-PHY1 - Secure Areas |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Physical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.7.1 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B7.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-11|SR-11]]

## Beschrijving

Definieer en implementeer beveiligingsperimeters om gebieden te beschermen met gevoelige informatie.

## Implementatie Richtlijnen

### Stappen

1. Definieer perimeters per locatie
2. Classificeer beveiligingszones
3. Implementeer toegangspunten
4. Activeer bewaking
5. Review periodiek

### Best Practices

- Gebouwgrenzen en hekwerk
- Gecontroleerde toegangspunten
- Separate datacenter zone
- Bezoekers registratie

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
