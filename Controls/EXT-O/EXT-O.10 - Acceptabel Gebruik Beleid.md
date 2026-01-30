---
id: "EXT-O.10"
type: control
category: "EXT-O3"
category_name: "Asset & Information Management"
control_name: "Acceptabel Gebruik Beleid"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.10"
nis2: "-"
bio2: "B5.1"
security_requirement:
  - "SR-3"
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

# EXT-O.10 - Acceptabel Gebruik Beleid

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.10 |
| **Categorie** | EXT-O3 - Asset & Information Management |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.10 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B5.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-3|SR-3]]

## Beschrijving

Definieer en handhaaf regels voor acceptabel gebruik van informatie en ICT-middelen.

## Implementatie Richtlijnen

### Stappen

1. Stel ICT gedragscode op
2. Verkrijg ondertekening medewerkers
3. Implementeer sanctiebeleid
4. Monitor naleving
5. Review jaarlijks

### Best Practices

- Onderdeel van onboarding
- Jaarlijkse herbevestiging
- Praktische voorbeelden
- Duidelijke sancties

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
