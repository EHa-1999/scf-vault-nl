---
id: "SR-4"
type: security-requirement
name: "Cryptographic Controls & Gegevensbescherming"
name_nl: "Cryptografische Controls & Gegevensbescherming"
cis_categories:
  - "CIS 3"
nist_csf:
  - "PR.DS"
iso27001:
  - "A.5.33"
  - "A.5.34"
  - "A.8.24"
nis2:
  - "Art.21(2)(d)"
  - "Art.21(2)(h)"
bio2:
  - "5.33"
  - "5.34"
  - "8.24"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-4 - Cryptographic Controls & Gegevensbescherming

> **Cryptografische Controls & Gegevensbescherming**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-4 |
| **Naam** | Cryptographic Controls & Gegevensbescherming |
| **CIS Categorieën** | CIS 3 |
| **NIST CSF** | PR.DS |

## Beschrijving

Cryptografische controls en gegevensbescherming omvatten het gebruik van encryptie en andere cryptografische technieken om de vertrouwelijkheid, integriteit en authenticiteit van gegevens te waarborgen.

## Doelstellingen

- Classificeren van gegevens naar gevoeligheid
- Implementeren van encryptie voor data at rest
- Implementeren van encryptie voor data in transit
- Beheren van cryptografische sleutels
- Implementeren van data loss prevention

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| PR | PR.DS |

### ISO 27001:2022

A.5.33, A.5.34, A.8.24

### NIS2

Art.21(2)(d), Art.21(2)(h)

### BIO2

5.33, 5.34, 8.24



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-4")
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
WHERE contains(control.security_requirement, "SR-4")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-4")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

*Geen directe relaties*

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
