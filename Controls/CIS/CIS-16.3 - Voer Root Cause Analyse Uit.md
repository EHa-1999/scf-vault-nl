---
id: "CIS-16.3"
type: control
category: "CIS 16"
category_name: "Applicatiebeveiliging"
control_name: "Voer Root Cause Analyse Uit"
priority: 3
priority_label: "Medium"
baseline: false
control_type: "Organizational"
iso27001: "A.8.29"
nis2: "Art.21(2)(f)"
bio2: "8.29"
core_requirement: "SR-5: Secure Development"
security_requirement:
  - "SR-5"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-16
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

# CIS-16.3 - Voer Root Cause Analyse Uit

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Applicatiebeveiliging |
| **Prioriteit** | 3 - Medium |
| **Type** | Organizational |
| **Extended Baseline** | Nee |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.29 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(f) |
| [[Frameworks/BIO2|BIO2]] | 8.29 |
| **Core Requirement** | SR-5: Secure Development |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-5 - Secure System Development & Maintenance|SR-5 - Secure System Development & Maintenance]]

## Beschrijving

Perform root cause analysis on security vulnerabilities.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan application software security.

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
