---
id: "EXT-O.13"
type: control
category: "EXT-O3"
category_name: "Asset & Information Management"
control_name: "Informatie Labeling"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.13"
nis2: "-"
bio2: "B8.3"
security_requirement:
  - "SR-4"
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

# EXT-O.13 - Informatie Labeling

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.13 |
| **Categorie** | EXT-O3 - Asset & Information Management |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.13 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B8.3 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-4|SR-4]]

## Beschrijving

Implementeer procedures voor het labelen van informatie conform het classificatieschema.

## Implementatie Richtlijnen

### Stappen

1. Definieer label procedures
2. Configureer technische labeling
3. Train medewerkers
4. Implementeer automatische labeling
5. Monitor naleving

### Best Practices

- Microsoft Purview
- Visuele watermarks
- Label inheritance
- Content-based labeling

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
