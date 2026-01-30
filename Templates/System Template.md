---
id: "{{system_id}}"
type: system
name: "{{system_name}}"
description: "{{description}}"
owner: "{{owner}}"
classification: "{{classification}}"
status: {{status}}
created: {{date}}
modified: {{date}}
tags:
  - system
---

# {{system_name}}

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Systeem ID** | {{system_id}} |
| **Eigenaar** | {{owner}} |
| **Classificatie** | {{classification}} |
| **Status** | {{status}} |

## Beschrijving

{{description}}

## Componenten

```dataview
TABLE 
  component_type as "Type",
  version as "Versie",
  status as "Status"
FROM "Components"
WHERE contains(systems, this.file.name)
SORT component_type ASC
```

## Compliance Status

```dataview
TABLE 
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "Geïmplementeerd",
  length(filter(rows, (r) => r.impl_status = "Partial")) as "Deels",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "Gepland",
  length(filter(rows, (r) => r.impl_status = "Not Started")) as "Niet gestart"
FROM "Implementations"
WHERE system = this.file.name
GROUP BY system
```

## Open Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  status as "Status"
FROM "Risks"
WHERE contains(systems, this.file.name) AND status != "Closed"
SORT risk_level DESC
```

## Architectuur

(Voeg hier een architectuurdiagram toe of link naar [[Evidence/...]])

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| {{date}} | Initiële versie | @architect |
