---
id: "SR-13"
type: security-requirement
name: "Privacy"
name_nl: "Privacy"
cis_categories:
  - "EXT-P"
nist_csf:
  - "ID.GV"
  - "PR.DS"
  - "PR.IP"
iso27001:
  - "A.5.34"
nis2:
  - "Art.21(2)(h)"
bio2:
  - "5.34"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-13 - Privacy

> **Privacy**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-13 |
| **Naam** | Privacy |
| **CIS Categorieën** | EXT-P |
| **NIST CSF** | ID.GV, PR.DS, PR.IP |

## Beschrijving

Privacy omvat alle maatregelen om persoonsgegevens te beschermen conform de AVG en andere privacy wet- en regelgeving, inclusief Privacy by Design en rechten van betrokkenen.

## Doelstellingen

- Implementeren van Privacy by Design
- Uitvoeren van DPIA's
- Faciliteren van rechten van betrokkenen
- Beheren van verwerkingsregister
- Afhandelen van datalekken

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| ID | ID.GV |
| PR | PR.DS |
| PR | PR.IP |

### ISO 27001:2022

A.5.34

### NIS2

Art.21(2)(h)

### BIO2

5.34

### AVG/GDPR

Art.5'Art.6'Art.7'Art.12-22'Art.24'Art.25'Art.30'Art.32'Art.33'Art.34'Art.35'Art.37

## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-13")
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
WHERE contains(control.security_requirement, "SR-13")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-13")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

*Geen directe relaties*

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
