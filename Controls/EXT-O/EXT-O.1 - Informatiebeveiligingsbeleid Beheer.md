---
id: "EXT-O.1"
type: control
category: "EXT-O1"
category_name: "Security Governance"
control_name: "Informatiebeveiligingsbeleid Beheer"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.1"
nis2: "Art.21(2)(a)"
bio2: "B1.1"
security_requirement:
  - "SR-1"
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

# EXT-O.1 - Informatiebeveiligingsbeleid Beheer

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.1 |
| **Categorie** | EXT-O1 - Security Governance |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.1 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(a) |
| [[Frameworks/BIO2|BIO2]] | B1.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-1|SR-1]]

## Beschrijving

Ontwikkel, implementeer en onderhoud een formeel informatiebeveiligingsbeleid dat is goedgekeurd door het management en gecommuniceerd naar alle stakeholders.

## Implementatie Richtlijnen

### Stappen

1. Stel informatiebeveiligingsbeleid op
2. Verkrijg goedkeuring van directie/bestuur
3. Communiceer beleid naar alle medewerkers
4. Implementeer jaarlijkse review cyclus
5. Documenteer wijzigingen en versies

### Best Practices

- Afstemming met organisatiestrategie
- Betrek alle relevante stakeholders
- Maak beleid praktisch toepasbaar
- Communiceer in begrijpelijke taal

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
