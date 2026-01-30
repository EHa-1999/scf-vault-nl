---
type: index
name: "Extended Benchmarks"
icon: "📙"
created: 2026-01-30
modified: 2026-01-30
---

# 📙 Extended Benchmarks (EXT)

> Zelf ontwikkelde hardening guides voor technologieën zonder CIS Benchmark.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Benchmarks/_index\|📏 Benchmarks]] | [[README\|🏠 Home]] | [[Benchmarks/CIS/_index\|📘 CIS Benchmarks]] |

---

## Over Extended Benchmarks

Extended Benchmarks zijn zelf ontwikkelde hardening guides voor technologieën waarvoor geen officiële CIS Benchmark bestaat. Ze volgen dezelfde structuur als CIS Benchmarks maar worden intern onderhouden.

### Wanneer een EXT Benchmark?

| Situatie | Actie |
|----------|-------|
| Geen CIS Benchmark beschikbaar | EXT Benchmark ontwikkelen |
| Aanvullende organisatie-eisen | EXT Benchmark als supplement |
| Niche/custom technologie | EXT Benchmark vereist |

---

## Beschikbare Extended Benchmarks

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Benchmark",
  technology as "Technologie",
  benchmark_version as "Versie",
  status as "Status",
  last_review as "Review",
  owner as "Eigenaar"
FROM "Benchmarks/EXT"
WHERE type = "benchmark"
SORT technology ASC
```

---

## Benchmark Overzicht

### Object Storage

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/EXT/EXT-MinIO-v1.0\|EXT-MinIO v1.0]] | [[Components/MinIO]] | ✅ Actief |

### Identity & Access Management

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/EXT/EXT-KeyCloak-v1.0\|EXT-KeyCloak v1.0]] | [[Components/KeyCloak]] | ✅ Actief |
| [[Benchmarks/EXT/EXT-Saviynt-v1.0\|EXT-Saviynt v1.0]] | [[Components/Saviynt]] | 📋 Gepland |

### Data Processing

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/EXT/EXT-Apache-NiFi-v1.0\|EXT-Apache-NiFi v1.0]] | [[Components/Apache-NiFi]] | 📋 Gepland |

### Secret Management

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/EXT/EXT-OpenBAO-v1.0\|EXT-OpenBAO v1.0]] | [[Components/OpenBAO]] | 📋 Gepland |

### Search & Analytics

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/EXT/EXT-Elasticsearch-v1.0\|EXT-Elasticsearch v1.0]] | [[Components/Elasticsearch]] | 📋 Gepland |

---

## Bronnen voor EXT Benchmarks

Bij het ontwikkelen van een Extended Benchmark, gebruik deze bronnen:

| Bron | URL | Gebruik voor |
|------|-----|--------------|
| **Vendor Security Guide** | Vendor docs | Primaire configuratie |
| **OWASP** | owasp.org | Web applicatie security |
| **NIST 800-53** | nvd.nist.gov | Control mapping |
| **STIGs (DoD)** | public.cyber.mil/stigs | Uitgebreide hardening |
| **Vendor CVEs** | cve.mitre.org | Bekende kwetsbaarheden |
| **Security Blogs** | Vendor blogs | Best practices |

---

## Ontwikkelproces

### Stap 1: Research

```
1. Verzamel vendor security documentatie
2. Zoek naar STIGs of andere hardening guides
3. Identificeer bekende CVEs en mitigaties
4. Review OWASP guidelines indien relevant
```

### Stap 2: Structuur

```
1. Kopieer EXT Benchmark Template
2. Definieer categorieën (Auth, Crypto, Logging, etc.)
3. Nummer recommendations: EXT-{Tech}-{Cat}.{Nr}
```

### Stap 3: Content

```
1. Schrijf recommendation beschrijving
2. Definieer audit procedure (hoe te controleren)
3. Definieer remediation (hoe te implementeren)
4. Map naar CIS Control(s)
5. Voeg bronvermelding toe
```

### Stap 4: Review

```
1. Security Officer review
2. Technical review door specialist
3. CISO goedkeuring
4. Publicatie in vault
```

---

## Versie Beheer

### Versie Conventies

| Versie | Betekenis |
|--------|-----------|
| v1.0 | Initiële versie |
| v1.1 | Minor updates (nieuwe recs, fixes) |
| v2.0 | Major update (nieuwe technologie versie) |

### Review Cyclus

| Review Type | Frequentie | Door Wie |
|-------------|------------|----------|
| Inhoudelijke review | Jaarlijks | Security Officer |
| Technische check | Bij tech upgrade | Specialist |
| Volledige audit | 2-jaarlijks | CISO |

---

## Kwaliteitscriteria

Een goede EXT Benchmark heeft:

- [ ] **Duidelijke scope** — Welke versie(s) van de technologie
- [ ] **Bronvermelding** — Waar komt de recommendation vandaan
- [ ] **Audit procedure** — Hoe te verifiëren (commands, queries)
- [ ] **Remediation** — Hoe te implementeren (stap voor stap)
- [ ] **CIS Control mapping** — Welke control wordt geadresseerd
- [ ] **Rationale** — Waarom is dit belangrijk
- [ ] **Versie tracking** — Wijzigingshistorie

---

## Template

→ [[Benchmarks/Templates/EXT Benchmark Template|EXT Benchmark Template]]

---

## Gerelateerd

- [[Benchmarks/CIS/_index|📘 CIS Benchmarks]] — Officiële CIS benchmarks
- [[Components/_index|🔧 Components]] — Technologieën
- [[Documentatie/CIS Benchmark Handleiding|📚 Benchmark Handleiding]] — Gebruik in praktijk
