---
id: "SR-9"
type: security-requirement
name: "Compliance & Audit Management"
name_nl: "Compliance & Auditbeheer"
cis_categories:
  - "CIS 8"
nist_csf:
  - "ID.GV"
  - "PR.IP"
iso27001:
  - "9.2"
  - "9.3"
  - "A.5.31"
  - "A.5.32"
  - "A.5.35"
  - "A.5.36"
nis2:
  - "Art.21(2)(f)"
bio2:
  - "5.31"
  - "5.35"
  - "5.36"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-9 - Compliance & Audit Management

> **Compliance & Auditbeheer**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-9 |
| **Naam** | Compliance & Audit Management |
| **CIS Categorieën** | CIS 8 |
| **NIST CSF** | ID.GV, PR.IP |

## Beschrijving

Compliance en auditbeheer waarborgt dat de organisatie voldoet aan relevante wet- en regelgeving, contractuele verplichtingen en interne beleidslijnen, en dat dit aantoonbaar is.

## Doelstellingen

- Identificeren van compliance requirements
- Implementeren van compliance monitoring
- Uitvoeren van interne audits
- Beheren van audit bevindingen
- Rapporteren aan stakeholders

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| ID | ID.GV |
| PR | PR.IP |

### ISO 27001:2022

9.2, 9.3, A.5.31, A.5.32, A.5.35, A.5.36

### NIS2

Art.21(2)(f)

### BIO2

5.31, 5.35, 5.36



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-9")
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
WHERE contains(control.security_requirement, "SR-9")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-9")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

- [[SR-6 - Security Monitoring & Logging|SR-6]] (via CIS 8)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
