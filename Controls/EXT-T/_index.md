---
type: index
name: "Technical Controls"
icon: "⚙️"
created: 2026-01-29
---

# ⚙️ Extended Technical Controls (EXT-T)

> 3 technische controls voor resterende ISO A.8 gaps.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Controls/_index\|📋 Controls]] | [[README\|🏠 Home]] | [[Controls/EXT-P/_index\|🔐 Privacy Controls]] |

---

## Overzicht

| Statistiek | Waarde |
|------------|--------|
| **Totaal Controls** | 3 |
| **Baseline** | 2 |
| **Domeinen** | 1 |

---

## Per Domein


### EXT-T: Technical Operations

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-T"
WHERE category = "EXT-T"
SORT id ASC
```

---


## Relatie met Frameworks

| Framework | Relevante Artikelen |
|-----------|---------------------|
| [[Frameworks/ISO-27001-2022\|ISO 27001]] | A.8.6, A.8.33, A.8.34 |

---

## Gerelateerde Documenten

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Frameworks/BIO2|BIO 2.0]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
