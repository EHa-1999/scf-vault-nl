---
id: "EXT-BM-BC-v1.0"
type: benchmark
benchmark_type: "EXT-Organizational"
name: "Extended Benchmark - Business Continuity"
domain: "Business Continuity"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "CISO / Business Continuity Manager"
ext_controls:
  - "EXT-BC"
sources:
  - "ISO 27001:2022 A.5.29-A.5.30"
  - "ISO 22301:2019"
  - "BIO2 B12"
  - "NIS2 Art. 21(2)(c)"
recommendations_count: 16
level_1_count: 12
level_2_count: 4
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - organizational
  - continuity
  - bcm
  - nis2
---

# Extended Benchmark: Business Continuity v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Domein** | Business Continuity Management |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 16 (12 L1, 4 L2) |

> [!warning] NIS2 Kernvereiste
> NIS2 Art. 21(2)(c) vereist maatregelen voor "business continuity, such as backup management and disaster recovery, and crisis management."

## Navigatie

| ← Terug | Omhoog | Gerelateerde Controls |
|---------|--------|----------------------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Controls/EXT-BC/_index\|EXT-BC Controls]] |

---

## Complete Recommendations Checklist

### BCM Governance

| # | Recommendation | Level | ISO 27001 | BIO | NIS2 |
|---|----------------|-------|-----------|-----|------|
| BC-1.1 | BCM-beleid vastgesteld | L1 | A.5.29 | B12.1 | Art.21(2)(c) |
| BC-1.2 | BCM-verantwoordelijkheden toegewezen | L1 | A.5.29 | B12.1 | Art.21(2)(c) |
| BC-1.3 | BCM-scope gedefinieerd | L1 | A.5.29 | B12.1 | Art.21(2)(c) |

### Business Impact Analysis

| # | Recommendation | Level | ISO 27001 | BIO | NIS2 |
|---|----------------|-------|-----------|-----|------|
| BC-2.1 | BIA uitgevoerd | L1 | A.5.29 | B12.2 | Art.21(2)(c) |
| BC-2.2 | Kritieke processen geïdentificeerd | L1 | A.5.29 | B12.2 | Art.21(2)(c) |
| BC-2.3 | RTO/RPO per proces vastgesteld | L1 | A.5.29 | B12.2 | Art.21(2)(c) |
| BC-2.4 | Afhankelijkheden in kaart | L1 | A.5.29 | B12.2 | Art.21(2)(c) |

### Continuïteitsplannen

| # | Recommendation | Level | ISO 27001 | BIO | NIS2 |
|---|----------------|-------|-----------|-----|------|
| BC-3.1 | BCP voor kritieke processen | L1 | A.5.30 | B12.3 | Art.21(2)(c) |
| BC-3.2 | DRP voor kritieke systemen | L1 | A.5.30 | B12.3 | Art.21(2)(c) |
| BC-3.3 | Crisismanagementplan | L1 | A.5.30 | B12.3 | Art.21(2)(c) |
| BC-3.4 | Communicatieplan crisis | L1 | A.5.30 | B12.3 | Art.21(2)(c) |

### Testen en Oefenen

| # | Recommendation | Level | ISO 27001 | BIO | NIS2 |
|---|----------------|-------|-----------|-----|------|
| BC-4.1 | Jaarlijkse BC-test | L1 | A.5.30 | B12.4 | Art.21(2)(c) |
| BC-4.2 | DR-test uitgevoerd | L2 | A.5.30 | B12.4 | Art.21(2)(c) |
| BC-4.3 | Tabletop oefening | L2 | A.5.30 | B12.4 | Art.21(2)(c) |
| BC-4.4 | Lessons learned verwerkt | L2 | A.5.30 | B12.4 | Art.21(2)(c) |

---

## Key Recommendations Detail

### BC-2.1: Business Impact Analysis uitgevoerd

**Beschrijving:** Een Business Impact Analysis (BIA) is uitgevoerd om de impact van uitval van processen en systemen te bepalen.

**Audit Procedure:**
1. Vraag BIA-rapport op
2. Controleer scope (alle kritieke processen)
3. Verifieer actualiteit (< 2 jaar)

**Verwacht Bewijs:**
- [ ] BIA-rapport
- [ ] Impact-classificaties per proces
- [ ] Datum laatste update

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | BIA uitgevoerd, actueel, alle kritieke processen |
| ⚠️ Partial | BIA aanwezig maar verouderd of incompleet |
| ❌ Non-Compliant | Geen BIA |

---

### BC-2.3: RTO/RPO per proces vastgesteld

**Beschrijving:** Voor alle kritieke processen zijn Recovery Time Objective (RTO) en Recovery Point Objective (RPO) vastgesteld.

**Audit Procedure:**
1. Controleer RTO/RPO in BIA
2. Verifieer dat RTO/RPO realistisch zijn
3. Controleer of technische capaciteit aansluit

**Verwacht Bewijs:**
- [ ] RTO/RPO per kritiek proces
- [ ] Validatie door proceseigenaren
- [ ] Technische haalbaarheid

---

### BC-3.2: Disaster Recovery Plan voor kritieke systemen

**Beschrijving:** Voor alle kritieke IT-systemen bestaat een Disaster Recovery Plan (DRP) dat beschrijft hoe herstel plaatsvindt.

**Audit Procedure:**
1. Vraag DRP's op voor kritieke systemen
2. Controleer of RTO/RPO worden geadresseerd
3. Verifieer dat procedures actueel zijn

**Verwacht Bewijs:**
- [ ] DRP per kritiek systeem
- [ ] Herstelstappen gedocumenteerd
- [ ] Contactgegevens actueel

---

### BC-4.1: Jaarlijkse BC-test

**Beschrijving:** Continuïteitsplannen worden minimaal jaarlijks getest om effectiviteit te verifiëren.

**Audit Procedure:**
1. Vraag testplanning en -resultaten op
2. Controleer scope van tests
3. Verifieer dat bevindingen zijn opgelost

**Verwacht Bewijs:**
- [ ] Testplanning
- [ ] Testresultaten afgelopen jaar
- [ ] Opvolging bevindingen

---

## Evidence Vereisten

| Type | Vereist Bewijs | Voorbeeld |
|------|----------------|-----------|
| **BIA** | Rapport | BIA-2026.pdf |
| **Plan** | Goedgekeurd document | BCP-Financieel.docx |
| **Test** | Testrapport | DR-Test-Q1-2026.pdf |
| **RTO/RPO** | Tabel per systeem | RTO-RPO-Matrix.xlsx |

---

## Gerelateerde Documenten

- [[Controls/EXT-BC/_index|EXT-BC Controls]]
- [[Controls/CIS/CIS-11 - Gegevensherstel|CIS-11 Data Recovery]]
- [[Frameworks/NIS2|NIS2 Directive]]
