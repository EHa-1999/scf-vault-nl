---
id: "CIS-7.4"
type: control
category: "CIS 7"
category_name: "Continu Kwetsbaarheidsbeheer"
control_name: "Voer Geautomatiseerd Applicatie Patchbeheer Uit"
priority: 4
priority_label: "High"
baseline: true
control_type: "Foundational"
iso27001: "A.8.8"
nis2: "Art.21(2)(f)"
bio2: "8.13"
core_requirement: "SR-7: Vulnerability Management"
security_requirement:
  - "SR-2"
  - "SR-10"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-7
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

# CIS-7.4 - Voer Geautomatiseerd Applicatie Patchbeheer Uit

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Continu Kwetsbaarheidsbeheer |
| **Prioriteit** | 4 - High |
| **Type** | Foundational |
| **Extended Baseline** | Ja |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.8 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(f) |
| [[Frameworks/BIO2|BIO2]] | 8.13 |
| **Core Requirement** | SR-7: Vulnerability Management |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-2 - Risk Assessment & Management|SR-2 - Risk Assessment & Management]]
- [[Frameworks/Security-Requirements/SR-10 - Continuous Improvement|SR-10 - Continuous Improvement]]

## Beschrijving

Perform automated application patch management.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan continuous vulnerability management.

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
