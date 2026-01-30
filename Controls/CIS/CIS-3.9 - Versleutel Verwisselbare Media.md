---
id: "CIS-3.9"
type: control
category: "CIS 3"
category_name: "Gegevensbescherming"
control_name: "Versleutel Verwisselbare Media"
priority: 4
priority_label: "High"
baseline: true
control_type: "Foundational"
iso27001: "A.7.10"
nis2: "Art.21(2)(g)"
bio2: "8.03"
core_requirement: "SR-4: Data Protection"
security_requirement:
  - "SR-4"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-3
  - priority-4

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

# CIS-3.9 - Versleutel Verwisselbare Media

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Gegevensbescherming |
| **Prioriteit** | 4 - High |
| **Type** | Foundational |
| **Extended Baseline** | Ja |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.7.10 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(g) |
| [[Frameworks/BIO2|BIO2]] | 8.03 |
| **Core Requirement** | SR-4: Data Protection |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-4 - Cryptographic Controls & Data Protection|SR-4 - Cryptographic Controls & Data Protection]]

## Beschrijving

Encrypt data on removable media.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan data protection.

## Implementatie Richtlijnen

Algemene richtlijnen voor implementatie van deze control:

1. Inventariseer welke componenten binnen scope vallen
2. Bepaal de specifieke implementatie per component
3. Definieer Definition of Done criteria
4. Verzamel vereist bewijsmateriaal
5. Plan periodieke reviews

## Gerelateerde Controls

<!-- Links naar gerelateerde controls -->

## Component Implementaties

```dataview
TABLE 
  component as "Component",
  system as "Systeem", 
  impl_status as "Status",
  next_review as "Review"
FROM "Implementations"
WHERE contains(control, this.file.name)
SORT system ASC
```

## Risico's bij Ontbreken

```dataview
TABLE 
  risk_level as "Niveau",
  status as "Status"
FROM "Risks"
WHERE contains(controls, this.file.link)
SORT risk_level DESC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-27 | Initiële versie | @architect |
