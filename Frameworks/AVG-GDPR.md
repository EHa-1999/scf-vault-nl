---
id: "AVG-GDPR"
type: framework
name: "Algemene Verordening Gegevensbescherming"
version: "2016/679"
framework_type: "Europese Verordening"
status: active
created: 2026-01-27
modified: 2026-01-28
tags:
  - framework
  - avg_gdpr
---

# Algemene Verordening Gegevensbescherming

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Versie** | 2016/679 |
| **Type** | Europese Verordening |
| **Scope** | Privacy en bescherming persoonsgegevens |
| **Status** | Actief |

## Beschrijving

De AVG (GDPR) is de Europese verordening voor de bescherming van persoonsgegevens. De verordening stelt eisen aan de verwerking van persoonsgegevens, rechten van betrokkenen, en technische en organisatorische beveiligingsmaatregelen.

## Framework Hiërarchie

```
┌─────────────────────────────────────────────────────────────┐
│                    GOVERNANCE HIËRARCHIE                    │
├─────────────────────────────────────────────────────────────┤
│  NIST CSF          ← Overkoepelend raamwerk                 │
│      ↓                                                      │
│  ISO 27001 / NIS2  ← Compliance frameworks                  │
│      ↓                                                      │
│  BIO2              ← Overheidsspecifiek                     │
│      ↓                                                      │
│  Security Req.     ← Core security domeinen (SR-1..SR-13)   │
│      ↓                                                      │
│  CIS Controls      ← Tactische maatregelen                  │
│      ↓                                                      │
│  Implementations   ← Concrete implementaties                │
└─────────────────────────────────────────────────────────────┘
```

### Bovenliggende Frameworks

*Geen (hoogste niveau)*

### Onderliggende Frameworks

*Geen (laagste niveau)*

### Gekoppelde Security Requirements

- [[Frameworks/Security-Requirements/SR-13 - Privacy|SR-13 - Privacy]]

## Hoofdstukken

| Hfst | Onderwerp |
|------|----------|
| **Art.5** | Beginselen inzake verwerking |
| **Art.6** | Rechtmatigheid van verwerking |
| **Art.7** | Voorwaarden voor toestemming |
| **Art.12-22** | Rechten van betrokkenen |
| **Art.24-25** | Verantwoordingsplicht |
| **Art.28** | Verwerkers |
| **Art.30** | Register van verwerkingsactiviteiten |
| **Art.32** | Beveiliging van verwerking |
| **Art.33-34** | Melding datalekken |
| **Art.35** | Gegevensbeschermingseffectbeoordeling |
| **Art.37-39** | Functionaris gegevensbescherming |


## Gekoppelde Controls

```dataview
TABLE WITHOUT ID
  file.link as "Control",
  priority_label as "Prioriteit",
  status as "Status"
FROM "Controls"
WHERE contains(file.frontmatter, "avg")
SORT priority DESC
LIMIT 20
```

## Compliance Status per Systeem

```dataview
TABLE WITHOUT ID
  system as "Systeem",
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "✅",
  length(filter(rows, (r) => r.impl_status = "Partial")) as "🔄",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "📋"
FROM "Implementations"
GROUP BY system
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Hiërarchie en relaties toegevoegd | @architect |
| 2026-01-27 | Initiële versie | @architect |
