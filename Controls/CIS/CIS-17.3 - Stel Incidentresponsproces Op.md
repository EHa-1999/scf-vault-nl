---
id: "CIS-17.3"
type: control
category: "CIS 17"
category_name: "Incidentrespons Beheer"
control_name: "Stel Incidentresponsproces Op"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Basic"
iso27001: "A.5.25"
nis2: "Art.20"
bio2: "5.25"
core_requirement: "SR-8: Incident Response"
security_requirement:
  - "SR-1"
  - "SR-8"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-17
  - priority-5

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

# CIS-17.3 - Stel Incidentresponsproces Op

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Incidentrespons Beheer |
| **Prioriteit** | 5 - Critical |
| **Type** | Basic |
| **Extended Baseline** | Ja |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.25 |
| [[Frameworks/NIS2|NIS2]] | Art.20 |
| [[Frameworks/BIO2|BIO2]] | 5.25 |
| **Core Requirement** | SR-8: Incident Response |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-1 - Security Governance Framework|SR-1 - Security Governance Framework]]
- [[Frameworks/Security-Requirements/SR-8 - Incident Response & Recovery|SR-8 - Incident Response & Recovery]]

## Beschrijving

Establish and maintain an enterprise process for reporting incidents.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan incident response management.

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
