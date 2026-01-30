---
id: "CIS-8.7"
type: control
category: "CIS 8"
category_name: "Auditlog Beheer"
control_name: "Verzamel URL-verzoek Logs"
priority: 3
priority_label: "Medium"
baseline: false
control_type: "Foundational"
iso27001: "A.8.15"
nis2: "Art.21(2)(h)"
bio2: "5.24"
core_requirement: "SR-6: Monitoring & Logging"
security_requirement:
  - "SR-6"
  - "SR-9"
status: draft
created: 2026-01-27
modified: 2026-01-27
tags:
  - control
  - cis-8
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

# CIS-8.7 - Verzamel URL-verzoek Logs

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | Auditlog Beheer |
| **Prioriteit** | 3 - Medium |
| **Type** | Foundational |
| **Extended Baseline** | Nee |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.15 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(h) |
| [[Frameworks/BIO2|BIO2]] | 5.24 |
| **Core Requirement** | SR-6: Monitoring & Logging |


## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-6 - Security Monitoring & Logging|SR-6 - Security Monitoring & Logging]]
- [[Frameworks/Security-Requirements/SR-9 - Compliance & Audit Management|SR-9 - Compliance & Audit Management]]

## Beschrijving

Collect URL request audit logs.

## Doel

Deze control draagt bij aan het mitigeren van risico's gerelateerd aan audit log management.

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
