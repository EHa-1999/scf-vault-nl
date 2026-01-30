---
id: "SR-6"
type: security-requirement
name: "Security Monitoring & Logging"
name_nl: "Security Monitoring & Logging"
cis_categories:
  - "CIS 8"
nist_csf:
  - "DE.AE"
  - "DE.CM"
iso27001:
  - "A.8.15"
  - "A.8.16"
  - "A.8.17"
nis2:
  - "Art.21(2)(b)"
bio2:
  - "8.15"
  - "8.16"
  - "8.17"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - security-requirement
  - governance
---

# SR-6 - Security Monitoring & Logging

> **Security Monitoring & Logging**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | SR-6 |
| **Naam** | Security Monitoring & Logging |
| **CIS Categorieën** | CIS 8 |
| **NIST CSF** | DE.AE, DE.CM |

## Beschrijving

Security monitoring en logging omvat het verzamelen, bewaren en analyseren van security-relevante logs en events om dreigingen te detecteren en forensisch onderzoek mogelijk te maken.

## Doelstellingen

- Definiëren van logging requirements
- Implementeren van centralized logging
- Configureren van security event monitoring
- Uitvoeren van log analyse en alerting
- Waarborgen van log integriteit en retentie

## Framework Mappings

### NIST Cybersecurity Framework

| Functie | Categorie |
|---------|-----------|
| DE | DE.AE |
| DE | DE.CM |

### ISO 27001:2022

A.8.15, A.8.16, A.8.17

### NIS2

Art.21(2)(b)

### BIO2

8.15, 8.16, 8.17



## Gekoppelde Controls

```dataview
TABLE 
  priority_label as "Prioriteit",
  control_name as "Naam",
  status as "Status"
FROM "Controls"
WHERE contains(security_requirement, "SR-6")
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
WHERE contains(control.security_requirement, "SR-6")
GROUP BY system
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(security_requirements, "SR-6")
SORT risk_level DESC
```

## Relatie met andere Security Requirements

- [[SR-9 - Compliance & Audit Management|SR-9]] (via CIS 8)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Initiële versie | @architect |
