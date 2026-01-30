---
id: "DASH-Audit"
type: dashboard
name: "Audit Dashboard"
created: 2026-01-28
modified: 2026-01-28
tags:
  - dashboard
  - audit
---

# Audit Dashboard

## Actieve Audits

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Audit",
  scope as "Scope",
  auditor as "Auditor",
  status as "Status"
FROM "Audits"
WHERE type = "internal-audit" AND status != "Completed"
SORT audit_start_date DESC
```

## Open Bevindingen

### Per Classificatie

```dataview
TABLE WITHOUT ID
  classification as "Ernst",
  length(rows) as "Aantal"
FROM "Audits"
WHERE type = "finding" AND status != "Closed"
GROUP BY classification
SORT choice(classification = "Critical", 1, 
  choice(classification = "High", 2,
    choice(classification = "Medium", 3, 4))) ASC
```

### Kritieke & Hoge Bevindingen

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  name as "Bevinding",
  owner as "Eigenaar",
  due_date as "Deadline",
  choice(due_date < date(today), "🔴 OVERDUE", 
    choice(due_date < date(today) + dur(7 days), "🟡 Bijna", "🟢")) as "●"
FROM "Audits"
WHERE type = "finding" AND (classification = "Critical" OR classification = "High") AND status != "Closed"
SORT due_date ASC
```

### Overdue Bevindingen

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  name as "Bevinding",
  classification as "Ernst",
  owner as "Eigenaar",
  due_date as "Deadline"
FROM "Audits"
WHERE type = "finding" AND status != "Closed" AND due_date < date(today)
SORT classification ASC
```

## Recent Afgeronde Self-Assessments

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Assessment",
  assessment_type as "Type",
  overall_score + "%" as "Score",
  sign_off_date as "Afgerond"
FROM "Audits"
WHERE type = "self-assessment" AND status = "Completed"
SORT sign_off_date DESC
LIMIT 10
```

## Audit Dossiers

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Audit",
  scope as "Scope",
  status as "Status",
  findings_critical + findings_high as "Kritiek+Hoog",
  overall_opinion as "Oordeel"
FROM "Audits"
WHERE type = "internal-audit"
SORT id DESC
LIMIT 10
```

## Snelle Acties

> ℹ️ **Nieuwe audit aanmaken?** Gebruik Templater:
> `Ctrl/Cmd + P` → "Templater: Open Insert Template modal" → Kies script

- [[Audits/Scripts/Nieuwe Interne Audit|📁 Nieuwe Interne Audit]]
- [[Audits/Scripts/Nieuw Self-Assessment|📋 Nieuw Self-Assessment]]  
- [[Audits/Scripts/Nieuwe Bevinding|⚠️ Nieuwe Bevinding]]
- [[Audits/README|📖 Audits Handleiding]]

## Audit Kalender

| Audit | Scope | Gepland | Status |
|-------|-------|---------|--------|
| IA-2026-001 | XENA | Q1 2026 | In Progress |
| IA-2026-002 | ZGW | Q2 2026 | Planned |
| IA-2026-003 | Domeinen | Q2 2026 | Planned |

## Gerelateerde Dashboards

- [[Dashboards/Main Dashboard|Main Dashboard]]
- [[Dashboards/Compliance Dashboard|Compliance Dashboard]]
- [[Dashboards/Risk Dashboard|Risk Dashboard]]
- [[Dashboards/Implementation Tracker|Implementation Tracker]]
