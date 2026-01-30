---
id: "EXT-T.6"
type: control
category: "EXT-T"
category_name: "Technical Operations"
control_name: "Capaciteitsbeheer"
priority: 4
priority_label: "High"
baseline: true
control_type: "Technical"
iso27001: "A.8.6"
nis2: "-"
bio2: "-"
security_requirement:
  - "SR-6"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-t

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

# EXT-T.6 - Capaciteitsbeheer

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-T.6 |
| **Categorie** | EXT-T - Technical Operations |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Technical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.6 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | - |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-6|SR-6]]

## Beschrijving

Monitor en beheer de capaciteit van IT-resources om beschikbaarheid te waarborgen.

## Implementatie Richtlijnen

### Stappen

1. Implementeer capaciteitsmonitoring
2. Definieer thresholds
3. Configureer alerts
4. Plan capaciteit
5. Rapporteer trends

### Best Practices

- CPU/memory/disk monitoring
- Alerting bij 80%
- Capacity planning
- Trend analyse

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

- Zie andere controls in categorie [[Controls/EXT-T|EXT-T]]
