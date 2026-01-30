---
id: "EXT-O.2"
type: control
category: "EXT-O1"
category_name: "Security Governance"
control_name: "Beveiligingsrollen en Verantwoordelijkheden"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.2"
nis2: "Art.20"
bio2: "B2.1"
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

# EXT-O.2 - Beveiligingsrollen en Verantwoordelijkheden

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.2 |
| **Categorie** | EXT-O1 - Security Governance |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.2 |
| [[Frameworks/NIS2|NIS2]] | Art.20 |
| [[Frameworks/BIO2|BIO2]] | B2.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-1|SR-1]]

## Beschrijving

Definieer en wijs beveiligingsrollen en verantwoordelijkheden toe aan specifieke functies binnen de organisatie.

## Implementatie Richtlijnen

### Stappen

1. Identificeer benodigde security rollen
2. Stel RACI matrix op
3. Wijs rollen toe aan functies/personen
4. Documenteer in functieprofielen
5. Communiceer verantwoordelijkheden

### Best Practices

- CISO rapporteert aan directie
- Security Champions per afdeling
- Duidelijke escalatiepaden
- Periodieke review van rollen

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
