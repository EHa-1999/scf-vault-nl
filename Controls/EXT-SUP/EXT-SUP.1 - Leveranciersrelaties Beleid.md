---
id: "EXT-SUP.1"
type: control
category: "EXT-SUP"
category_name: "Supplier Management"
control_name: "Leveranciersrelaties Beleid"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.19"
nis2: "Art.21(2)(d)"
bio2: "B11.1"
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

# EXT-SUP.1 - Leveranciersrelaties Beleid

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-SUP.1 |
| **Categorie** | EXT-SUP - Supplier Management |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.19 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(d) |
| [[Frameworks/BIO2|BIO2]] | B11.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-12|SR-12]]

## Beschrijving

Definieer en implementeer beleid voor het beheren van informatiebeveiliging in leveranciersrelaties.

## Implementatie Richtlijnen

### Stappen

1. Stel leveranciersbeleid op
2. Definieer classificatiecriteria
3. Implementeer due diligence
4. Onderhoud leveranciersregister
5. Review jaarlijks

### Best Practices

- Classificatie: Kritiek/Hoog/Medium/Laag
- Security assessment bij inkoop >50k
- Jaarlijkse review kritieke leveranciers

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
