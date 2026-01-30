---
id: "EXT-HR.1"
type: control
category: "EXT-HR1"
category_name: "Employment Security"
control_name: "Screening voor Indiensttreding"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "People"
iso27001: "A.6.1"
nis2: "-"
bio2: "B3.1"
security_requirement:
  - "SR-11"
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

# EXT-HR.1 - Screening voor Indiensttreding

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-HR.1 |
| **Categorie** | EXT-HR1 - Employment Security |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | People |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.6.1 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B3.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-11|SR-11]]

## Beschrijving

Voer achtergrondcontroles uit op alle kandidaten voorafgaand aan indiensttreding, proportioneel aan de functie.

## Implementatie Richtlijnen

### Stappen

1. Definieer screening criteria
2. Implementeer VOG vereiste
3. Voer referentiechecks uit
4. Identificeer vertrouwensfuncties
5. Documenteer resultaten

### Best Practices

- VOG verplicht voor alle functies
- AIVD screening voor vertrouwensfuncties
- Referentiecheck standaard
- Afronding vóór start

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
