---
type: dashboard
name: "Implementation Tracker"
created: 2026-01-27
modified: 2026-01-28
tags:
  - dashboard
  - implementation
  - baseline
---

# ✅ Implementation Tracker

## Baseline Prioritering

> [!important] Baseline First
> Baseline controls (comply or explain) hebben altijd voorrang. Zie [[Dashboards/Baseline Dashboard|Baseline Dashboard]] voor volledig overzicht.

### Baseline Controls - Status

```dataview
TABLE WITHOUT ID
  impl_status as "Status",
  length(rows) as "Aantal"
FROM "Implementations"
FLATTEN (this.file.frontmatter.control) as ctrl_link
WHERE ctrl_link.baseline = true
GROUP BY impl_status
```

---

## Voortgang Overzicht

### Per Status

```dataview
TABLE WITHOUT ID
  impl_status as "Status",
  length(rows) as "Aantal",
  round(length(rows) * 100 / length(filter(rows, (r) => true)), 1) + "%" as "Percentage"
FROM "Implementations"
GROUP BY impl_status
```

### Per DoD Status

```dataview
TABLE WITHOUT ID
  dod_status as "DoD Status",
  length(rows) as "Aantal"
FROM "Implementations"
GROUP BY dod_status
```

## Recent Bijgewerkt

```dataview
TABLE 
  control as "Control",
  component as "Component",
  impl_status as "Status",
  modified as "Gewijzigd"
FROM "Implementations"
SORT modified DESC
LIMIT 10
```

## Te Reviewen

### Deze Maand

```dataview
TABLE 
  control as "Control",
  component as "Component",
  owner as "Eigenaar",
  next_review as "Review"
FROM "Implementations"
WHERE next_review <= date(today) + dur(30 days)
SORT next_review ASC
```

### Achterstallig

```dataview
TABLE 
  control as "Control",
  component as "Component",
  owner as "Eigenaar",
  next_review as "Verlopen"
FROM "Implementations"
WHERE next_review < date(today)
SORT next_review ASC
```

## Per Eigenaar

```dataview
TABLE WITHOUT ID
  owner as "Eigenaar",
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "✅ Done",
  length(filter(rows, (r) => r.impl_status = "Partial")) as "🔄 Partial",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "📋 Planned"
FROM "Implementations"
GROUP BY owner
```

## Kritieke Controls Nog Open

```dataview
TABLE 
  control as "Control",
  component as "Component",
  impl_status as "Status"
FROM "Implementations"
WHERE impl_status != "Implemented"
SORT control ASC
```
