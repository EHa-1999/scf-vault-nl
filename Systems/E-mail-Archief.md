---
id: "E-mail-Archief"
type: system
name: "E-mail Archief"
description: "E-mail archiveringssysteem voor compliance en informatiehuishouding."
owner: "Team ICT"
classification: "BBN2"
status: "Planned"
created: 2026-01-27
modified: 2026-01-27
tags:
  - system
  - planned
---

# E-mail Archief

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Systeem ID** | E-mail-Archief |
| **Eigenaar** | Team ICT |
| **Classificatie** | BBN2 |
| **Status** | Planned |

## Beschrijving

E-mail archiveringssysteem voor compliance en informatiehuishouding.

## Componenten

```dataview
TABLE 
  component_type as "Type",
  version as "Versie",
  status as "Status"
FROM "Components"
WHERE contains(systems, "E-mail-Archief")
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
WHERE system = "E-mail-Archief"
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
WHERE contains(systems, "E-mail-Archief") AND status != "Closed"
SORT risk_level DESC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-27 | Initiële versie | @architect |
