---
id: "EXT-BM-Compliance-v1.0"
type: benchmark
benchmark_type: "EXT-Organizational"
name: "Extended Benchmark - Compliance"
domain: "Compliance Management"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "CISO / Compliance Officer"
ext_controls:
  - "EXT-COM"
sources:
  - "ISO 27001:2022 A.5.31-A.5.36"
  - "BIO2 B13"
  - "NIS2 Art. 21(2)(a)"
recommendations_count: 14
level_1_count: 10
level_2_count: 4
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - organizational
  - compliance
  - audit
---

# Extended Benchmark: Compliance v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Domein** | Compliance Management |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 14 (10 L1, 4 L2) |

## Navigatie

| ← Terug | Omhoog | Gerelateerde Controls |
|---------|--------|----------------------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Controls/EXT-COM/_index\|EXT-COM Controls]] |

---

## Complete Recommendations Checklist

### Compliance Governance

| # | Recommendation | Level | ISO 27001 | BIO |
|---|----------------|-------|-----------|-----|
| COM-1.1 | Compliance-register bijgehouden | L1 | A.5.31 | B13.1 |
| COM-1.2 | Wettelijke eisen geïdentificeerd | L1 | A.5.31 | B13.1 |
| COM-1.3 | Contractuele eisen geïdentificeerd | L1 | A.5.31 | B13.1 |
| COM-1.4 | Compliance-verantwoordelijke aangewezen | L1 | A.5.31 | B13.1 |

### Intellectueel Eigendom

| # | Recommendation | Level | ISO 27001 | BIO |
|---|----------------|-------|-----------|-----|
| COM-2.1 | Licentie-administratie bijgehouden | L1 | A.5.32 | B13.2 |
| COM-2.2 | Software audits periodiek | L2 | A.5.32 | B13.2 |

### Privacy Compliance

| # | Recommendation | Level | ISO 27001 | BIO |
|---|----------------|-------|-----------|-----|
| COM-3.1 | Verwerkingsregister (Art.30 AVG) | L1 | A.5.34 | B13.3 |
| COM-3.2 | DPIA-procedure aanwezig | L1 | A.5.34 | B13.3 |
| COM-3.3 | Data subject requests procedure | L1 | A.5.34 | B13.3 |
| COM-3.4 | Datalek-procedure (72-uur) | L1 | A.5.34 | B13.3 |

### Audit en Review

| # | Recommendation | Level | ISO 27001 | BIO |
|---|----------------|-------|-----------|-----|
| COM-4.1 | Interne audit jaarlijks | L1 | A.5.35 | B13.4 |
| COM-4.2 | Technische compliance review | L2 | A.5.36 | B13.4 |
| COM-4.3 | Management review uitgevoerd | L2 | A.5.35 | B13.4 |
| COM-4.4 | Non-conformity management | L2 | A.5.35 | B13.4 |

---

## Key Recommendations Detail

### COM-1.1: Compliance-register bijgehouden

**Beschrijving:** Een register van alle toepasselijke wet- en regelgeving, contractuele verplichtingen en interne beleidsregels wordt bijgehouden.

**Audit Procedure:**
1. Vraag compliance-register op
2. Controleer dekking relevante domeinen
3. Verifieer actualiteit

**Verwacht Bewijs:**
- [ ] Compliance-register
- [ ] Datum laatste update
- [ ] Verantwoordelijke per domein

---

### COM-3.1: Verwerkingsregister (Art.30 AVG)

**Beschrijving:** Een verwerkingsregister conform AVG Art. 30 is opgesteld en wordt onderhouden.

**Audit Procedure:**
1. Vraag verwerkingsregister op
2. Controleer verplichte velden
3. Verifieer actualiteit en compleetheid

**Verwacht Bewijs:**
- [ ] Verwerkingsregister
- [ ] Alle Art. 30 velden ingevuld
- [ ] Proceseigenaren geïdentificeerd

---

### COM-3.4: Datalek-procedure (72-uur)

**Beschrijving:** Een procedure voor datalekken is vastgesteld die voldoet aan de 72-uurs meldtermijn naar de AP.

**Audit Procedure:**
1. Vraag datalekprocedure op
2. Controleer 72-uurs eis
3. Verifieer datalekregister

**Verwacht Bewijs:**
- [ ] Datalekprocedure
- [ ] Datalekregister
- [ ] Meldingen aan AP (indien van toepassing)

---

### COM-4.1: Interne audit jaarlijks

**Beschrijving:** Een interne audit op informatiebeveiliging wordt minimaal jaarlijks uitgevoerd.

**Audit Procedure:**
1. Vraag interne audit rapporten op
2. Controleer scope en frequentie
3. Verifieer opvolging bevindingen

**Verwacht Bewijs:**
- [ ] Interne audit rapport afgelopen jaar
- [ ] Audit planning
- [ ] Opvolging bevindingen

---

## Evidence Vereisten

| Type | Vereist Bewijs | Voorbeeld |
|------|----------------|-----------|
| **Register** | Actuele lijst | Compliance-register.xlsx |
| **Procedure** | Goedgekeurd document | Datalekprocedure.pdf |
| **Audit** | Auditrapport | IA-2026-001-XENA.pdf |
| **AVG** | Verwerkingsregister | Verwerkingsregister.xlsx |

---

## Gerelateerde Documenten

- [[Controls/EXT-COM/_index|EXT-COM Controls]]
- [[Frameworks/AVG-GDPR|AVG/GDPR]]
- [[Dashboards/Audit Dashboard|Audit Dashboard]]
