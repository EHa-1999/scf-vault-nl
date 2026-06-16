---
id: "SA-{YYYY}-{QX}-{SYSTEEM}-{COMPONENT}"
type: self-assessment
assessment_level: component
name: "Component Assessment {COMPONENT} - {QX} {YYYY}"
system: "[[Systems/{SYSTEEM}]]"
component: "[[Components/{COMPONENT}]]"
benchmark: "[[Benchmarks/{TYPE}/{BENCHMARK-ID}]]"
benchmark_version: ""
assessment_type: component
period: "{YYYY}-{QX}"
status: Draft
assessor: ""
assessment_date: 
review_date: 
sign_off_by: ""
sign_off_date: 
profile_applied: "Level 1"
total_recommendations: 0
compliant: 0
partial: 0
non_compliant: 0
not_applicable: 0
not_assessed: 0
score_percentage: 0
created: 
modified: 
tags:
  - self-assessment
  - component-assessment
  - {component-tag}
---

# Component Assessment: {COMPONENT} — {QX} {YYYY}

## Assessment Informatie

| Veld | Waarde |
|------|--------|
| **ID** | {SA-ID} |
| **Assessment Level** | Component |
| **Systeem** | [[Systems/{SYSTEEM}]] |
| **Component** | [[Components/{COMPONENT}]] |
| **Benchmark** | [[Benchmarks/{TYPE}/{BENCHMARK-ID}]] |
| **Profiel** | Level 1 |
| **Periode** | {QX} {YYYY} |
| **Assessor** | |
| **Status** | Draft |

## Scope

Dit assessment beoordeelt de hardening-status van **{COMPONENT}** aan de hand van de {BENCHMARK-ID} benchmark. Elke recommendation wordt individueel beoordeeld op basis van technische verificatie.

### Beoordelingsschaal

| Status | Symbool | Betekenis |
|--------|---------|-----------|
| Compliant | ✅ | Recommendation volledig geïmplementeerd en geverifieerd |
| Partial | ⚠️ | Gedeeltelijk geïmplementeerd, actie nodig |
| Non-Compliant | ❌ | Niet geïmplementeerd |
| N/A | ➖ | Niet van toepassing (met onderbouwing) |
| Niet beoordeeld | ☐ | Nog niet gecontroleerd |

---

## Beoordeling per Sectie

> **Instructie:** Kopieer de recommendation-tabellen uit de [[Benchmarks/{TYPE}/{BENCHMARK-ID}|benchmark checklist]] en vervang de ☐ per recommendation met het juiste oordeel. Voeg per sectie een toelichting toe met bevindingen en evidence-referenties.

### Sectie 1: {Sectienaam}

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 1.1 | {Recommendation tekst} | L1 | ☐ | | |

**Toelichting:**

> *Beschrijf hier de bevindingen voor deze sectie. Verwijs naar evidence.*

---

*(Herhaal voor elke sectie uit de benchmark)*

---

## Resultaten Samenvatting

### Score per Sectie

| Sectie | Totaal | ✅ | ⚠️ | ❌ | ➖ | Score |
|--------|--------|-----|------|------|------|-------|
| 1. {Sectie} | | | | | | % |
| **Totaal** | **0** | **0** | **0** | **0** | **0** | **0%** |

> **Score berekening:** Score = (Compliant + 0,5 × Partial) / (Totaal − N/A) × 100%

### Level 1 vs Level 2

| Profiel | Totaal | Compliant | Score |
|---------|--------|-----------|-------|
| Level 1 | | | % |
| Level 2 | | | % |

---

## Geïdentificeerde Gaps

### Kritieke Gaps (Non-Compliant Level 1)

| # | Recommendation | Impact | Aanbeveling |
|---|----------------|--------|-------------|
| | | | |

### Verbeterpunten (Partial)

| # | Recommendation | Huidige Status | Benodigde Actie |
|---|----------------|----------------|-----------------|
| | | | |

---

## CIS Control Mapping

Dit component assessment levert evidence voor de volgende CIS Controls:

| CIS Control | Relevante Secties | Bijdrage |
|-------------|-------------------|----------|
| CIS-4.1 Secure Configuration | Alle secties | Primair |
| | | |

---

## Evidence Register

| Evidence ID | Type | Beschrijving | Datum | Locatie |
|-------------|------|--------------|-------|---------|
| EVD-{C}-001 | Config | | | Evidence/ |
| EVD-{C}-002 | Test | | | Evidence/ |

---

## Sign-Off

| Rol | Naam | Datum |
|-----|------|-------|
| Assessor | | |
| Component Owner | | |
| System Owner | | |

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 0.1 | | | Initiële versie |
