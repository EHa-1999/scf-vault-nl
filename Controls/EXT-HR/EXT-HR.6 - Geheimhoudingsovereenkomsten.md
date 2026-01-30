---
id: "EXT-HR.6"
type: control
category: "EXT-HR2"
category_name: "HR Processes"
control_name: "Geheimhoudingsovereenkomsten"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "People"
iso27001: "A.6.6"
nis2: "-"
bio2: "B2.6"
security_requirement:
  - "SR-4"
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

# EXT-HR.6 - Geheimhoudingsovereenkomsten

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-HR.6 |
| **Categorie** | EXT-HR2 - HR Processes |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | People |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.6.6 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B2.6 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-4|SR-4]]

## Beschrijving

Laat medewerkers en externe partijen geheimhoudingsovereenkomsten tekenen.

## Implementatie Richtlijnen

### Stappen

1. Stel NDA templates op
2. Onderteken bij indiensttreding
3. Vereis NDA voor externen
4. Registreer in CMS
5. Monitor nalevingstermijnen

### Best Practices

- NDA in arbeidscontract
- Aparte NDA voor contractors
- Leveranciers-NDA in inkoop
- Register bijhouden

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
