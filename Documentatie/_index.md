---
type: index
name: "Documentatie"
icon: "📚"
created: 2026-01-28
---

# 📚 Documentatie

> Handleidingen, procedures en referentiedocumenten — alles wat je moet weten.

---

## Navigatie

| ← Terug | Omhoog |
|---------|--------|
| [[README\|🏠 Home]] | — |

---

## Start Hier

Nieuw met het framework? Begin met deze documenten:

| Document | Beschrijving | Tijdsinvestering |
|----------|--------------|------------------|
| [[Documentatie/SCF Architectuur\|SCF Architectuur]] | Hoe het framework in elkaar zit | 15 min |
| [[Documentatie/Dual Scoring Model\|Dual Scoring Model]] | Implementatie vs. Compliance scores | 10 min |
| [[Documentatie/Handleiding\|Handleiding]] | Dagelijks gebruik van de vault | 10 min |
| [[Frameworks/LISA/1-LISA-Introductie\|LISA Introductie]] | Het framework filosofie | 20 min |

---

### Dual Scoring Model

Het framework gebruikt twee aparte scores voor volledige tracking:

→ [[Documentatie/Dual Scoring Model|Dual Scoring Model]]

| Score | Vraag | Dashboard |
|-------|-------|-----------|
| 🚀 **Implementatie** | Is het geïnstalleerd? | [[Dashboards/Implementatie Dashboard\|Implementatie]] |
| ✅ **Compliance** | Voldoet het aan de norm? | [[Dashboards/Compliance Dashboard\|Compliance]] |

---

## Procedures

### Systeem-intake

Hoe neem je een nieuw systeem op in het framework?

→ [[Documentatie/Systeem-intakeprocedure|Systeem-intakeprocedure]]

Stappen:
1. System registratie en classificatie
2. System Component Breakdown (SCB)
3. Control mapping en gap analyse
4. Implementation planning
5. Documentatie en sign-off

---

### CIS Benchmark Mapping

Hoe gebruik je CIS Benchmarks en wanneer maak je een Extended Benchmark?

→ [[Documentatie/CIS Benchmark Handleiding|CIS Benchmark Handleiding]]

---

## System Component Breakdowns (SCB)

Gedetailleerde technische documentatie per systeem:

| System | Document | Status |
|--------|----------|--------|
| XENA | [[Documentatie/SCB/SCB-XENA\|SCB-XENA]] | ✅ Compleet |
| ZGW | SCB-ZGW | 📋 Gepland |

---

## Extended Benchmarks

Custom security benchmarks voor technologieën zonder officiële CIS Benchmark:

| Technologie | Document |
|-------------|----------|
| MinIO | [[Benchmarks/EXT/EXT-MinIO-v1.0\|EXT-MinIO]] |
| Apache NiFi | 📋 Gepland |
| KeyCloak | 📋 Gepland |
| OpenBAO | 📋 Gepland |

---

## Framework Documentatie

Uitgebreide documentatie over het LISA framework zelf:

```dataview
TABLE WITHOUT ID
  link(file.link, file.name) as "Document"
FROM "Frameworks/LISA"
SORT file.name ASC
```

---

## Alle Documenten

```dataview
TABLE WITHOUT ID
  link(file.link, file.name) as "Document",
  type as "Type"
FROM "Documentatie"
WHERE file.name != "_index"
SORT file.name ASC
```

---

## Gerelateerde Secties

- [[Templates/_index|📝 Templates]] — Herbruikbare templates
- [[Planning/_index|📅 Planning]] — Roadmaps en kalenders
