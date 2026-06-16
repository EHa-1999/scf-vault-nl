---
type: index
name: "Assessment Results"
icon: "📊"
created: 2026-02-11
modified: 2026-02-11
---

# 📊 Assessment Results

> Geëxporteerde assessment resultaten uit Excel templates. Deze bestanden worden automatisch geaggregeerd door Dataview.

## Bestandsnaam Conventie

```
Assessment-{Component}-Results-YYYY-MM-DD-HH-MM.md
```

Voorbeeld: `Assessment-RabbitMQ-Results-2026-02-11-14-30.md`

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Assessments/_index\|📝 Assessments]] | [[README\|🏠 Home]] | [[Components/_index\|🔧 Components]] |

---

## Compliance Dashboard

### Baseline Compliance per Component

```dataview
TABLE WITHOUT ID
  component as "Component",
  baseline_score + "%" as "Baseline Score",
  total_score + "%" as "Totaal Score",
  assessment_date as "Datum",
  assessor as "Assessor"
FROM "Assessments/Results"
WHERE type = "assessment-result"
SORT assessment_date DESC
```

### Laatste Assessments per Systeem

```dataview
TABLE WITHOUT ID
  system as "Systeem",
  component as "Component",
  baseline_score + "%" as "Baseline",
  environment as "Omgeving",
  assessment_date as "Datum"
FROM "Assessments/Results"
WHERE type = "assessment-result"
SORT system ASC, assessment_date DESC
```

### Non-Compliant Telling

```dataview
TABLE WITHOUT ID
  component as "Component",
  non_compliant as "Non-Compliant",
  baseline_non_compliant as "Baseline NC",
  partial as "Partial"
FROM "Assessments/Results"
WHERE type = "assessment-result" AND non_compliant > 0
SORT non_compliant DESC
```

---

## Trend Analyse

Om trends te zien, bewaar assessments met datum in de bestandsnaam:
- `RabbitMQ-2026-02-11.md`
- `RabbitMQ-2026-05-15.md`
- etc.

```dataview
TABLE WITHOUT ID
  component as "Component",
  assessment_date as "Datum",
  baseline_score + "%" as "Baseline Score"
FROM "Assessments/Results"
WHERE type = "assessment-result"
SORT component ASC, assessment_date ASC
```

---

## Bestanden in deze Map

```dataview
LIST
FROM "Assessments/Results"
WHERE type = "assessment-result"
SORT file.name ASC
```

---

## Een Assessment Exporteren

1. Open de Excel Assessment template
2. Vul alle maatregelen in met Status
3. Ga naar het **Export** tabblad
4. Vul de metadata in (Assessor, Systeem, Omgeving, Datum)
5. Kopieer kolom C (de gegenereerde Markdown)
6. Maak een nieuw `.md` bestand in deze map
7. Plak de inhoud en sla op

De Dataview queries hierboven zullen automatisch het nieuwe assessment oppikken.

---

## Gerelateerd

- [[Assessments/_index|📝 Assessment Templates]]
- [[Documentatie/Benchmark-Baseline-Systematiek|📐 Baseline Systematiek]]
- [[Systems/_index|🖥️ Systemen]]
