---
id: "CIS-13.11"
type: control
category: "CIS 13"
category_name: "Netwerkmonitoring en Verdediging"
control_name: "Stem Alertdrempels Af"
priority: 3
priority_label: "Medium"
baseline: false
control_type: "Organizational"
iso27001: "A.8.16"
nis2: "Art.21(2)(h)"
bio2: "5.26"
core_requirement: "SR-6: Monitoring & Logging"
security_requirement:
  - "SR-7"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-13
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

# CIS-13.11 - Stem Alertdrempels Af

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Netwerkmonitoring en Verdediging |
| **Prioriteit** | 3 - Medium |
| **Type** | Organizational |
| **Extended Baseline** | Nee |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.16 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(h) |
| [[Frameworks/BIO2|BIO2]] | 5.26 |
| **Core Requirement** | SR-6: Monitoring & Logging |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-7 - Network Security & Segmentation|SR-7 - Network Security & Segmentation]]

## Beschrijving

Tune security event alerting thresholds.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan network monitoring and defense.

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
