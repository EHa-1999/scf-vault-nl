---
id: "SR-8"
type: security-requirement
name: "Incident Response & Recovery"
name_nl: "Incident Response & Herstel"
cis_categories:
  - "CIS 11"
  - "CIS 17"
nist_csf:
  - "RS.RP"
  - "RS.CO"
  - "RS.AN"
  - "RS.MI"
  - "RS.IM"
  - "RC.RP"
  - "RC.IM"
  - "RC.CO"
iso27001:
  - "A.5.24"
  - "A.5.25"
  - "A.5.26"
  - "A.5.27"
  - "A.5.28"
  - "A.5.29"
  - "A.5.30"
nis2:
  - "Art.21(2)(b)"
  - "Art.21(2)(c)"
bio2:
  - "5.24"
  - "5.25"
  - "5.26"
  - "5.29"
  - "5.30"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-8 - Incident Response & Recovery

> **Incident Response & Herstel**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-8 |
| **Naam** | Incident Response & Recovery |
| **CIS Categorieën** | CIS 11, CIS 17 |
| **NIST CSF** | RS.RP, RS.CO, RS.AN, RS.MI, RS.IM, RC.RP, RC.IM, RC.CO |

## Beschrijving

Incident response en recovery omvat de processen en procedures voor het detecteren, analyseren, beheersen en herstellen van security incidents, inclusief business continuity.

## Doelstellingen

- Definiëren van incident response procedures
- Opzetten van incident response team
- Implementeren van backup en recovery
- Uitvoeren van incident response oefeningen
- Uitvoeren van post-incident reviews

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| RS | RS.RP |
| RS | RS.CO |
| RS | RS.AN |
| RS | RS.MI |
| RS | RS.IM |
| RC | RC.RP |
| RC | RC.IM |
| RC | RC.CO |

### ISO 27001:2022

A.5.24, A.5.25, A.5.26, A.5.27, A.5.28, A.5.29, A.5.30

### NIS2

Art.21(2)(b), Art.21(2)(c)

### BIO2

5.24, 5.25, 5.26, 5.29, 5.30



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-8")
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
WHERE contains(control.security_requirement, "SR-8")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-8")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

- [[SR-1 - Security Governance Framework|SR-1]] (via CIS 17)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
