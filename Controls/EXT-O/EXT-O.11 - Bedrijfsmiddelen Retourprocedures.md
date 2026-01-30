---
id: "EXT-O.11"
type: control
category: "EXT-O3"
category_name: "Asset & Information Management"
control_name: "Bedrijfsmiddelen Retourprocedures"
priority: 4
priority_label: "High"
baseline: true
control_type: "Organizational"
iso27001: "A.5.11"
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

# EXT-O.11 - Bedrijfsmiddelen Retourprocedures

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.11 |
| **Categorie** | EXT-O3 - Asset & Information Management |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.11 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B3.5 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-3|SR-3]]

## Beschrijving

Zorg voor procedures waarbij medewerkers alle bedrijfsmiddelen retourneren bij beëindiging dienstverband.

## Implementatie Richtlijnen

### Stappen

1. Definieer offboarding procedure
2. Maak asset checklist
3. Koppel aan HR proces
4. Verifieer retour
5. Escaleer bij incomplete retour

### Best Practices

- Automatische workflow
- Badge deactivatie
- Laptop inname verplicht
- Exit checklist

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
