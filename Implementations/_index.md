---
type: index
name: "Implementations"
icon: "⚙️"
created: 2026-01-28
---

# ⚙️ Implementations

> Waar controls concreet worden — de koppeling tussen control en technologie.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[README\|🏠 Home]] | — | [[Controls/_index\|📋 Controls]] · [[Components/_index\|🔧 Components]] |

---

## Wat is een Implementation?

Een **Implementation** is het document dat beschrijft hoe een specifieke control wordt toegepast op een specifiek component:

```
Control (CIS-3.11) + Component (PostgreSQL) = Implementation (IMPL-XENA-PG-3.11)
```

Elk Implementation document bevat:
- **Definition of Done (DoD)** — Wanneer is het klaar?
- **Evidence requirements** — Welk bewijs is nodig?
- **Status** — Planned, In Progress, Implemented, Verified
- **Owner** — Wie is verantwoordelijk?

---

## Status Overzicht

```dataview
TABLE WITHOUT ID
  impl_status as "Status",
  length(rows) as "Aantal"
FROM "Implementations"
GROUP BY impl_status
SORT impl_status ASC
```

---

## Per System

### XENA

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  component as "Component",
  impl_status as "Status"
FROM "Implementations"
WHERE contains(system, "XENA")
SORT component ASC, control ASC
```

### ZGW

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  component as "Component",
  impl_status as "Status"
FROM "Implementations"
WHERE contains(system, "ZGW")
SORT component ASC, control ASC
```

---

## Per Component

```dataview
TABLE WITHOUT ID
  component as "Component",
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "✅ Done",
  length(filter(rows, (r) => r.impl_status = "In Progress")) as "🔄 WIP",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "📋 Planned",
  length(rows) as "Totaal"
FROM "Implementations"
GROUP BY component
SORT component ASC
```

---

## Baseline Implementations

> [!important] Prioriteit
> Baseline controls moeten eerst geïmplementeerd worden.

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  impl_status as "Status"
FROM "Implementations"
WHERE impl_status != "Implemented" AND impl_status != "Verified"
SORT control ASC
LIMIT 15
```

→ [[Dashboards/Baseline Dashboard|Zie Baseline Dashboard voor volledig overzicht]]

---

## Nieuwe Implementation Toevoegen

1. Identificeer de control en het component
2. Maak document via [[Templates/Implementation Template|Implementation Template]]
3. Gebruik naamconventie: `IMPL-{System}-{Component}-{Control}`
4. Definieer DoD op basis van CIS Benchmark of Extended Benchmark

---

## Gerelateerde Secties

- [[Controls/_index|📋 Controls]] — Welke controls bestaan er
- [[Components/_index|🔧 Components]] — Waarop controls worden toegepast
- [[Dashboards/Implementation Tracker|✅ Implementation Tracker]]
- [[Documentatie/System Onboarding Guide|System Onboarding Guide]]
