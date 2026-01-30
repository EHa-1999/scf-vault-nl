---
id: "SR-10"
type: security-requirement
name: "Continuous Improvement"
name_nl: "Continue Verbetering"
cis_categories:
  - "CIS 7"
  - "CIS 18"
nist_csf:
  - "ID.RA"
  - "PR.IP"
iso27001:
  - "10.1"
  - "10.2"
nis2:
  - "Art.21(2)(f)"
bio2:
  - "5.07"
  - "8.08"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-10 - Continuous Improvement

> **Continue Verbetering**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-10 |
| **Naam** | Continuous Improvement |
| **CIS Categorieën** | CIS 7, CIS 18 |
| **NIST CSF** | ID.RA, PR.IP |

## Beschrijving

Continue verbetering omvat het systematisch evalueren en verbeteren van de effectiviteit van beveiligingsmaatregelen op basis van monitoring, testing en lessons learned.

## Doelstellingen

- Meten van security performance
- Uitvoeren van vulnerability assessments
- Uitvoeren van penetration testing
- Implementeren van verbeteracties
- Bijhouden van security trends en threats

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| ID | ID.RA |
| PR | PR.IP |

### ISO 27001:2022

10.1, 10.2

### NIS2

Art.21(2)(f)

### BIO2

5.07, 8.08



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-10")
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
WHERE contains(control.security_requirement, "SR-10")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-10")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

- [[SR-2 - Risk Assessment & Management|SR-2]] (via CIS 7, CIS 18)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
