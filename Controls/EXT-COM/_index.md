---
type: index
name: "Compliance Controls"
icon: "⚖️"
created: 2026-01-29
---

# ⚖️ Extended Compliance Controls (EXT-COM)

> 4 compliance controls voor wet- en regelgeving — BIO B13.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Controls/_index\|📋 Controls]] | [[README\|🏠 Home]] | [[Controls/EXT-P/_index\|🔐 Privacy Controls]] |

---

## Overzicht

| Statistiek | Waarde |
|------------|--------|
| **Totaal Controls** | 4 |
| **Baseline** | 4 |
| **Domeinen** | 1 |

---

## Per Domein


### EXT-COM: Compliance

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-COM"
WHERE category = "EXT-COM"
SORT id ASC
```

---


## Relatie met Frameworks

| Framework | Relevante Artikelen |
|-----------|---------------------|
| [[Frameworks/ISO-27001-2022\|ISO 27001]] | A.5.31-A.5.36 |
| [[Frameworks/BIO2\|BIO2]] | B13.1-B13.3 |

---

## Gerelateerde Documenten

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Frameworks/BIO2|BIO 2.0]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
