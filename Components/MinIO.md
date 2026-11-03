---
id: "MinIO"
type: component
name: "MinIO"
component_type: "Object Storage"
vendor: "MinIO Inc."
version: "2024.x"
systems:
  - "XENA-NZGW"
  - "E-mail-Archief"
classification: "BBN2"
benchmark: "[[Benchmarks/EXT/EXT-MinIO-v1.0]]"
benchmark_version: "v1.0"
status: active
created: 2026-01-27
modified: 2026-01-30
tags:
  - component
  - object-storage
---

# MinIO

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | MinIO |
| **Type** | Object Storage |
| **Vendor** | MinIO Inc. |
| **Versie** | 2024.x |
| **Classificatie** | BBN2 |
| **Benchmark** | [[Benchmarks/EXT/EXT-MinIO-v1.0\|EXT-MinIO v1.0]] |

## Beschrijving

S3-compatible object storage voor document opslag.

## Systemen

Dit component wordt gebruikt in: [[Systems/XENA-NZGW|XENA-NZGW]], [[E-mail-Archief]]

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
