---
id: "CIS-2.7"
type: control
category: "CIS 2"
category_name: "Inventarisatie en Beheer van Software"
control_name: "Beheer Whitelist van Scripts"
priority: 2
priority_label: "Low"
baseline: false
control_type: "Organizational"
iso27001: "A.8.19"
nis2: "Art.21(2)(f)"
bio2: "8.08"
core_requirement: "SR-5: Secure Development"
security_requirement:
  - "SR-5"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-2
  - priority-2

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

# CIS-2.7 - Beheer Whitelist van Scripts

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Inventarisatie en Beheer van Software |
| **Prioriteit** | 2 - Low |
| **Type** | Organizational |
| **Extended Baseline** | Nee |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.19 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(f) |
| [[Frameworks/BIO2|BIO2]] | 8.08 |
| **Core Requirement** | SR-5: Secure Development |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-5 - Secure System Development & Maintenance|SR-5 - Secure System Development & Maintenance]]

## Beschrijving

Use technical controls to ensure that only authorized scripts can execute on enterprise assets.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan inventory and control of software assets.

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
