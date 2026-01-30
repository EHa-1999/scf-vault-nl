---
id: "NGINX"
type: component
name: "NGINX"
component_type: "Reverse Proxy"
vendor: "F5 Networks"
version: "1.25+"
systems:
  - "XENA"
  - "ZGW"
classification: "BBN2"
benchmark: "[[Benchmarks/CIS/CIS-NGINX-v2.1.0]]"
benchmark_version: "v2.1.0"
status: active
created: 2026-01-27
modified: 2026-01-30
tags:
  - component
  - reverse-proxy
---

# NGINX

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | NGINX |
| **Type** | Reverse Proxy |
| **Vendor** | F5 Networks |
| **Versie** | 1.25+ |
| **Classificatie** | BBN2 |
| **Benchmark** | [[Benchmarks/CIS/CIS-NGINX-v2.1.0\|CIS NGINX v2.1.0]] |

## Beschrijving

Reverse proxy en load balancer voor webverkeer.

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
