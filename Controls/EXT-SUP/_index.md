---
type: index
name: "Supplier Management Controls"
icon: "🤝"
created: 2026-01-29
---

# 🤝 Extended Supplier Management Controls (EXT-SUP)

> 4 leveranciersbeheerscontrols voor supply chain security — BIO B11 + NIS2.

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


### EXT-SUP: Supplier Management

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-SUP"
WHERE category = "EXT-SUP"
SORT id ASC
```

---


## Relatie met Frameworks

| Framework | Relevante Artikelen |
|-----------|---------------------|
| [[Frameworks/ISO-27001-2022\|ISO 27001]] | A.5.19-A.5.22 |
| [[Frameworks/NIS2\|NIS2]] | Art. 21(2)(d) |
| [[Frameworks/BIO2\|BIO2]] | B11.1-B11.4 |

---

## Gerelateerde Documenten

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Frameworks/BIO2|BIO 2.0]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
