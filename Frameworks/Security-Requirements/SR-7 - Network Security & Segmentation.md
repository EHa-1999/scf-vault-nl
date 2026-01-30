---
id: "SR-7"
type: security-requirement
name: "Network Security & Segmentation"
name_nl: "Netwerkbeveiliging & Segmentatie"
cis_categories:
  - "CIS 12"
  - "CIS 13"
nist_csf:
  - "PR.AC"
  - "PR.PT"
  - "DE.CM"
iso27001:
  - "A.8.20"
  - "A.8.21"
  - "A.8.22"
  - "A.8.23"
nis2:
  - "Art.21(2)(c)"
bio2:
  - "8.20"
  - "8.21"
  - "8.22"
  - "8.23"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-7 - Network Security & Segmentation

> **Netwerkbeveiliging & Segmentatie**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-7 |
| **Naam** | Network Security & Segmentation |
| **CIS Categorieën** | CIS 12, CIS 13 |
| **NIST CSF** | PR.AC, PR.PT, DE.CM |

## Beschrijving

Netwerkbeveiliging en segmentatie beschermt de netwerk infrastructuur en waarborgt dat netwerken adequaat zijn gesegmenteerd om de impact van security incidents te beperken.

## Doelstellingen

- Ontwerpen van veilige netwerkarchitectuur
- Implementeren van netwerksegmentatie
- Configureren van firewalls en filtering
- Beveiligen van remote access
- Monitoren van netwerkverkeer

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| PR | PR.AC |
| PR | PR.PT |
| DE | DE.CM |

### ISO 27001:2022

A.8.20, A.8.21, A.8.22, A.8.23

### NIS2

Art.21(2)(c)

### BIO2

8.20, 8.21, 8.22, 8.23



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-7")
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
WHERE contains(control.security_requirement, "SR-7")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-7")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

*Geen directe relaties*

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
