---
id: "PostgreSQL"
type: component
name: "PostgreSQL"
component_type: "Database"
vendor: "PostgreSQL Global Development Group"
version: "16.x"
systems:
  - "XENA-NZGW"
  - "XENA-ZGW"
classification: "BBN2"
benchmark: "[[Benchmarks/CIS/CIS-PostgreSQL-16-v1.0.0]]"
benchmark_version: "v1.0.0"
status: active
created: 2026-01-27
modified: 2026-01-30
tags:
  - component
  - database
---

# PostgreSQL

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | PostgreSQL |
| **Type** | Database |
| **Vendor** | PostgreSQL Global Development Group |
| **Versie** | 16.x |
| **Classificatie** | BBN2 |
| **Benchmark** | [[Benchmarks/CIS/CIS-PostgreSQL-16-v1.0.0\|CIS PostgreSQL 16 v1.0.0]] |

## Beschrijving

Relationele database voor metadata en audit trails.

## Systemen

Dit component wordt gebruikt in: [[Systems/XENA-NZGW|XENA]], [[Systems/XENA-ZGW|ZGW]]

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
