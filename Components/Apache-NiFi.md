---
id: "Apache-NiFi"
type: component
name: "Apache NiFi"
component_type: "Integration"
vendor: "Apache Software Foundation"
version: "2.x"
systems:
  - "XENA"
classification: "BBN2"
status: active
created: 2026-01-27
modified: 2026-01-27
tags:
  - component
  - integration
---

# Apache NiFi

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | Apache-NiFi |
| **Type** | Integration |
| **Vendor** | Apache Software Foundation |
| **Versie** | 2.x |
| **Classificatie** | BBN2 |

## Beschrijving

Data flow orchestration platform voor document processing.

## Systemen

Dit component wordt gebruikt in: [[XENA]]

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
