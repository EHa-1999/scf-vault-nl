---
id: "EXT-HR.2"
type: control
category: "EXT-HR1"
category_name: "Employment Security"
control_name: "Arbeidsvoorwaarden en Condities"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "People"
iso27001: "A.6.2"
nis2: "-"
bio2: "B3.2"
security_requirement:
  - "SR-11"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-hr

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

# EXT-HR.2 - Arbeidsvoorwaarden en Condities

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-HR.2 |
| **Categorie** | EXT-HR1 - Employment Security |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | People |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.6.2 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B3.2 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-11|SR-11]]

## Beschrijving

Neem beveiligingsverantwoordelijkheden op in arbeidsovereenkomsten en voorwaarden.

## Implementatie Richtlijnen

### Stappen

1. Integreer security clausules
2. Implementeer geheimhouding
3. Onderteken gedragscode
4. Koppel aan sanctiebeleid
5. Documenteer

### Best Practices

- Security clausules standaard
- Aparte NDA
- Gedragscode bij onboarding
- Periodieke bevestiging

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

- Zie andere controls in categorie [[Controls/EXT-HR|EXT-HR]]
