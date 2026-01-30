---
id: "EXT-SUP.4"
type: control
category: "EXT-SUP"
category_name: "Supplier Management"
control_name: "Leveranciersprestaties Monitoring"
priority: 4
priority_label: "High"
baseline: true
control_type: "Organizational"
iso27001: "A.5.22"
nis2: "-"
bio2: "B11.4"
security_requirement:
  - "SR-12"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-sup

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

# EXT-SUP.4 - Leveranciersprestaties Monitoring

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-SUP.4 |
| **Categorie** | EXT-SUP - Supplier Management |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.22 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B11.4 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-12|SR-12]]

## Beschrijving

Monitor, review en audit leveranciersprestaties op informatiebeveiliging.

## Implementatie Richtlijnen

### Stappen

1. Definieer monitoring framework
2. Stel KPIs vast
3. Plan audits
4. Track incidenten per leverancier
5. Escaleer bij non-compliance

### Best Practices

- Kwartaalrapportage kritieke leveranciers
- Jaarlijkse audit
- Incident tracking
- Escalatieprocedure

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

- Zie andere controls in categorie [[Controls/EXT-SUP|EXT-SUP]]
