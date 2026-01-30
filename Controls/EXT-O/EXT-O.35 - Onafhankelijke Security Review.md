---
id: "EXT-O.35"
type: control
category: "EXT-O5"
category_name: "Compliance & Audit"
control_name: "Onafhankelijke Security Review"
priority: 4
priority_label: "High"
baseline: true
control_type: "Organizational"
iso27001: "A.5.35"
nis2: "Art.21(2)(f)"
bio2: "B13.3"
security_requirement:
  - "SR-10"
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

# EXT-O.35 - Onafhankelijke Security Review

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.35 |
| **Categorie** | EXT-O5 - Compliance & Audit |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.35 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(f) |
| [[Frameworks/BIO2|BIO2]] | B13.3 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-10|SR-10]]

## Beschrijving

Voer periodiek onafhankelijke reviews uit van de informatiebeveiligingsaanpak en implementatie.

## Implementatie Richtlijnen

### Stappen

1. Plan jaarlijkse externe audit
2. Voer penetratietests uit
3. Documenteer bevindingen
4. Stel verbeterplan op
5. Rapporteer aan management

### Best Practices

- ISO 27001 certificering
- Jaarlijkse pentest
- Halfjaarlijkse vulnerability assessment
- Kwartaalrapportage

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
