---
type: dashboard
name: "SCF Control Dashboard"
created: 2026-01-27
tags:
  - dashboard
  - overview
---

# 🛡️ Security Control Framework Dashboard

> **Laatste update**: 2026-01-27

## 📊 Framework Overzicht

### Controls per Categorie

```dataview
TABLE WITHOUT ID
  category as "Categorie",
  length(rows) as "Aantal Controls"
FROM "Controls"
GROUP BY category
SORT category ASC
```

### Controls per Prioriteit

```dataview
TABLE WITHOUT ID
  priority_label as "Prioriteit",
  length(rows) as "Aantal"
FROM "Controls"
GROUP BY priority_label
SORT priority DESC
```

## 🏢 Systemen Status

```dataview
TABLE 
  classification as "Classificatie",
  status as "Status"
FROM "Systems"
SORT name ASC
```

## 🔧 Componenten Overzicht

```dataview
TABLE 
  component_type as "Type",
  vendor as "Vendor",
  version as "Versie"
FROM "Components"
SORT component_type ASC
```

## ✅ Implementatie Status

### Per Systeem

```dataview
TABLE WITHOUT ID
  system as "Systeem",
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "✅ Geïmpl.",
  length(filter(rows, (r) => r.impl_status = "Partial")) as "🔄 Deels",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "📋 Gepland",
  length(filter(rows, (r) => r.impl_status = "Not Started")) as "⏳ Open"
FROM "Implementations"
GROUP BY system
```

### Per Component

```dataview
TABLE WITHOUT ID
  component as "Component",
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "✅",
  length(filter(rows, (r) => r.impl_status = "Partial")) as "🔄",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "📋"
FROM "Implementations"
GROUP BY component
```

## ⚠️ Open Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico",
  status as "Status",
  owner as "Eigenaar"
FROM "Risks"
WHERE status != "Closed" AND status != "Mitigated"
SORT risk_level DESC
```

## 📅 Aankomende Reviews

```dataview
TABLE 
  control as "Control",
  component as "Component",
  next_review as "Review Datum"
FROM "Implementations"
WHERE next_review <= date(today) + dur(30 days)
SORT next_review ASC
LIMIT 10
```

## 🔗 Snelle Links

- [[Dashboards/Baseline Dashboard|🔒 Baseline Compliance]] ← **Comply or Explain**
- [[Dashboards/Compliance Dashboard|📋 Compliance per Framework]]
- [[Dashboards/Risk Dashboard|⚠️ Risico Overzicht]]
- [[Dashboards/Implementation Tracker|✅ Implementatie Voortgang]]
- [[Dashboards/Executive Summary|📊 Executive Summary]]
- [[Templates/Control Template|📝 Nieuwe Control]]
- [[Templates/Implementation Template|📝 Nieuwe Implementatie]]

## 🔒 Baseline Status

> **93 CIS Controls** + **27 Privacy Controls** = **120 Baseline Controls** (comply or explain)

```dataview
TABLE WITHOUT ID
  "CIS Baseline" as "Type",
  length(filter(rows, (r) => r.baseline = true)) as "Baseline",
  length(filter(rows, (r) => r.baseline = false)) as "Niet-Baseline"
FROM "Controls/CIS"
GROUP BY true
```

→ [[Dashboards/Baseline Dashboard|Bekijk volledig Baseline Dashboard]]
