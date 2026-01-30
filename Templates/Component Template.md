---
id: "{{component_id}}"
type: component
name: "{{component_name}}"
component_type: "{{component_type}}"
vendor: "{{vendor}}"
version: "{{version}}"
systems:
  - "{{system}}"
classification: "{{classification}}"
status: {{status}}
created: {{date}}
modified: {{date}}
tags:
  - component
  - {{component_type}}
---

# {{component_name}}

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | {{component_id}} |
| **Type** | {{component_type}} |
| **Vendor** | {{vendor}} |
| **Versie** | {{version}} |
| **Classificatie** | {{classification}} |

## Beschrijving

{{description}}

## Systemen

Dit component wordt gebruikt in de volgende systemen:

```dataview
LIST
FROM "Systems"
WHERE contains(string(components), this.file.name)
```

## Technische Details

| Aspect | Waarde |
|--------|--------|
| **Hostname/URL** | |
| **Poort(en)** | |
| **Protocol** | |
| **Authenticatie** | |

## Toegepaste Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  impl_status as "Status"
FROM "Implementations"
WHERE contains(component, this.file.name)
SORT control ASC
```

## Compliance Samenvatting

```dataview
TABLE WITHOUT ID
  impl_status as "Status",
  length(rows) as "Aantal"
FROM "Implementations"
WHERE contains(component, this.file.name)
GROUP BY impl_status
```

## Gerelateerde Risico's

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  name as "Risico",
  risk_label as "Niveau",
  status as "Status"
FROM "Risks"
WHERE contains(string(components), this.file.name)
SORT risk_level DESC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| {{date}} | Initiële versie | @architect |
