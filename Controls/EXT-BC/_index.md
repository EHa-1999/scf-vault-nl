---
type: index
name: "Business Continuity Controls"
icon: "🔄"
created: 2026-01-29
---

# 🔄 Extended Business Continuity Controls (EXT-BC)

> 4 continuïteitscontrols — BIO B12 + NIS2 Art.21(2)(c).

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


### EXT-BC: Business Continuity

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-BC"
WHERE category = "EXT-BC"
SORT id ASC
```

---


## Relatie met Frameworks

| Framework | Relevante Artikelen |
|-----------|---------------------|
| [[Frameworks/ISO-27001-2022\|ISO 27001]] | A.5.30, A.8.14 |
| [[Frameworks/NIS2\|NIS2]] | Art. 21(2)(c) |
| [[Frameworks/BIO2\|BIO2]] | B12.1-B12.4 |

---

## Gerelateerde Documenten

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Frameworks/BIO2|BIO 2.0]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
