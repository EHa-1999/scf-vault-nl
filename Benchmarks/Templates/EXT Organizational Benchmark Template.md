---
id: "EXT-BM-{Domein}-v{Version}"
type: benchmark
benchmark_type: "EXT-Organizational"
name: "Extended Benchmark - {Domein}"
domain: "{Domein}"
benchmark_version: "v{Version}"
status: Active
last_review: 
next_review: 
owner: "CISO / Security Officer"
ext_controls:
  - "EXT-{X}"
sources:
  - "ISO 27001:2022"
  - "BIO2"
  - "NIS2"
recommendations_count: 0
level_1_count: 0
level_2_count: 0
created: 
modified: 
tags:
  - benchmark
  - extended
  - organizational
  - {domein-tag}
---

# Extended Benchmark: {Domein} v{Version}

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Domein** | {Domein} |
| **Benchmark Versie** | v{Version} |
| **Status** | Active |
| **Eigenaar** | CISO / Security Officer |
| **Laatste Review** | {date} |
| **Volgende Review** | {date + 1 jaar} |

## Navigatie

| ← Terug | Omhoog | Gerelateerde Controls |
|---------|--------|----------------------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Controls/EXT-{X}/_index\|EXT-{X} Controls]] |

---

## 1. Overzicht

### 1.1 Scope

Deze Extended Benchmark beschrijft auditeerbare maatregelen voor:
- {Beschrijving van het domein}
- Gerelateerde Extended Controls: EXT-{X}.1 t/m EXT-{X}.n

### 1.2 Normenkader Mapping

Deze benchmark is gebaseerd op de volgende normenkaders:

| Normenkader | Sectie | Beschrijving |
|-------------|--------|--------------|
| **ISO 27001:2022** | A.{x} | {Beschrijving} |
| **BIO2** | B{x} | {Beschrijving} |
| **NIS2** | Art. 21(2)({x}) | {Beschrijving} |
| **NEN 7510** | {x} | {Beschrijving} (indien van toepassing) |

### 1.3 Profiel Definities

| Profiel | Beschrijving | Doelgroep |
|---------|--------------|-----------|
| **Level 1** | Basismaatregelen, verplicht voor alle organisaties | Alle |
| **Level 2** | Uitgebreide maatregelen, aanbevolen voor BBN2+ | BBN2, BBN3 |

---

## 2. Recommendations

### 2.1 {Sectie 1 - bijv. Governance}

#### {ID}-1.1: {Maatregel titel}

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 / L2 |
| **EXT Control** | [[Controls/EXT-{X}/EXT-{X}.{n}|EXT-{X}.{n}]] |
| **ISO 27001** | A.{x.y} |
| **BIO2** | B{x}.{y} |
| **NIS2** | Art. 21(2)({x}) |

**Beschrijving:**
{Wat moet worden gedaan}

**Rationale:**
{Waarom is dit nodig}

**Audit Procedure:**
1. {Stap 1 - wat te controleren}
2. {Stap 2 - welk document/bewijs op te vragen}
3. {Stap 3 - welke vraag te stellen}

**Verwacht Bewijs:**
- [ ] {Document type 1, bijv. Beleidsdocument}
- [ ] {Document type 2, bijv. Goedkeuringsrecord}
- [ ] {Document type 3, bijv. Meeting notulen}

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | {Wanneer voldaan} |
| ⚠️ Partial | {Wanneer gedeeltelijk voldaan} |
| ❌ Non-Compliant | {Wanneer niet voldaan} |

**Remediation:**
{Wat te doen om te voldoen}

---

#### {ID}-1.2: {Volgende maatregel}

*(Herhaal format)*

---

### 2.2 {Sectie 2 - bijv. Documentatie}

#### {ID}-2.1: {Maatregel titel}

---

## 3. Complete Recommendations Checklist

Deze checklist bevat **alle recommendations** uit deze benchmark. Gebruik dit voor het bijhouden van implementatie-voortgang.

### {Sectie 1}

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| {ID}-1.1 | {Korte beschrijving} | L1 | ☐ |
| {ID}-1.2 | {Korte beschrijving} | L1 | ☐ |
| {ID}-1.3 | {Korte beschrijving} | L2 | ☐ |

### {Sectie 2}

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| {ID}-2.1 | {Korte beschrijving} | L1 | ☐ |

---

## 4. Normenkader Kruisverwijzingen

### ISO 27001:2022 Mapping

| ISO Control | Benchmark Recs | Level |
|-------------|----------------|-------|
| A.{x.y} | {ID}-1.1, {ID}-1.2 | L1 |
| A.{x.z} | {ID}-2.1 | L1 |

### BIO2 Mapping

| BIO Maatregel | Benchmark Recs | Level |
|---------------|----------------|-------|
| B{x}.{y} | {ID}-1.1 | L1 |

### NIS2 Mapping

| NIS2 Artikel | Benchmark Recs | Level |
|--------------|----------------|-------|
| Art. 21(2)({x}) | {ID}-1.1, {ID}-1.2 | L1 |

---

## 5. Evidence Vereisten

### Per Recommendation Type

| Type Maatregel | Vereist Bewijs | Voorbeelden |
|----------------|----------------|-------------|
| **Beleid** | Beleidsdocument met goedkeuring | PDF met handtekening/goedkeuringsworkflow |
| **Procedure** | Proceduredocument + uitvoeringsrecords | Procedure.docx + ticketsysteem exports |
| **Rol/Verantwoordelijkheid** | Organogram + functiebeschrijvingen | HR-documenten, RACI-matrix |
| **Periodieke activiteit** | Planning + uitvoeringsrecords | Kalender, meeting notulen, rapporten |
| **Training/Awareness** | Trainingsmateriaal + deelnamerecords | Slides, aanwezigheidslijst, certificaten |
| **Review/Audit** | Review rapporten met bevindingen | Audit rapport, management response |

### Evidence Naamconventie

```
EVD-{Domein}-{Recommendation}-{Type}-{Datum}.{ext}

Voorbeelden:
EVD-GOV-1.1-POLICY-20260115.pdf
EVD-GOV-1.2-APPROVAL-20260115.pdf
EVD-HR-2.1-TRAINING-20260110.xlsx
```

---

## 6. Assessment Integratie

### Link naar Component Assessment

Dit benchmark kan worden gebruikt in een **Domein Assessment** of **Organisatie Assessment** volgens het [[Voorbeelden/_README|gelaagde assessment model]].

### Assessment Template Frontmatter

```yaml
id: "SA-2026-Q1-ORG-{Domein}"
type: self-assessment
assessment_level: domain
domain: "{Domein}"
benchmark: "[[Benchmarks/EXT/EXT-BM-{Domein}]]"
total_recommendations: {n}
```

---

## 7. Review Historie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v{Version} | {date} | {naam} | Initiële versie |

---

## Bronnen

### Primaire Normenkaders

- [ISO 27001:2022](https://www.iso.org/standard/27001)
- [BIO2 - Baseline Informatiebeveiliging Overheid](https://bio-overheid.nl/)
- [NIS2 Directive](https://eur-lex.europa.eu/eli/dir/2022/2555)

### Aanvullende Bronnen

- [NEN 7510](https://www.nen.nl/nen-7510-1-2017-nl-245399) (zorgsector)
- [ENISA Guidelines](https://www.enisa.europa.eu/)

---

## Gerelateerde Documenten

- [[Controls/EXT-{X}/_index|EXT-{X} Controls]]
- [[Documentatie/Taxonomie en Glossary|Taxonomie & Glossary]]
- [[Voorbeelden/_README|Gelaagd Assessment Model]]
