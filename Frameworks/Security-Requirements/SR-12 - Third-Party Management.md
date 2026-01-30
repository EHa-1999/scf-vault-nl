---
id: "SR-12"
type: security-requirement
name: "Third-Party Management"
name_nl: "Leveranciersbeheer"
cis_categories:
  - "CIS 15"
nist_csf:
  - "ID.SC"
  - "ID.GV"
iso27001:
  - "A.5.19"
  - "A.5.20"
  - "A.5.21"
  - "A.5.22"
  - "A.5.23"
nis2:
  - "Art.21(2)(d)"
  - "Art.21(3)"
bio2:
  - "5.19"
  - "5.20"
  - "5.21"
  - "5.22"
  - "5.23"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-12 - Third-Party Management

> **Leveranciersbeheer**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-12 |
| **Naam** | Third-Party Management |
| **CIS Categorieën** | CIS 15 |
| **NIST CSF** | ID.SC, ID.GV |

## Beschrijving

Leveranciersbeheer waarborgt dat security risico's gerelateerd aan leveranciers, partners en andere derde partijen adequaat worden beheerst gedurende de gehele relatie.

## Doelstellingen

- Beoordelen van leveranciers security posture
- Opnemen van security requirements in contracten
- Monitoren van leveranciers compliance
- Beheren van toegang voor derde partijen
- Veilig beëindigen van leveranciersrelaties

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| ID | ID.SC |
| ID | ID.GV |

### ISO 27001:2022

A.5.19, A.5.20, A.5.21, A.5.22, A.5.23

### NIS2

Art.21(2)(d), Art.21(3)

### BIO2

5.19, 5.20, 5.21, 5.22, 5.23



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-12")
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
WHERE contains(control.security_requirement, "SR-12")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-12")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

*Geen directe relaties*

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
