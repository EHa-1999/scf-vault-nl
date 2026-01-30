---
type: index
name: "Organizational Controls"
icon: "🏢"
created: 2026-01-29
---

# 🏢 Extended Organizational Controls (EXT-O)

> 18 organisatorische controls voor governance, beleid en procedures — ISO 27001 A.5 coverage.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Controls/_index\|📋 Controls]] | [[README\|🏠 Home]] | [[Controls/EXT-P/_index\|🔐 Privacy Controls]] |

---

## Overzicht

| Statistiek | Waarde |
|------------|--------|
| **Totaal Controls** | 18 |
| **Baseline** | 17 |
| **Domeinen** | 5 |

---

## Per Domein


### EXT-O1: Security Governance

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-O"
WHERE category = "EXT-O1"
SORT id ASC
```

---

### EXT-O2: External Relations

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-O"
WHERE category = "EXT-O2"
SORT id ASC
```

---

### EXT-O3: Asset & Information Management

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-O"
WHERE category = "EXT-O3"
SORT id ASC
```

---

### EXT-O4: Operational Security

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-O"
WHERE category = "EXT-O4"
SORT id ASC
```

---

### EXT-O5: Compliance & Audit

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-O"
WHERE category = "EXT-O5"
SORT id ASC
```

---


## Relatie met Frameworks

| Framework | Relevante Artikelen |
|-----------|---------------------|
| [[Frameworks/ISO-27001-2022\|ISO 27001]] | A.5.1-A.5.37 |
| [[Frameworks/NIS2\|NIS2]] | Art. 20, 21(2)(a), 23 |
| [[Frameworks/BIO2\|BIO2]] | B1, B2, B4, B5, B8, B13 |

---

## Gerelateerde Documenten

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Frameworks/BIO2|BIO 2.0]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
