---
id: "Elasticsearch"
type: component
name: "Elasticsearch"
component_type: "Search Engine"
vendor: "Elastic"
version: "8.x"
systems:
  - "XENA"
  - "ZGW"
classification: "BBN2"
status: active
created: 2026-01-27
modified: 2026-01-27
tags:
  - component
  - search-engine
---

# Elasticsearch

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | Elasticsearch |
| **Type** | Search Engine |
| **Vendor** | Elastic |
| **Versie** | 8.x |
| **Classificatie** | BBN2 |

## Beschrijving

Full-text search engine voor document zoekfunctionaliteit.

## Systemen

Dit component wordt gebruikt in: [[XENA]], [[ZGW]]

## Technische Details

| Aspect | Waarde |
|--------|--------|
| **Hostname/URL** | (in te vullen) |
| **Poort(en)** | (in te vullen) |
| **Protocol** | (in te vullen) |
| **Authenticatie** | (in te vullen) |

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
| 2026-01-27 | Initiële versie | @architect |
