---
id: "SR-1"
type: security-requirement
name: "Security Governance Framework"
name_nl: "Security Governance Framework"
cis_categories:
  - "CIS 17"
nist_csf:
  - "ID.GV"
  - "ID.RM"
iso27001:
  - "5.1"
  - "5.2"
  - "5.3"
  - "A.5.1"
nis2:
  - "Art.20"
  - "Art.21(1)"
bio2:
  - "5.01"
  - "5.02"
  - "5.03"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-1 - Security Governance Framework

> **Security Governance Framework**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-1 |
| **Naam** | Security Governance Framework |
| **CIS Categorieën** | CIS 17 |
| **NIST CSF** | ID.GV, ID.RM |

## Beschrijving

Het Security Governance Framework vormt de basis voor alle beveiligingsactiviteiten binnen de organisatie. Het definieert de structuur, verantwoordelijkheden, beleidslijnen en processen waarmee informatiebeveiliging wordt bestuurd en beheerst.

## Doelstellingen

- Vaststellen van security beleid en richtlijnen
- Definiëren van rollen en verantwoordelijkheden
- Inrichten van security governance structuur
- Periodieke management review en rapportage
- Afstemming met organisatiestrategie en risk appetite

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| ID | ID.GV |
| ID | ID.RM |

### ISO 27001:2022

5.1, 5.2, 5.3, A.5.1

### NIS2

Art.20, Art.21(1)

### BIO2

5.01, 5.02, 5.03



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-1")
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
WHERE contains(control.security_requirement, "SR-1")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-1")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

- [[SR-8 - Incident Response & Recovery|SR-8]] (via CIS 17)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
