---
id: "XENA"
type: system
name: "XENA"
description: "XENA Document Management Systeem - Modern DMS platform gebaseerd op Common Ground principes."
owner: "Team Informatiebeheer"
classification: "BBN2"
status: "Production"
created: 2026-01-27
modified: 2026-01-27
tags:
  - system
  - production
---

# XENA

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Systeem ID** | XENA |
| **Eigenaar** | Team Informatiebeheer |
| **Classificatie** | BBN2 |
| **Status** | Production |

## Beschrijving

XENA Document Management Systeem - Modern DMS platform gebaseerd op Common Ground principes.

## Componenten

```dataview
TABLE 
  component_type as "Type",
  version as "Versie",
  status as "Status"
FROM "Components"
WHERE contains(systems, "XENA")
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
WHERE system = "XENA"
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
WHERE contains(systems, "XENA") AND status != "Closed"
SORT risk_level DESC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-27 | Initiële versie | @architect |
