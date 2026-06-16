---
id: "XENA-NZGW"
type: system
name: "XENA-NZGW"
full_name: "XENA Niet-Zaakgericht Werken"
description: "XENA Document Management Systeem voor niet-zaakgerichte processen - Modern DMS platform gebaseerd op Common Ground principes."
owner: "Team Informatiebeheer"
classification: "BBN2"
status: "Production"
created: 2026-01-27
modified: 2026-02-10
tags:
  - system
  - production
  - xena
  - nzgw
  - dms
---

# XENA-NZGW

> **XENA Niet-Zaakgericht Werken** — Document Management voor niet-zaakgerichte processen

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Systeem ID** | XENA-NZGW |
| **Volledige Naam** | XENA Niet-Zaakgericht Werken |
| **Eigenaar** | Team Informatiebeheer |
| **Classificatie** | BBN2 |
| **Status** | Production |

## Beschrijving

XENA-NZGW is het Document Management Systeem voor niet-zaakgerichte processen binnen de gemeente. Het platform is gebaseerd op Common Ground principes en biedt moderne documentbeheer-functionaliteit voor processen die buiten het zaakgericht werken vallen.

**Kenmerken:**
- Documentopslag en -beheer
- Versiebeheer en audit trail
- Integratie met kantoorautomatisering
- WebDAV toegang
- Classificatie en metadata

## Gerelateerd Systeem

| Systeem | Relatie |
|---------|---------|
| [[Systems/XENA-ZGW\|XENA-ZGW]] | Zuster-systeem voor zaakgerichte processen |

## Componenten

```dataview
TABLE 
  component_type as "Type",
  version as "Versie",
  status as "Status"
FROM "Components"
WHERE contains(systems, "XENA-NZGW") OR contains(systems, "XENA")
SORT component_type ASC
```

## Compliance Status

### Per Prioriteit

```dataview
TABLE WITHOUT ID
  rows.control[0].priority_label as "Prioriteit",
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "Geïmpl.",
  length(filter(rows, (r) => r.impl_status = "Partial")) as "Deels",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "Gepland",
  length(filter(rows, (r) => r.impl_status = "Not Started")) as "Open"
FROM "Implementations"
WHERE system = "XENA-NZGW" OR system = "XENA"
FLATTEN control
GROUP BY control.priority_label
```

## Open Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico",
  status as "Status"
FROM "Risks"
WHERE (contains(systems, "XENA-NZGW") OR contains(systems, "XENA")) AND status != "Closed"
SORT risk_level DESC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-02-10 | Hernoemd van XENA naar XENA-NZGW | @ciso |
| 2026-01-27 | Initiële versie | @architect |
