---
type: index
name: "HR Security Controls"
icon: "👥"
created: 2026-01-29
---

# 👥 Extended HR Security Controls (EXT-HR)

> 6 HR security controls voor personele beveiliging — ISO 27001 A.6 + BIO B3.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Controls/_index\|📋 Controls]] | [[README\|🏠 Home]] | [[Controls/EXT-P/_index\|🔐 Privacy Controls]] |

---

## Overzicht

| Statistiek | Waarde |
|------------|--------|
| **Totaal Controls** | 6 |
| **Baseline** | 6 |
| **Domeinen** | 3 |

---

## Per Domein


### EXT-HR1: Employment Security

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-HR"
WHERE category = "EXT-HR1"
SORT id ASC
```

---

### EXT-HR2: HR Processes

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-HR"
WHERE category = "EXT-HR2"
SORT id ASC
```

---

### EXT-HR3: Awareness & Training

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-HR"
WHERE category = "EXT-HR3"
SORT id ASC
```

---


## Relatie met Frameworks

| Framework | Relevante Artikelen |
|-----------|---------------------|
| [[Frameworks/ISO-27001-2022\|ISO 27001]] | A.6.1-A.6.6 |
| [[Frameworks/NIS2\|NIS2]] | Art. 21(2)(g) |
| [[Frameworks/BIO2\|BIO2]] | B3.1-B3.5 |

---

## Gerelateerde Documenten

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Frameworks/BIO2|BIO 2.0]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
