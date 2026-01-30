---
id: "DASH-Implementatie"
type: dashboard
name: "Implementatie Dashboard"
created: 2026-01-29
modified: 2026-01-29
tags:
  - dashboard
  - implementatie
  - tracking
---

# 🚀 Implementatie Dashboard

> Overzicht van de implementatiestatus van alle security controls.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Dashboards/_index\|📊 Dashboards]] | [[README\|🏠 Home]] | [[Dashboards/Compliance Dashboard\|✅ Compliance]] |

---

## Implementatie Status Overzicht

### Statussen

| Status | Betekenis | Volgende Stap |
|--------|-----------|---------------|
| 🔴 `gepland` | Nog niet gestart | Start implementatie |
| 🟡 `in_uitvoering` | Bezig met inrichten | Afronden |
| 🟢 `gereed` | Geïnstalleerd | Validatie |
| ✅ `gevalideerd` | Technisch geverifieerd | Compliance assessment |

---

## Totaal Overzicht

### Per Status

```dataview
TABLE WITHOUT ID
  impl_status as "Status",
  length(rows) as "Aantal",
  round(length(rows) / 231 * 100, 0) + "%" as "Percentage"
FROM "Controls"
WHERE type = "control"
GROUP BY impl_status
SORT impl_status ASC
```

### Per Control Categorie

```dataview
TABLE WITHOUT ID
  category as "Categorie",
  length(filter(rows, (r) => r.impl_status = "gevalideerd")) as "✅",
  length(filter(rows, (r) => r.impl_status = "gereed")) as "🟢",
  length(filter(rows, (r) => r.impl_status = "in_uitvoering")) as "🟡",
  length(filter(rows, (r) => r.impl_status = "gepland")) as "🔴",
  length(rows) as "Totaal"
FROM "Controls"
WHERE type = "control"
GROUP BY category
SORT category ASC
```

---

## CIS Controls Implementatie

### CIS 1-6: Foundation Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(impl_status = "gevalideerd", "✅", choice(impl_status = "gereed", "🟢", choice(impl_status = "in_uitvoering", "🟡", "🔴"))) as "Status",
  impl_percentage + "%" as "%",
  impl_owner as "Eigenaar"
FROM "Controls/CIS"
WHERE type = "control" AND (category = "CIS 1" OR category = "CIS 2" OR category = "CIS 3" OR category = "CIS 4" OR category = "CIS 5" OR category = "CIS 6")
SORT id ASC
```

### CIS 7-12: Operational Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(impl_status = "gevalideerd", "✅", choice(impl_status = "gereed", "🟢", choice(impl_status = "in_uitvoering", "🟡", "🔴"))) as "Status",
  impl_percentage + "%" as "%",
  impl_owner as "Eigenaar"
FROM "Controls/CIS"
WHERE type = "control" AND (category = "CIS 7" OR category = "CIS 8" OR category = "CIS 9" OR category = "CIS 10" OR category = "CIS 11" OR category = "CIS 12")
SORT id ASC
```

### CIS 13-18: Advanced Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(impl_status = "gevalideerd", "✅", choice(impl_status = "gereed", "🟢", choice(impl_status = "in_uitvoering", "🟡", "🔴"))) as "Status",
  impl_percentage + "%" as "%",
  impl_owner as "Eigenaar"
FROM "Controls/CIS"
WHERE type = "control" AND (category = "CIS 13" OR category = "CIS 14" OR category = "CIS 15" OR category = "CIS 16" OR category = "CIS 17" OR category = "CIS 18")
SORT id ASC
```

---

## Extended Controls Implementatie

### EXT-P: Privacy Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(impl_status = "gevalideerd", "✅", choice(impl_status = "gereed", "🟢", choice(impl_status = "in_uitvoering", "🟡", "🔴"))) as "Status",
  impl_percentage + "%" as "%"
FROM "Controls/EXT-P"
WHERE type = "control"
SORT id ASC
```

### EXT-O: Organisatorische Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(impl_status = "gevalideerd", "✅", choice(impl_status = "gereed", "🟢", choice(impl_status = "in_uitvoering", "🟡", "🔴"))) as "Status",
  impl_percentage + "%" as "%"
FROM "Controls/EXT-O"
WHERE type = "control"
SORT id ASC
```

### EXT-HR: Personele Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(impl_status = "gevalideerd", "✅", choice(impl_status = "gereed", "🟢", choice(impl_status = "in_uitvoering", "🟡", "🔴"))) as "Status",
  impl_percentage + "%" as "%"
FROM "Controls/EXT-HR"
WHERE type = "control"
SORT id ASC
```

### EXT-PHY: Fysieke Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(impl_status = "gevalideerd", "✅", choice(impl_status = "gereed", "🟢", choice(impl_status = "in_uitvoering", "🟡", "🔴"))) as "Status",
  impl_percentage + "%" as "%"
FROM "Controls/EXT-PHY"
WHERE type = "control"
SORT id ASC
```

### EXT-SUP/BC/COM/T: Overige Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(impl_status = "gevalideerd", "✅", choice(impl_status = "gereed", "🟢", choice(impl_status = "in_uitvoering", "🟡", "🔴"))) as "Status",
  impl_percentage + "%" as "%"
FROM "Controls"
WHERE type = "control" AND (contains(file.path, "EXT-SUP") OR contains(file.path, "EXT-BC") OR contains(file.path, "EXT-COM") OR contains(file.path, "EXT-T"))
SORT id ASC
```

---

## Per Systeem

```dataview
TABLE WITHOUT ID
  impl_system as "Systeem",
  length(filter(rows, (r) => r.impl_status = "gevalideerd")) as "✅",
  length(filter(rows, (r) => r.impl_status = "gereed")) as "🟢",
  length(filter(rows, (r) => r.impl_status = "in_uitvoering")) as "🟡",
  length(rows) as "Totaal"
FROM "Controls"
WHERE type = "control" AND impl_system != "" AND impl_system != null
GROUP BY impl_system
SORT impl_system ASC
```

---

## Implementatie Backlog

### Nog te Starten (Gepland, Prioriteit 5)

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  category as "Categorie",
  impl_owner as "Eigenaar"
FROM "Controls"
WHERE type = "control" AND impl_status = "gepland" AND priority = 5
SORT category ASC, id ASC
LIMIT 20
```

### In Uitvoering

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  impl_percentage + "%" as "Voortgang",
  impl_owner as "Eigenaar",
  impl_date as "Verwacht"
FROM "Controls"
WHERE type = "control" AND impl_status = "in_uitvoering"
SORT impl_percentage DESC
```

### Gereed, Wacht op Validatie

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  impl_date as "Afgerond",
  impl_owner as "Eigenaar"
FROM "Controls"
WHERE type = "control" AND impl_status = "gereed" AND impl_validated = false
SORT impl_date ASC
```

---

## Validatie Checklist

Voordat een control van `gereed` naar `gevalideerd` gaat:

- [ ] **Technische verificatie**: Is de configuratie correct toegepast?
- [ ] **Functionele test**: Werkt de control zoals bedoeld?
- [ ] **Documentatie**: Is de implementatie gedocumenteerd?
- [ ] **Evidence**: Is bewijs verzameld (screenshots, logs, configs)?
- [ ] **Eigenaar akkoord**: Heeft de eigenaar gevalideerd?

---

## Workflow

![[Assets/diagrams/Implementation-Workflow.svg]]

---

## Gerelateerde Documenten

- [[Dashboards/Compliance Dashboard|Compliance Dashboard]]
- [[Dashboards/Implementation Tracker|Implementation Tracker]]
- [[Planning/Implementatieplan 2026|Implementatieplan 2026]]
- [[Documentatie/System Onboarding Guide|System Onboarding Guide]]
