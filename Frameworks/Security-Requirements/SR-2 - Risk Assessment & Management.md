---
id: "SR-2"
type: security-requirement
name: "Risk Assessment & Management"
name_nl: "Risicobeoordeling & -beheer"
cis_categories:
  - "CIS 7"
  - "CIS 18"
nist_csf:
  - "ID.RA"
  - "ID.SC"
iso27001:
  - "6.1"
  - "8.2"
  - "8.3"
  - "A.5.7"
nis2:
  - "Art.21(2)(a)"
bio2:
  - "5.07"
  - "5.08"
  - "8.08"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-2 - Risk Assessment & Management

> **Risicobeoordeling & -beheer**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-2 |
| **Naam** | Risk Assessment & Management |
| **CIS Categorieën** | CIS 7, CIS 18 |
| **NIST CSF** | ID.RA, ID.SC |

## Beschrijving

Risicobeoordeling en -beheer omvat het systematisch identificeren, analyseren en behandelen van informatiebeveiligingsrisico's. Dit vormt de basis voor prioritering van beveiligingsmaatregelen en resource-allocatie.

## Doelstellingen

- Identificeren van assets en dreigingen
- Beoordelen van kwetsbaarheden en impact
- Bepalen van risico-acceptatieniveau
- Implementeren van risicobehandelingsplannen
- Monitoren en reviewen van risico's

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| ID | ID.RA |
| ID | ID.SC |

### ISO 27001:2022

6.1, 8.2, 8.3, A.5.7

### NIS2

Art.21(2)(a)

### BIO2

5.07, 5.08, 8.08



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-2")
SORT priority DESC
```

## Implementatie Status per Systeem

```dataview
TABLE WITHOUT ID
  system as "Systeem",
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "✅",
  length(filter(rows, (r) => r.impl_status = "Partial")) as "🔄",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "📋",
  length(filter(rows, (r) => r.impl_status = "Not Started")) as "⏳"
FROM "Implementations"
WHERE contains(control.security_requirement, "SR-2")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-2")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

- [[SR-10 - Continuous Improvement|SR-10]] (via CIS 7, CIS 18)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
