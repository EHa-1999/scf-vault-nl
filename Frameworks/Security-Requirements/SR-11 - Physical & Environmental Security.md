---
id: "SR-11"
type: security-requirement
name: "Physical & Environmental Security"
name_nl: "Fysieke & Omgevingsbeveiliging"
cis_categories:
  - "CIS 1"
  - "CIS 4"
nist_csf:
  - "PR.AC"
  - "PR.IP"
  - "PR.PT"
iso27001:
  - "A.7.1"
  - "A.7.2"
  - "A.7.3"
  - "A.7.4"
  - "A.7.5"
  - "A.7.6"
  - "A.7.7"
  - "A.7.8"
  - "A.7.9"
  - "A.7.10"
  - "A.7.11"
  - "A.7.12"
  - "A.7.13"
  - "A.7.14"
nis2:
  - "Art.21(2)(c)"
  - "Art.21(2)(i)"
bio2:
  - "7.01"
  - "7.02"
  - "7.03"
  - "7.04"
  - "7.05"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-11 - Physical & Environmental Security

> **Fysieke & Omgevingsbeveiliging**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-11 |
| **Naam** | Physical & Environmental Security |
| **CIS Categorieën** | CIS 1, CIS 4 |
| **NIST CSF** | PR.AC, PR.IP, PR.PT |

## Beschrijving

Fysieke en omgevingsbeveiliging beschermt de fysieke assets, faciliteiten en omgeving waarin informatiesystemen opereren tegen ongeautoriseerde fysieke toegang, schade en verstoring.

## Doelstellingen

- Implementeren van fysieke toegangscontrole
- Beveiligen van apparatuur
- Beschermen tegen omgevingsdreigingen
- Veilig verwijderen van apparatuur
- Beheren van fysieke asset inventaris

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| PR | PR.AC |
| PR | PR.IP |
| PR | PR.PT |

### ISO 27001:2022

A.7.1, A.7.2, A.7.3, A.7.4, A.7.5, A.7.6, A.7.7, A.7.8, A.7.9, A.7.10, A.7.11, A.7.12, A.7.13, A.7.14

### NIS2

Art.21(2)(c), Art.21(2)(i)

### BIO2

7.01, 7.02, 7.03, 7.04, 7.05



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-11")
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
WHERE contains(control.security_requirement, "SR-11")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-11")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

*Geen directe relaties*

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
