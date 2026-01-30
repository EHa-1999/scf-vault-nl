---
id: "SR-5"
type: security-requirement
name: "Secure System Development & Maintenance"
name_nl: "Veilige Systeemontwikkeling & Onderhoud"
cis_categories:
  - "CIS 16"
nist_csf:
  - "PR.DS"
  - "PR.IP"
iso27001:
  - "A.8.25"
  - "A.8.26"
  - "A.8.27"
  - "A.8.28"
  - "A.8.29"
  - "A.8.30"
  - "A.8.31"
nis2:
  - "Art.21(2)(e)"
bio2:
  - "8.25"
  - "8.26"
  - "8.27"
  - "8.28"
  - "8.31"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-5 - Secure System Development & Maintenance

> **Veilige Systeemontwikkeling & Onderhoud**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-5 |
| **Naam** | Secure System Development & Maintenance |
| **CIS Categorieën** | CIS 16 |
| **NIST CSF** | PR.DS, PR.IP |

## Beschrijving

Veilige systeemontwikkeling en onderhoud waarborgt dat security wordt geïntegreerd in de volledige software development lifecycle (SDLC), van ontwerp tot decommissioning.

## Doelstellingen

- Integreren van security in SDLC
- Uitvoeren van security code reviews
- Implementeren van secure coding practices
- Beheren van development/test/productie omgevingen
- Uitvoeren van security testing

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| PR | PR.DS |
| PR | PR.IP |

### ISO 27001:2022

A.8.25, A.8.26, A.8.27, A.8.28, A.8.29, A.8.30, A.8.31

### NIS2

Art.21(2)(e)

### BIO2

8.25, 8.26, 8.27, 8.28, 8.31



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-5")
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
WHERE contains(control.security_requirement, "SR-5")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-5")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

*Geen directe relaties*

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
