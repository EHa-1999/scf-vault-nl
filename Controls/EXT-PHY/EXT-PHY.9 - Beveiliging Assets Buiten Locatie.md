---
id: "EXT-PHY.9"
type: control
category: "EXT-PHY3"
category_name: "Equipment Security"
control_name: "Beveiliging Assets Buiten Locatie"
priority: 4
priority_label: "High"
baseline: true
control_type: "Physical"
iso27001: "A.7.9"
nis2: "-"
bio2: "-"
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

# EXT-PHY.9 - Beveiliging Assets Buiten Locatie

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-PHY.9 |
| **Categorie** | EXT-PHY3 - Equipment Security |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Physical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.7.9 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | - |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-11|SR-11]]

## Beschrijving

Bescherm organisatie-assets wanneer deze buiten de normale werklocatie worden gebruikt.

## Implementatie Richtlijnen

### Stappen

1. Definieer thuiswerk beleid
2. Implementeer encryptie
3. Activeer remote wipe
4. Communiceer meldplicht
5. Monitor naleving

### Best Practices

- BitLocker verplicht
- Kabelslot laptops
- Intune MDM
- Meldplicht verlies 24 uur

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
