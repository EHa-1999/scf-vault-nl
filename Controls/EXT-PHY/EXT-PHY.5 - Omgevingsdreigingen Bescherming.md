---
id: "EXT-PHY.5"
type: control
category: "EXT-PHY2"
category_name: "Environmental Protection"
control_name: "Omgevingsdreigingen Bescherming"
priority: 4
priority_label: "High"
baseline: true
control_type: "Physical"
iso27001: "A.7.5"
nis2: "-"
bio2: "B7.4"
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

# EXT-PHY.5 - Omgevingsdreigingen Bescherming

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-PHY.5 |
| **Categorie** | EXT-PHY2 - Environmental Protection |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Physical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.7.5 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B7.4 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-11|SR-11]]

## Beschrijving

Bescherm tegen fysieke en omgevingsdreigingen zoals brand, water en vandalisme.

## Implementatie Richtlijnen

### Stappen

1. Inventariseer omgevingsrisicos
2. Implementeer brandbeveiliging
3. Installeer waterdetectie
4. Configureer klimaatbeheersing
5. Test systemen

### Best Practices

- Automatische brandmelding
- Waterdetectie serverruimte
- UPS en noodstroom
- Klimaat 18-24°C

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
