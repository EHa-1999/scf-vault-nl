---
id: "SR-3"
type: security-requirement
name: "Access Control & Identity Management"
name_nl: "Toegangsbeheer & Identiteitsbeheer"
cis_categories:
  - "CIS 5"
  - "CIS 6"
nist_csf:
  - "PR.AC"
  - "PR.AA"
iso27001:
  - "A.5.15"
  - "A.5.16"
  - "A.5.17"
  - "A.5.18"
  - "A.8.2"
  - "A.8.3"
nis2:
  - "Art.21(2)(i)"
bio2:
  - "5.15"
  - "5.16"
  - "5.17"
  - "5.18"
  - "8.01"
  - "8.02"
  - "8.03"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-3 - Access Control & Identity Management

> **Toegangsbeheer & Identiteitsbeheer**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-3 |
| **Naam** | Access Control & Identity Management |
| **CIS Categorieën** | CIS 5, CIS 6 |
| **NIST CSF** | PR.AC, PR.AA |

## Beschrijving

Toegangsbeheer en identiteitsbeheer waarborgt dat alleen geautoriseerde gebruikers toegang hebben tot systemen en gegevens, gebaseerd op het need-to-know principe en least privilege.

## Doelstellingen

- Beheren van gebruikersidentiteiten en accounts
- Implementeren van authenticatie mechanismen (incl. MFA)
- Toepassen van autorisatie en role-based access control
- Monitoren en reviewen van toegangsrechten
- Beheren van privileged access

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| PR | PR.AC |
| PR | PR.AA |

### ISO 27001:2022

A.5.15, A.5.16, A.5.17, A.5.18, A.8.2, A.8.3

### NIS2

Art.21(2)(i)

### BIO2

5.15, 5.16, 5.17, 5.18, 8.01, 8.02, 8.03



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-3")
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
WHERE contains(control.security_requirement, "SR-3")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-3")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

*Geen directe relaties*

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
