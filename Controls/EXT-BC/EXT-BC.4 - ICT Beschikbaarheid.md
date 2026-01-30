---
id: "EXT-BC.4"
type: control
category: "EXT-BC"
category_name: "Business Continuity"
control_name: "ICT Beschikbaarheid"
priority: 4
priority_label: "High"
baseline: true
control_type: "Technical"
iso27001: "-"
nis2: "Art.21(2)(c)"
bio2: "B12.4"
security_requirement:
  - "SR-9"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-bc

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

# EXT-BC.4 - ICT Beschikbaarheid

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-BC.4 |
| **Categorie** | EXT-BC - Business Continuity |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Technical |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | - |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(c) |
| [[Frameworks/BIO2|BIO2]] | B12.4 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-9|SR-9]]

## Beschrijving

Waarborg de beschikbaarheid van ICT-voorzieningen conform bedrijfsvereisten.

## Implementatie Richtlijnen

### Stappen

1. Definieer SLAs
2. Implementeer monitoring
3. Configureer alerting
4. Rapporteer periodiek
5. Escaleer bij breach

### Best Practices

- ServiceNow SLA monitoring
- Uptime dashboards
- Automatische alerting
- Maandelijkse rapportage

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

- Zie andere controls in categorie [[Controls/EXT-BC|EXT-BC]]
