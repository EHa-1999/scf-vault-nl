---
type: index
name: "Privacy Controls"
icon: "🔐"
created: 2026-01-28
---

# 🔐 Extended Privacy Controls (EXT-P)

> 27 privacy-specifieke controls voor AVG/GDPR compliance — allemaal baseline.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Controls/_index\|📋 Controls]] | [[README\|🏠 Home]] | [[Controls/CIS/_index\|🛡️ CIS Controls]] |

---

## Overzicht

| Statistiek | Waarde |
|------------|--------|
| **Totaal Controls** | 27 |
| **Baseline** | 27 (100%) |
| **Domeinen** | 10 |

> [!important] Alle Baseline
> Alle privacy controls zijn **baseline** vanwege wettelijke AVG vereisten. Er is geen "optioneel" voor privacy.

---

## Per Domein

### EXT-P1: Privacy Governance
*Beleid, FG aanstelling, verwerkingsregister*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P1"
SORT id ASC
```

---

### EXT-P2: Rechten van Betrokkenen
*Inzage, correctie, verwijdering, portabiliteit*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P2"
SORT id ASC
```

---

### EXT-P3: Rechtmatige Grondslag
*Toestemming, overeenkomst, wettelijke verplichting*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P3"
SORT id ASC
```

---

### EXT-P4: Transparantie
*Privacy statements, informatieplicht*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P4"
SORT id ASC
```

---

### EXT-P5: Dataminimalisatie
*Doelbinding, bewaartermijnen*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P5"
SORT id ASC
```

---

### EXT-P6: Datalekken
*Detectie, melding AP, communicatie betrokkenen*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P6"
SORT id ASC
```

---

### EXT-P7: DPIA
*Privacy Impact Assessment*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P7"
SORT id ASC
```

---

### EXT-P8: Internationale Doorgifte
*Adequaatheidsbesluit, SCC's, BCR's*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P8"
SORT id ASC
```

---

### EXT-P9: Verwerkers
*Verwerkersovereenkomsten, toezicht*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P9"
SORT id ASC
```

---

### EXT-P10: Privacy by Design
*Ingebouwde privacy, SDLC integratie*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control"
FROM "Controls/EXT-P"
WHERE category = "EXT-P10"
SORT id ASC
```

---

## Relatie met Frameworks

| Framework | Relevante Artikelen |
|-----------|---------------------|
| [[Frameworks/AVG-GDPR\|AVG/GDPR]] | Art. 5-49 |
| [[Frameworks/NIS2\|NIS2]] | Art. 21(2)(f) |
| [[Frameworks/BIO2\|BIO2]] | Hoofdstuk Privacy |
| [[Frameworks/ISO-27001-2022\|ISO 27001]] | A.5.34, A.5.35 |

---

## Gerelateerde Documenten

- [[Frameworks/AVG-GDPR|AVG/GDPR Framework]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
- [[Documentatie/System Onboarding Guide|System Onboarding Guide]]
