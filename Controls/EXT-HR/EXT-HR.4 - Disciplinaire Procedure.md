---
id: "EXT-HR.4"
type: control
category: "EXT-HR2"
category_name: "HR Processes"
control_name: "Disciplinaire Procedure"
priority: 4
priority_label: "High"
baseline: true
control_type: "People"
iso27001: "A.6.4"
nis2: "-"
bio2: "B3.4"
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

# EXT-HR.4 - Disciplinaire Procedure

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-HR.4 |
| **Categorie** | EXT-HR2 - HR Processes |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | People |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.6.4 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B3.4 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-11|SR-11]]

## Beschrijving

Implementeer een formele disciplinaire procedure voor medewerkers die security beleid schenden.

## Implementatie Richtlijnen

### Stappen

1. Definieer disciplinair beleid
2. Categoriseer sancties
3. Implementeer escalatie
4. Betrek CISO bij security zaken
5. Registreer in HR dossier

### Best Practices

- Onderdeel personeelsreglement
- Proportionele sancties
- Hoor en wederhoor
- Documentatie verplicht

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
