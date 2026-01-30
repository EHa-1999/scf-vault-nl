---
type: index
name: "Physical Security Controls"
icon: "🏗️"
created: 2026-01-29
---

# 🏗️ Extended Physical Security Controls (EXT-PHY)

> 12 fysieke beveiligingscontrols — ISO 27001 A.7 + BIO B7.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Controls/_index\|📋 Controls]] | [[README\|🏠 Home]] | [[Controls/EXT-P/_index\|🔐 Privacy Controls]] |

---

## Overzicht

| Statistiek | Waarde |
|------------|--------|
| **Totaal Controls** | 12 |
| **Baseline** | 11 |
| **Domeinen** | 4 |

---

## Per Domein


### EXT-PHY1: Secure Areas

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-PHY"
WHERE category = "EXT-PHY1"
SORT id ASC
```

---

### EXT-PHY2: Environmental Protection

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-PHY"
WHERE category = "EXT-PHY2"
SORT id ASC
```

---

### EXT-PHY3: Equipment Security

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-PHY"
WHERE category = "EXT-PHY3"
SORT id ASC
```

---

### EXT-PHY4: Infrastructure

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-PHY"
WHERE category = "EXT-PHY4"
SORT id ASC
```

---


## Relatie met Frameworks

| Framework | Relevante Artikelen |
|-----------|---------------------|
| [[Frameworks/ISO-27001-2022\|ISO 27001]] | A.7.1-A.7.13 |
| [[Frameworks/BIO2\|BIO2]] | B7.1-B7.8 |

---

## Gerelateerde Documenten

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Frameworks/BIO2|BIO 2.0]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
