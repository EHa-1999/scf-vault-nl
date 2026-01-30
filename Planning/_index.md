---
type: index
name: "Planning"
icon: "📅"
created: 2026-01-28
---

# 📅 Planning

> Roadmaps, implementatieplannen en compliance kalenders.

---

## Navigatie

| ← Terug | Omhoog |
|---------|--------|
| [[README\|🏠 Home]] | — |

---

## Actieve Planningen

### Implementatieplan 2026

Het gefaseerde uitrolplan voor security controls:

→ [[Planning/Implementatieplan 2026|Implementatieplan 2026]]

| Fase | Periode | Focus | Budget |
|------|---------|-------|--------|
| 1 | Q1 | Foundation & Baseline | €35.000 |
| 2 | Q2 | Gegevensbescherming & Access | €40.000 |
| 3 | Q3 | Monitoring & Response | €35.000 |
| 4 | Q4 | Optimization & Audit | €30.000 |
| **Totaal** | | | **€140.000** |

---

### Compliance Kalender 2026

Week-voor-week overzicht van compliance activiteiten:

→ [[Planning/Compliance Kalender 2026|Compliance Kalender 2026]]

Belangrijke momenten:
- **Q1**: NIS2 gap assessment, Baseline implementatie start
- **Q2**: ISO 27001 surveillance audit, BIO2 self-assessment
- **Q3**: Pentest, Incident response oefening
- **Q4**: Management review, Interne audit

---

## Planning Documenten

```dataview
TABLE WITHOUT ID
  link(file.link, file.name) as "Document",
  type as "Type"
FROM "Planning"
WHERE file.name != "_index"
SORT file.name ASC
```

---

## Gerelateerde Dashboards

- [[Dashboards/Implementation Tracker|✅ Implementation Tracker]] — Voortgang
- [[Dashboards/Baseline Dashboard|🔒 Baseline Dashboard]] — Comply or Explain
- [[Dashboards/Compliance Dashboard|📋 Compliance Dashboard]] — Per framework
