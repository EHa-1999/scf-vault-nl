---
id: "CIS-4.9"
type: control
category: "CIS 4"
category_name: "Veilige Configuratie van Systemen en Software"
control_name: "Configureer Vertrouwde DNS-servers"
priority: 4
priority_label: "High"
baseline: false
control_type: "Foundational"
iso27001: "A.8.22"
nis2: "Art.21(2)(b)"
bio2: "8.15"
core_requirement: "SR-7: Network Security"
security_requirement:
  - "SR-11"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-4
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

# CIS-4.9 - Configureer Vertrouwde DNS-servers

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Veilige Configuratie van Systemen en Software |
| **Prioriteit** | 4 - High |
| **Type** | Foundational |
| **Extended Baseline** | Nee |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.22 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(b) |
| [[Frameworks/BIO2|BIO2]] | 8.15 |
| **Core Requirement** | SR-7: Network Security |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-11 - Physical & Environmental Security|SR-11 - Physical & Environmental Security]]

## Beschrijving

Configure trusted DNS servers on enterprise assets.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan secure configuration of enterprise assets and software.

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
