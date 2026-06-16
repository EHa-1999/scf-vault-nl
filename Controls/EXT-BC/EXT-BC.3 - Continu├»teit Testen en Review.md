---
id: "EXT-BC.3"
type: control
category: "EXT-BC"
category_name: "Business Continuity"
control_name: "Continuïteit Testen en Review"
priority: 4
priority_label: "High"
baseline: true
control_type: "Organizational"
iso27001: "-"
nis2: "Art.21(2)(c)"
bio2: "B12.3"
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

# EXT-BC.3 - Continuïteit Testen en Review

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-BC.3 |
| **Categorie** | EXT-BC - Business Continuity |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | - |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(c) |
| [[Frameworks/BIO2|BIO2]] | B12.3 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-9|SR-9]]

## Beschrijving

Test en review continuïteitsplannen regelmatig om effectiviteit te waarborgen.

## Implementatie Richtlijnen

### Stappen

1. Plan tests
2. Definieer scenario's
3. Voer tests uit
4. Documenteer resultaten
5. Verwerk lessons learned

### Best Practices

- Jaarlijkse failover test
- Halfjaarlijkse tabletop
- Management rapportage
- BCP updates na test

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
