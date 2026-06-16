---
type: index
name: "Extended Benchmarks"
icon: "📙"
created: 2026-01-30
modified: 2026-01-30
---

# 📙 Extended Benchmarks (EXT)

> Zelf ontwikkelde benchmarks voor technologieën zonder CIS Benchmark én voor organisatorische/procesmatige controls.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Benchmarks/_index\|📏 Benchmarks]] | [[README\|🏠 Home]] | [[Benchmarks/CIS/_index\|📘 CIS Benchmarks]] |

---

## Over Extended Benchmarks

Extended Benchmarks zijn zelf ontwikkelde benchmarks met auditeerbare maatregelen. Er zijn twee typen:

| Type | Scope | Voorbeeld |
|------|-------|-----------|
| **EXT-Technisch** | Technologieën zonder CIS Benchmark | EXT-MinIO, EXT-KeyCloak |
| **EXT-Organisatorisch** | Niet-technische controls (governance, HR, fysiek) | EXT-BM-Governance, EXT-BM-HR |

### Waarom Organisatorische Benchmarks?

De 78 Extended Controls (EXT-O, EXT-HR, EXT-PHY, etc.) beschrijven **wat** moet worden gedaan, maar niet **hoe** dit concreet kan worden geaudit. Organisatorische Benchmarks vullen deze leemte door concrete, auditeerbare maatregelen te definiëren met evidence-vereisten en beoordelingscriteria.

```
Extended Control (wat)          →    EXT Benchmark (hoe + evidence)
────────────────────────────         ──────────────────────────────
EXT-O.1 Beleidsbeheer          →    GOV-1.1: Beleid vastgesteld
                                     GOV-1.2: Verplichte elementen
                                     GOV-1.3: Jaarlijkse review
                                     GOV-1.4: Onderliggend beleid
```

---

## Beschikbare Extended Benchmarks

### Organisatorische Benchmarks (Nieuw v3.8)

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Benchmark",
  domain as "Domein",
  benchmark_version as "Versie",
  recommendations_count as "Maatregelen",
  status as "Status"
FROM "Benchmarks/EXT"
WHERE benchmark_type = "EXT-Organizational"
SORT domain ASC
```

| Benchmark | Domein | Controls | Normenkaders | Status |
|-----------|--------|----------|--------------|--------|
| [[Benchmarks/EXT/EXT-BM-Governance-v1.0\|EXT-BM-Governance]] | Governance | EXT-O.1-O.12 | ISO A.5, BIO B1/B2, NIS2 Art.20-21 | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-HR-v1.0\|EXT-BM-HR]] | Personele beveiliging | EXT-HR | ISO A.6, BIO B3, NIS2 Art.21(2)(g) | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-Physical-v1.0\|EXT-BM-Physical]] | Fysieke beveiliging | EXT-PHY | ISO A.7, BIO B7 | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-Supplier-v1.0\|EXT-BM-Supplier]] | Leveranciersbeheer | EXT-SUP | ISO A.5.19-22, BIO B11, NIS2 Art.21(2)(d) | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-BC-v1.0\|EXT-BM-BC]] | Business Continuity | EXT-BC | ISO A.5.29-30, BIO B12, NIS2 Art.21(2)(c) | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-Compliance-v1.0\|EXT-BM-Compliance]] | Compliance | EXT-COM | ISO A.5.31-36, BIO B13 | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-Privacy-v1.0\|EXT-BM-Privacy]] | Privacy & AVG | EXT-P | AVG Art.5-49, NEN 7510 | ✅ Actief |

### Technische Benchmarks

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "Benchmark",
  technology as "Technologie",
  benchmark_version as "Versie",
  status as "Status"
FROM "Benchmarks/EXT"
WHERE benchmark_type = "EXT" OR (type = "benchmark" AND !benchmark_type)
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

### Document Management (XENA-ZGW)

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/EXT/EXT-BM-Alfresco-v1.0\|EXT-Alfresco v1.0]] | [[Components/Alfresco]] | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-OpenZaak-v1.0\|EXT-OpenZaak v1.0]] | [[Components/OpenZaak]] | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-GZAC-v1.0\|EXT-GZAC v1.0]] | [[Components/GZAC]] | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-Tezza-v1.0\|EXT-Tezza v1.0]] | [[Components/Tezza]] | 📋 Gepland (vendor) |

### Message Brokers (XENA-ZGW)

| Benchmark | Component | Status |
|-----------|-----------|--------|
| [[Benchmarks/EXT/EXT-BM-ActiveMQ-v1.0\|EXT-ActiveMQ v1.0]] | [[Components/ActiveMQ]] | ✅ Actief |
| [[Benchmarks/EXT/EXT-BM-RabbitMQ-v1.0\|EXT-RabbitMQ v1.0]] | [[Components/RabbitMQ]] | ✅ Actief |

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

## Templates

| Template | Gebruik |
|----------|---------|
| [[Benchmarks/Templates/EXT Benchmark Template\|EXT Benchmark Template]] | Technische componenten |
| [[Benchmarks/Templates/EXT Organizational Benchmark Template\|EXT Organizational Benchmark Template]] | Organisatorische/proces controls |

---

## Gerelateerd

- [[Benchmarks/CIS/_index|📘 CIS Benchmarks]] — Officiële CIS benchmarks
- [[Controls/EXT-O/_index|📋 EXT-O Controls]] — Organisatorische controls
- [[Documentatie/Taxonomie en Glossary|📖 Taxonomie & Glossary]] — Terminologie en structuur
- [[Voorbeelden/_README|📚 Gelaagd Assessment Model]] — Gebruik in audits
