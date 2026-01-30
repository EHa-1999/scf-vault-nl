---
id: "EXT-SUP.2"
type: control
category: "EXT-SUP"
category_name: "Supplier Management"
control_name: "Beveiliging in Leveranciersovereenkomsten"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.20"
nis2: "Art.21(2)(d)"
bio2: "B11.2"
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

# EXT-SUP.2 - Beveiliging in Leveranciersovereenkomsten

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-SUP.2 |
| **Categorie** | EXT-SUP - Supplier Management |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.20 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(d) |
| [[Frameworks/BIO2|BIO2]] | B11.2 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-12|SR-12]]

## Beschrijving

Neem relevante beveiligingseisen op in overeenkomsten met leveranciers.

## Implementatie Richtlijnen

### Stappen

1. Definieer standaard security clausules
2. Implementeer verwerkersovereenkomst
3. Neem audit recht op
4. Eis incident meldplicht
5. Vereis certificeringen

### Best Practices

- Verwerkersovereenkomst verplicht
- Right to audit
- Incident melding <24 uur
- ISO 27001 voor kritieke leveranciers

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
