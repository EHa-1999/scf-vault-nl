---
type: index
name: "Benchmarks"
icon: "📏"
created: 2026-01-30
modified: 2026-01-30
---

# 📏 Benchmarks

> Hardening guides die de brug slaan tussen abstracte controls en concrete configuraties.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[README\|🏠 Home]] | — | [[Controls/_index\|📋 Controls]] |

---

## Wat is een Benchmark?

Een **Benchmark** is een gedetailleerde hardening guide voor een specifieke technologie. Het vertaalt abstracte security controls naar concrete configuratie-instellingen.

```
CIS Control                    Benchmark                      Component
(WAT te doen)                  (HOE te doen)                  (WAAR)
─────────────                  ────────────                   ────────
CIS-3.11: Versleutel    ───▶   PostgreSQL Benchmark 4.2  ───▶  PostgreSQL
data in rust                   "Ensure TDE is enabled"        op XENA
```

### Benchmark Typen

| Type | Bron | Autoriteit | Voorbeeld |
|------|------|------------|-----------|
| **CIS Benchmark** | [CIS Downloads](https://www.cisecurity.org/cis-benchmarks) | Industrie standaard | CIS PostgreSQL 16 Benchmark |
| **EXT Benchmark** | Zelf ontwikkeld | Organisatie standaard | EXT-MinIO, EXT-KeyCloak |

---

## CIS Benchmarks

Officiële benchmarks van het Center for Internet Security, geconverteerd naar Obsidian formaat.

→ [[Benchmarks/CIS/_index\|📘 CIS Benchmarks]]

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Benchmark",
  technology as "Technologie",
  benchmark_version as "Versie",
  cis_release_date as "Release Datum"
FROM "Benchmarks/CIS"
WHERE type = "benchmark"
SORT technology ASC
```

### Beschikbare CIS Benchmarks per Categorie

| Categorie | Technologieën |
|-----------|---------------|
| **Databases** | PostgreSQL, MySQL, MariaDB, MongoDB, Oracle, SQL Server, Redis |
| **Operating Systems** | Ubuntu, Debian, RHEL, CentOS, Windows Server, macOS |
| **Containers** | Docker, Kubernetes, OpenShift |
| **Web Servers** | Apache HTTP, NGINX, IIS |
| **Cloud** | AWS, Azure, GCP (per service) |

> **Download:** https://www.cisecurity.org/cis-benchmarks (gratis account vereist)

---

## Extended Benchmarks (EXT)

Zelf ontwikkelde benchmarks voor technologieën zonder officiële CIS Benchmark.

→ [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]]

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Benchmark",
  technology as "Technologie",
  benchmark_version as "Versie",
  last_review as "Laatste Review"
FROM "Benchmarks/EXT"
WHERE type = "benchmark"
SORT technology ASC
```

### Wanneer een EXT Benchmark?

Ontwikkel een Extended Benchmark wanneer:
- Geen CIS Benchmark beschikbaar is
- De technologie specifiek is voor de organisatie
- Aanvullende eisen gelden bovenop CIS

---

## Benchmark → Component Mapping

Welke benchmark geldt voor welk component?

```dataview
TABLE WITHOUT ID
  link(file.link, file.name) as "Component",
  benchmark as "Benchmark",
  benchmark_version as "Versie"
FROM "Components"
WHERE benchmark != null
SORT file.name ASC
```

---

## Versioning

Benchmarks volgen semantic versioning en worden bijgehouden bij:

| Trigger | Actie |
|---------|-------|
| **CIS release** | Nieuwe versie CIS Benchmark importeren |
| **Technology upgrade** | Controleren of benchmark nog geldig is |
| **Jaarlijkse review** | EXT Benchmarks evalueren |
| **Incident/CVE** | Benchmark aanvullen indien nodig |

### Versie Conventies

| Type | Format | Voorbeeld |
|------|--------|-----------|
| CIS Benchmark | `CIS-{Tech}-{TechVer}-v{BenchVer}` | `CIS-PostgreSQL-16-v1.0.0` |
| EXT Benchmark | `EXT-{Tech}-v{Ver}` | `EXT-MinIO-v1.0` |

---

## Nieuw Benchmark Toevoegen

### CIS Benchmark Importeren

1. Download PDF van [CIS WorkBench](https://workbench.cisecurity.org/)
2. Kopieer [[Benchmarks/Templates/CIS Benchmark Template\|CIS Benchmark Template]]
3. Converteer recommendations naar Markdown
4. Vul CIS Control mappings in
5. Link aan Component(en)

### EXT Benchmark Ontwikkelen

1. Kopieer [[Benchmarks/Templates/EXT Benchmark Template\|EXT Benchmark Template]]
2. Verzamel bronnen (vendor docs, OWASP, STIGs)
3. Definieer recommendations met audit/remediation
4. Map naar CIS Controls
5. Review door Security Officer

---

## Templates

| Template | Gebruik |
|----------|---------|
| [[Benchmarks/Templates/CIS Benchmark Template\|CIS Benchmark Template]] | Voor geconverteerde CIS Benchmarks |
| [[Benchmarks/Templates/EXT Benchmark Template\|EXT Benchmark Template]] | Voor zelf ontwikkelde benchmarks |

---

## Statistieken

```dataview
TABLE WITHOUT ID
  "CIS Benchmarks" as "Type",
  length(filter(rows, (r) => r.benchmark_type = "CIS")) as "Aantal"
FROM "Benchmarks"
WHERE type = "benchmark"
GROUP BY true
```

---

## Gerelateerde Secties

- [[Controls/_index\|📋 Controls]] — De controls die benchmarks implementeren
- [[Components/_index\|🔧 Components]] — De technologieën waarvoor benchmarks gelden
- [[Implementations/_index\|⚙️ Implementations]] — Control implementaties per component
- [[Documentatie/CIS Benchmark Handleiding\|📚 CIS Benchmark Handleiding]] — Hoe benchmarks te gebruiken
