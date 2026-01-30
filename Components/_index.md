---
type: index
name: "Components"
icon: "🔧"
created: 2026-01-28
---

# 🔧 Components

> Technische bouwstenen waarop security controls worden geïmplementeerd.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[README\|🏠 Home]] | — | [[Systems/_index\|🖥️ Systems]] · [[Implementations/_index\|⚙️ Implementations]] |

---

## Wat is een Component?

Een **Component** is een technische bouwsteen binnen een system:
- Database (PostgreSQL, MongoDB)
- Storage (MinIO, S3)
- Identity Provider (KeyCloak, EntraID)
- Orchestration (Apache NiFi, Camunda)
- Reverse Proxy (NGINX, Traefik)
- etc.

Voor elk component bepalen we:
- Welke **CIS Benchmark** beschikbaar is (of Extended Benchmark nodig)
- Welke **controls** van toepassing zijn
- Hoe die controls **geïmplementeerd** worden

---

## Geregistreerde Components

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Component",
  component_type as "Type",
  vendor as "Vendor",
  version as "Versie",
  system as "System"
FROM "Components"
WHERE type = "component"
SORT component_type ASC, name ASC
```

---

## Per Type

### Databases

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Component",
  vendor as "Vendor",
  version as "Versie",
  choice(cis_benchmark, "✅ CIS", "📝 Extended") as "Benchmark"
FROM "Components"
WHERE component_type = "Database" OR component_type = "RDBMS"
SORT name ASC
```

### Storage

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Component",
  vendor as "Vendor",
  version as "Versie",
  choice(cis_benchmark, "✅ CIS", "📝 Extended") as "Benchmark"
FROM "Components"
WHERE component_type = "Object Storage" OR component_type = "Storage"
SORT name ASC
```

### Identity & Access

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Component",
  vendor as "Vendor",
  version as "Versie",
  choice(cis_benchmark, "✅ CIS", "📝 Extended") as "Benchmark"
FROM "Components"
WHERE contains(component_type, "Identity") OR contains(component_type, "IAM")
SORT name ASC
```

### Application & Orchestration

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Component",
  vendor as "Vendor",
  version as "Versie",
  choice(cis_benchmark, "✅ CIS", "📝 Extended") as "Benchmark"
FROM "Components"
WHERE component_type = "Orchestration" OR component_type = "Application"
SORT name ASC
```

---

## CIS Benchmark Status

| Status | Betekenis |
|--------|-----------|
| ✅ CIS | Officiële CIS Benchmark beschikbaar |
| 📝 Extended | Extended Benchmark nodig (zelf opstellen) |

### Components met CIS Benchmark

```dataview
LIST
FROM "Components"
WHERE cis_benchmark = true
```

### Components zonder CIS Benchmark

```dataview
LIST
FROM "Components"
WHERE cis_benchmark = false OR !cis_benchmark
```

→ Zie [[Documentatie/CIS Benchmark Mapping Guide|CIS Benchmark Mapping Guide]] voor Extended Benchmarks

---

## Nieuw Component Toevoegen

1. Identificeer het component in de [[Documentatie/System Onboarding Guide|System Onboarding]]
2. Maak document via [[Templates/Component Template|Component Template]]
3. Check [[Documentatie/CIS Benchmark Mapping Guide|CIS Benchmark beschikbaarheid]]
4. Maak Implementation documents voor relevante controls

---

## Gerelateerde Secties

- [[Systems/_index|🖥️ Systems]] — Waar components deel van uitmaken
- [[Implementations/_index|⚙️ Implementations]] — Hoe controls op components worden toegepast
- [[Documentatie/CIS Benchmark Mapping Guide|CIS Benchmark Mapping]]
- [[Documentatie/Benchmarks/EXT-MinIO|Extended Benchmark MinIO]] (voorbeeld)
