---
id: "EXT-HR.5"
type: control
category: "EXT-HR2"
category_name: "HR Processes"
control_name: "Beëindiging Dienstverband Beveiliging"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "People"
iso27001: "A.6.5"
nis2: "-"
bio2: "B3.5"
security_requirement:
  - "SR-3"
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

# EXT-HR.5 - Beëindiging Dienstverband Beveiliging

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-HR.5 |
| **Categorie** | EXT-HR2 - HR Processes |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | People |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.6.5 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B3.5 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-3|SR-3]]

## Beschrijving

Zorg voor processen die security waarborgen bij beëindiging of wijziging van dienstverband.

## Implementatie Richtlijnen

### Stappen

1. Definieer offboarding procedure
2. Automatiseer toegang intrekking
3. Implementeer asset return
4. Voer exit interview uit
5. Verifieer afronding

### Best Practices

- ServiceNow workflow
- Automatische AD deactivatie
- Badge deactivatie
- Security checklist in exit

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
