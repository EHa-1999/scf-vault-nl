---
id: "EXT-O.7"
type: control
category: "EXT-O2"
category_name: "External Relations"
control_name: "Threat Intelligence Integratie"
priority: 4
priority_label: "High"
baseline: true
control_type: "Organizational"
iso27001: "A.5.7"
nis2: "Art.21(2)(b)"
bio2: "B4.1"
security_requirement:
  - "SR-6"
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

# EXT-O.7 - Threat Intelligence Integratie

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.7 |
| **Categorie** | EXT-O2 - External Relations |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.7 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(b) |
| [[Frameworks/BIO2|BIO2]] | B4.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-6|SR-6]]

## Beschrijving

Verzamel, analyseer en integreer dreigingsinformatie in security operations en besluitvorming.

## Implementatie Richtlijnen

### Stappen

1. Selecteer threat intelligence bronnen
2. Integreer feeds in SIEM
3. Analyseer relevantie
4. Vertaal naar acties
5. Deel briefings met stakeholders

### Best Practices

- Minimaal 3 bronnen actief
- NCSC feeds verplicht
- Wekelijkse threat briefing
- Automatische IOC verwerking

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
