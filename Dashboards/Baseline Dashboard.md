---
id: "DASH-Baseline"
type: dashboard
name: "Baseline Compliance Dashboard"
description: "Monitoring van verplichte baseline security controls (comply or explain)"
created: 2026-01-28
modified: 2026-01-28
tags:
  - dashboard
  - baseline
  - compliance
---

# Baseline Compliance Dashboard

> **Baseline Security Controls** zijn verplicht ("always on") volgens het comply-or-explain principe. Indien een baseline control niet is geïmplementeerd, moet hiervoor een goedgekeurde afwijking (exception) bestaan met compenserende maatregelen.

## Executive Summary

### Baseline Statistieken

```dataview
TABLE WITHOUT ID
  "CIS Controls" as "Type",
  length(filter(rows, (r) => r.baseline = true)) as "Baseline",
  length(filter(rows, (r) => r.baseline = false)) as "Niet-Baseline",
  length(rows) as "Totaal"
FROM "Controls/CIS"
WHERE type = "control"
GROUP BY true
```

```dataview
TABLE WITHOUT ID
  "Privacy Controls" as "Type",
  length(filter(rows, (r) => r.baseline = true)) as "Baseline",
  length(filter(rows, (r) => r.baseline = false)) as "Niet-Baseline",
  length(rows) as "Totaal"
FROM "Controls/EXT-P"
WHERE type = "control"
GROUP BY true
```

---

## Baseline Compliance per Systeem

### XENA

```dataview
TABLE WITHOUT ID
  "Geïmplementeerd" as "Status",
  length(rows) as "Aantal",
  round(length(rows) * 100 / 93, 0) + "%" as "% van Baseline"
FROM "Implementations"
WHERE contains(system, "XENA") AND impl_status = "Implemented"
FLATTEN (this.file.frontmatter.control) as ctrl
WHERE ctrl.baseline = true
GROUP BY true
```

```dataview
TABLE WITHOUT ID
  impl_status as "Status",
  length(rows) as "Aantal"
FROM "Implementations"
WHERE contains(system, "XENA")
GROUP BY impl_status
```

---

## Baseline Controls Overzicht

### Baseline Controls - Niet Geïmplementeerd (Actie Vereist!)

> [!warning] Comply or Explain
> Onderstaande baseline controls zijn nog niet volledig geïmplementeerd. Voor elk van deze controls moet óf de implementatie worden afgerond, óf een formele exception worden aangevraagd.

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  priority_label as "Prioriteit",
  category_name as "Categorie"
FROM "Controls/CIS"
WHERE baseline = true
AND !contains(this.file.inlinks, "Implementations")
SORT priority DESC
LIMIT 20
```

### Baseline Controls met Exception

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  exception_reason as "Reden",
  exception_approved_by as "Goedgekeurd door",
  exception_expiry as "Verloopdatum"
FROM "Controls/CIS"
WHERE baseline = true AND exception_status = "Approved"
SORT exception_expiry ASC
```

---

## Baseline Controls per CIS Categorie

### CIS 1 - Asset Inventory

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(baseline, "✓ Baseline", "-") as "Baseline"
FROM "Controls/CIS"
WHERE category = "CIS 1"
SORT id ASC
```

### CIS 3 - Gegevensbescherming

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(baseline, "✓ Baseline", "-") as "Baseline"
FROM "Controls/CIS"
WHERE category = "CIS 3"
SORT id ASC
```

### CIS 5 - Accountbeheer

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(baseline, "✓ Baseline", "-") as "Baseline"
FROM "Controls/CIS"
WHERE category = "CIS 5"
SORT id ASC
```

### CIS 6 - Access Control

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(baseline, "✓ Baseline", "-") as "Baseline"
FROM "Controls/CIS"
WHERE category = "CIS 6"
SORT id ASC
```

### CIS 8 - Audit Logging

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(baseline, "✓ Baseline", "-") as "Baseline"
FROM "Controls/CIS"
WHERE category = "CIS 8"
SORT id ASC
```

### CIS 17 - Incident Response

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(baseline, "✓ Baseline", "-") as "Baseline"
FROM "Controls/CIS"
WHERE category = "CIS 17"
SORT id ASC
```

---

## Privacy Baseline (AVG)

> Alle privacy controls zijn onderdeel van de baseline vanwege AVG compliance vereisten.

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  category_name as "Domein"
FROM "Controls/EXT-P"
WHERE baseline = true
SORT category ASC, id ASC
```

---

## Volledige Baseline Controls Lijst

### Alle CIS Baseline Controls (93)

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  category_name as "Categorie",
  priority_label as "Prioriteit",
  implementation_group as "IG"
FROM "Controls/CIS"
WHERE baseline = true
SORT category ASC, id ASC
```

### Alle Niet-Baseline Controls (60)

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  category_name as "Categorie",
  implementation_group as "IG"
FROM "Controls/CIS"
WHERE baseline = false
SORT category ASC, id ASC
```

---

## Baseline Implementatie Prioritering

> [!info] Prioritering
> Baseline controls hebben altijd voorrang bij implementatie. Binnen de baseline wordt geprioriteerd op:
> 1. Priority (Critical → Low)
> 2. Implementation Group (IG1 → IG3)

### Hoogste Prioriteit Baseline (nog te implementeren)

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  priority_label as "Prioriteit",
  implementation_group as "IG"
FROM "Controls/CIS"
WHERE baseline = true AND priority >= 4
SORT priority DESC, implementation_group ASC
LIMIT 15
```

---

## Exception Management

### Exception Aanvragen (Template)

Voor het aanvragen van een afwijking op een baseline control:

1. Documenteer de reden waarom implementatie niet mogelijk is
2. Beschrijf compenserende maatregelen
3. Definieer een vervaldatum voor de exception
4. Verkrijg goedkeuring van de CISO

Voeg aan het Control document toe:

```yaml
exception_status: "Requested"  # Requested, Approved, Denied, Expired
exception_reason: "Beschrijving waarom niet mogelijk"
exception_compensating: "Compenserende maatregelen"
exception_requested_by: "@naam"
exception_approved_by: ""
exception_expiry: YYYY-MM-DD
```

### Actieve Exceptions Rapportage

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  exception_reason as "Reden",
  exception_compensating as "Compenserend",
  exception_expiry as "Verloopt",
  choice(exception_expiry < date(today), "⚠️ VERLOPEN", "✓ Actief") as "Status"
FROM "Controls"
WHERE exception_status = "Approved"
SORT exception_expiry ASC
```

---

## Rapportage Periodiciteit

| Rapportage | Frequentie | Verantwoordelijke |
|------------|------------|-------------------|
| Baseline Compliance Status | Maandelijks | Security Officer |
| Exception Review | Kwartaal | CISO |
| Volledige Baseline Audit | Jaarlijks | Internal Audit |

---

## Gerelateerde Documenten

- [[Dashboards/Compliance Dashboard|Compliance Dashboard]]
- [[Dashboards/Implementation Dashboard|Implementation Dashboard]]
- [[Planning/Implementatieplan 2026|Implementatieplan]]
- [[Documentatie/System Onboarding Guide|System Onboarding Guide]]
