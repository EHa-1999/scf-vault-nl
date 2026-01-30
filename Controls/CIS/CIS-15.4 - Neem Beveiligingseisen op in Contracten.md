---
id: "CIS-15.4"
type: control
category: "CIS 15"
category_name: "Leveranciersbeheer"
control_name: "Neem Beveiligingseisen op in Contracten"
priority: 3
priority_label: "Medium"
baseline: true
control_type: "Foundational"
iso27001: "A.5.20"
nis2: "Art.21(2)(d)"
bio2: "5.1"
core_requirement: "SR-2: Third-Party Risk"
security_requirement:
  - "SR-12"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-15
  - priority-3

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

# CIS-15.4 - Neem Beveiligingseisen op in Contracten

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Leveranciersbeheer |
| **Prioriteit** | 3 - Medium |
| **Type** | Foundational |
| **Extended Baseline** | Ja |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.20 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(d) |
| [[Frameworks/BIO2|BIO2]] | 5.1 |
| **Core Requirement** | SR-2: Third-Party Risk |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-12 - Third-Party Management|SR-12 - Third-Party Management]]

## Beschrijving

Ensure service provider contracts include security requirements.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan service provider management.

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
