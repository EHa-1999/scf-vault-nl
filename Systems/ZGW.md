---
id: "ZGW"
type: system
name: "ZGW"
description: "Zaakgericht Werken platform - Centrale zaakafhandeling conform GEMMA."
owner: "Team Dienstverlening"
classification: "BBN2"
status: "Production"
created: 2026-01-27
modified: 2026-01-27
tags:
  - system
  - production
---

# ZGW

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Systeem ID** | ZGW |
| **Eigenaar** | Team Dienstverlening |
| **Classificatie** | BBN2 |
| **Status** | Production |

## Beschrijving

Zaakgericht Werken platform - Centrale zaakafhandeling conform GEMMA.

## Componenten

```dataview
TABLE 
  component_type as "Type",
  version as "Versie",
  status as "Status"
FROM "Components"
WHERE contains(systems, "ZGW")
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
WHERE system = "ZGW"
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
WHERE contains(systems, "ZGW") AND status != "Closed"
SORT risk_level DESC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-27 | Initiële versie | @architect |
