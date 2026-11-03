---
id: "KeyCloak"
type: component
name: "KeyCloak"
component_type: "Identity Provider"
vendor: "Red Hat"
version: "24.x"
systems:
  - "XENA-NZGW"
  - "XENA-ZGW"
classification: "BBN2"
benchmark: "[[Benchmarks/EXT/EXT-KeyCloak-v1.0]]"
benchmark_version: "v1.0"
status: active
created: 2026-01-27
modified: 2026-01-30
tags:
  - component
  - identity-provider
---

# KeyCloak

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | KeyCloak |
| **Type** | Identity Provider |
| **Vendor** | Red Hat |
| **Versie** | 24.x |
| **Classificatie** | BBN2 |
| **Benchmark** | [[Benchmarks/EXT/EXT-KeyCloak-v1.0\|EXT-KeyCloak v1.0]] |

## Beschrijving

Identity and Access Management voor authenticatie en autorisatie.

## Systemen

Dit component wordt gebruikt in: [[Systems/XENA-NZGW|XENA-NZGW]], [[Systems/XENA-ZGW|XENA-ZGW]]

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
