---
id: "EXT-O.28"
type: control
category: "EXT-O4"
category_name: "Operational Security"
control_name: "Bewijsmateriaal Verzamelprocedures"
priority: 4
priority_label: "High"
baseline: true
control_type: "Organizational"
iso27001: "A.5.28"
nis2: "-"
bio2: "B4.4"
security_requirement:
  - "SR-8"
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

# EXT-O.28 - Bewijsmateriaal Verzamelprocedures

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.28 |
| **Categorie** | EXT-O4 - Operational Security |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.28 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B4.4 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-8|SR-8]]

## Beschrijving

Definieer procedures voor het verzamelen en bewaren van bewijsmateriaal bij security incidenten.

## Implementatie Richtlijnen

### Stappen

1. Documenteer forensische procedures
2. Implementeer chain of custody
3. Train personeel
4. Contract externe expertise
5. Test procedures

### Best Practices

- FTK/EnCase tooling
- Chain of custody formulieren
- Forensische imaging
- Externe partner SLA

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
