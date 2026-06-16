---
id: "EXT-BM-Supplier-v1.0"
type: benchmark
benchmark_type: "EXT-Organizational"
name: "Extended Benchmark - Leveranciersbeheer"
domain: "Supplier Management"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "CISO / Procurement Manager"
ext_controls:
  - "EXT-SUP"
sources:
  - "ISO 27001:2022 A.5.19-A.5.22"
  - "BIO2 B11"
  - "NIS2 Art. 21(2)(d)"
recommendations_count: 18
level_1_count: 14
level_2_count: 4
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - organizational
  - supplier
  - leverancier
  - nis2
---

# Extended Benchmark: Leveranciersbeheer v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Domein** | Leveranciersbeheer (Supplier Management) |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 18 (14 L1, 4 L2) |

> [!warning] NIS2 Kernvereiste
> NIS2 Art. 21(2)(d) vereist expliciet maatregelen voor supply chain security.

## Navigatie

| ← Terug | Omhoog | Gerelateerde Controls |
|---------|--------|----------------------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Controls/EXT-SUP/_index\|EXT-SUP Controls]] |

---

## Complete Recommendations Checklist

### Leveranciersbeleid

| # | Recommendation | Level | ISO | BIO | NIS2 |
|---|----------------|-------|-----|-----|------|
| SUP-1.1 | Leveranciersbeleid vastgesteld | L1 | A.5.19 | B11.1 | Art.21(2)(d) |
| SUP-1.2 | Leveranciersregister bijgehouden | L1 | A.5.19 | B11.1 | Art.21(2)(d) |
| SUP-1.3 | Kritieke leveranciers geïdentificeerd | L1 | A.5.19 | B11.1 | Art.21(2)(d) |

### Contractuele Beveiliging

| # | Recommendation | Level | ISO | BIO | NIS2 |
|---|----------------|-------|-----|-----|------|
| SUP-2.1 | Beveiligingseisen in contracten | L1 | A.5.20 | B11.2 | Art.21(2)(d) |
| SUP-2.2 | Verwerkersovereenkomst (AVG Art.28) | L1 | A.5.20 | B11.2 | — |
| SUP-2.3 | Recht op audit in contracten | L1 | A.5.20 | B11.2 | Art.21(2)(d) |
| SUP-2.4 | Exit-strategie in contracten | L1 | A.5.20 | B11.2 | — |
| SUP-2.5 | SLA met beveiligings-KPI's | L1 | A.5.20 | B11.2 | — |

### Supply Chain Security

| # | Recommendation | Level | ISO | BIO | NIS2 |
|---|----------------|-------|-----|-----|------|
| SUP-3.1 | Risicobeoordeling toeleveringsketen | L1 | A.5.21 | B11.3 | Art.21(2)(d) |
| SUP-3.2 | Beveiligingseisen aan subleveranciers | L2 | A.5.21 | B11.3 | Art.21(2)(d) |
| SUP-3.3 | Software supply chain (SBOM) | L2 | A.5.21 | B11.3 | Art.21(2)(d) |
| SUP-3.4 | Hardware supply chain verificatie | L2 | A.5.21 | B11.3 | Art.21(2)(d) |

### Leveranciersmonitoring

| # | Recommendation | Level | ISO | BIO | NIS2 |
|---|----------------|-------|-----|-----|------|
| SUP-4.1 | Periodieke leveranciersreview | L1 | A.5.22 | B11.4 | — |
| SUP-4.2 | Certificaten en attesteringen | L1 | A.5.22 | B11.4 | — |
| SUP-4.3 | Incident notificatie door leveranciers | L1 | A.5.22 | B11.4 | Art.21(2)(d) |
| SUP-4.4 | Leveranciersaudit uitgevoerd | L2 | A.5.22 | B11.4 | — |

---

## Key Recommendations Detail

### SUP-1.3: Kritieke leveranciers geïdentificeerd

**Beschrijving:** Kritieke leveranciers (essentieel voor bedrijfscontinuïteit of met toegang tot gevoelige informatie) zijn geïdentificeerd en onderworpen aan aanvullende beveiligingseisen.

**Audit Procedure:**
1. Vraag lijst van kritieke leveranciers op
2. Controleer criteria voor "kritiek"-classificatie
3. Verifieer dat aanvullende eisen zijn gedefinieerd

**Verwacht Bewijs:**
- [ ] Lijst kritieke leveranciers
- [ ] Criteria voor kritiek-classificatie
- [ ] Aanvullende beveiligingseisen

---

### SUP-2.1: Beveiligingseisen in contracten

**Beschrijving:** Alle contracten met leveranciers die toegang hebben tot informatie of systemen bevatten beveiligingsclausules.

**Audit Procedure:**
1. Vraag standaard beveiligingsclausules op
2. Steekproef: controleer recente contracten
3. Verifieer dekking relevante onderwerpen

**Verwacht Bewijs:**
- [ ] Standaard beveiligingsbijlage
- [ ] Contracten met clausules (steekproef)

---

### SUP-3.1: Risicobeoordeling toeleveringsketen

**Beschrijving:** De organisatie voert risicobeoordeling uit op de ICT-toeleveringsketen, inclusief subleveranciers voor kritieke componenten.

**Audit Procedure:**
1. Vraag supply chain risicobeoordeling op
2. Controleer of subleveranciers zijn meegenomen
3. Verifieer risicobehandeling

**Verwacht Bewijs:**
- [ ] Supply chain risicobeoordeling
- [ ] Overzicht subleveranciers
- [ ] Risicobehandelplan

---

### SUP-4.3: Incident notificatie door leveranciers

**Beschrijving:** Contracten vereisen dat leveranciers beveiligingsincidenten binnen 24-72 uur melden.

**Audit Procedure:**
1. Controleer notificatieclausules in contracten
2. Verifieer meldtermijnen
3. Controleer incident-log leveranciers

**Verwacht Bewijs:**
- [ ] Incident-notificatieclausules
- [ ] Meldtermijnen (24-72 uur)
- [ ] Incident-log

---

## Evidence Vereisten

| Type | Vereist Bewijs | Voorbeeld |
|------|----------------|-----------|
| **Beleid** | Goedgekeurd document | Leveranciersbeleid.pdf |
| **Register** | Actuele lijst | Leveranciersregister.xlsx |
| **Contract** | Getekend document | Contract + beveiligingsbijlage |
| **Certificaat** | Kopie | ISO 27001 cert leverancier |
| **Review** | Rapport | Leveranciersreview 2026 |

---

## Gerelateerde Documenten

- [[Controls/EXT-SUP/_index|EXT-SUP Controls]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Benchmarks/EXT/EXT-BM-Governance-v1.0|EXT-BM-Governance]]
