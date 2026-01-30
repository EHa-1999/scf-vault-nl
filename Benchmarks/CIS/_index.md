---
type: index
name: "CIS Benchmarks"
icon: "📘"
created: 2026-01-30
modified: 2026-01-30
---

# 📘 CIS Benchmarks

> Officiële hardening guides van het Center for Internet Security.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Benchmarks/_index\|📏 Benchmarks]] | [[README\|🏠 Home]] | [[Benchmarks/EXT/_index\|📙 Extended]] |

---

## Over CIS Benchmarks

CIS Benchmarks zijn consensus-gebaseerde best practice configuratie guides, ontwikkeld door security experts wereldwijd. Ze bieden:

- **Specifieke configuratie-instellingen** per technologie
- **Audit procedures** — hoe te controleren
- **Remediation stappen** — hoe te implementeren
- **CIS Controls mapping** — welke control wordt geadresseerd

### Download

- **CIS Website:** https://www.cisecurity.org/cis-benchmarks
- **CIS WorkBench:** https://workbench.cisecurity.org/ (gratis account)

---

## Beschikbare CIS Benchmarks

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Benchmark",
  technology as "Technologie",
  technology_version as "Tech Versie",
  benchmark_version as "Benchmark Versie",
  cis_release_date as "Release",
  recommendations_count as "# Recs"
FROM "Benchmarks/CIS"
WHERE type = "benchmark"
SORT technology ASC
```

---

## Per Categorie

### Databases

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/CIS/CIS-PostgreSQL-16-v1.0.0\|CIS PostgreSQL 16]] | [[Components/PostgreSQL]] | ✅ Actief |
| CIS MySQL 8.0 | — | 📋 Gepland |
| CIS MongoDB 7.0 | — | 📋 Gepland |

### Web Servers

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/CIS/CIS-NGINX-v2.1.0\|CIS NGINX]] | [[Components/NGINX]] | ✅ Actief |
| CIS Apache HTTP 2.4 | — | 📋 Gepland |

### Containers & Orchestration

| Benchmark | Component | Status |
|-----------|-----------|--------|
| CIS Docker | — | 📋 Gepland |
| CIS Kubernetes 1.29 | — | 📋 Gepland |

### Operating Systems

| Benchmark | Component | Status |
|-----------|-----------|--------|
| CIS Ubuntu 24.04 LTS | — | 📋 Gepland |
| CIS RHEL 9 | — | 📋 Gepland |

---

## Benchmark Conversie Proces

### Van PDF naar Obsidian

```
1. Download PDF van CIS WorkBench
       ↓
2. Identificeer secties met recommendations
       ↓
3. Converteer naar Markdown met template
       ↓
4. Voeg audit/remediation code blocks toe
       ↓
5. Vul CIS Control mappings in
       ↓
6. Link aan Component document
```

### Wat te Converteren

Niet alles uit de PDF is nodig. Focus op:

| Sectie | Converteren? | Reden |
|--------|--------------|-------|
| Overview | ✅ Ja | Context en scope |
| Recommendations | ✅ Ja | Kern van de benchmark |
| Audit Procedures | ✅ Ja | Verificatie |
| Remediation | ✅ Ja | Implementatie |
| CIS Controls Mapping | ✅ Ja | Traceability |
| Appendix - Glossary | ❌ Nee | Referentie in PDF |
| Appendix - Change Log | ⚠️ Samenvatten | Alleen highlights |

---

## Versie Beheer

### Wanneer Updaten?

| Situatie | Actie |
|----------|-------|
| CIS publiceert nieuwe versie | Nieuwe benchmark MD aanmaken |
| Technologie major upgrade | Controleer of huidige benchmark nog geldt |
| CVE gerelateerd aan config | Check of benchmark recommendation bestaat |

### Meerdere Versies

Het is normaal om meerdere versies te hebben:

```
Benchmarks/CIS/
├── CIS-PostgreSQL-15-v1.0.0.md  ← Voor legacy PostgreSQL 15
├── CIS-PostgreSQL-16-v1.0.0.md  ← Voor huidige PostgreSQL 16
└── CIS-PostgreSQL-17-v1.0.0.md  ← Voor upgrade naar 17
```

---

## Template

→ [[Benchmarks/Templates/CIS Benchmark Template|CIS Benchmark Template]]

---

## Gerelateerd

- [[Benchmarks/EXT/_index|📙 Extended Benchmarks]] — Zelf ontwikkelde benchmarks
- [[Documentatie/CIS Benchmark Handleiding|📚 Benchmark Handleiding]] — Gebruik in praktijk
