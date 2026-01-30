---
id: "NIS2"
type: framework
name: "NIS2 Directive"
version: "2022/2555"
framework_type: "Europese Richtlijn"
status: active
created: 2026-01-27
modified: 2026-01-28
tags:
  - framework
  - nis2
---

# NIS2 Directive

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Versie** | 2022/2555 |
| **Type** | Europese Richtlijn |
| **Scope** | Netwerk- en Informatiebeveiliging |
| **Status** | Actief |

## Beschrijving

De NIS2 Richtlijn (2022/2555) is de Europese wetgeving voor cybersecurity die essentiële en belangrijke entiteiten verplicht om passende technische en organisatorische maatregelen te nemen. Artikel 21 specificeert de minimale beveiligingsmaatregelen.

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

- [[Frameworks/NIST-CSF|NIST Cybersecurity Framework]]

### Onderliggende Frameworks

- [[Frameworks/BIO2|Baseline Informatiebeveiliging Overheid 2.0]]
- [[Frameworks/CIS-Controls-v8|CIS Controls v8]]

### Gekoppelde Security Requirements

- [[Frameworks/Security-Requirements/SR-1 - Security Governance Framework|SR-1 - Security Governance Framework]]
- [[Frameworks/Security-Requirements/SR-2 - Risk Assessment & Management|SR-2 - Risk Assessment & Management]]
- [[Frameworks/Security-Requirements/SR-3 - Access Control & Identity Management|SR-3 - Access Control & Identity Management]]
- [[Frameworks/Security-Requirements/SR-4 - Cryptographic Controls & Gegevensbescherming|SR-4 - Cryptographic Controls & Gegevensbescherming]]
- [[Frameworks/Security-Requirements/SR-5 - Secure System Development & Maintenance|SR-5 - Secure System Development & Maintenance]]
- [[Frameworks/Security-Requirements/SR-6 - Security Monitoring & Logging|SR-6 - Security Monitoring & Logging]]
- *...en 5 meer*

## Relevante Artikelen

| Artikel | Onderwerp |
|---------|----------|
| **Art.20** | Governance en verantwoordelijkheden |
| **Art.21(1)** | Risicobeheermaatregelen |
| **Art.21(2)(a)** | Beleid voor risicoanalyse |
| **Art.21(2)(b)** | Incidentafhandeling |
| **Art.21(2)(c)** | Bedrijfscontinuïteit |
| **Art.21(2)(d)** | Toeleveringsketenbeveiliging |
| **Art.21(2)(e)** | Beveiliging bij verwerving |
| **Art.21(2)(f)** | Effectiviteitsbeoordeling |
| **Art.21(2)(g)** | Cyberhygiëne en training |
| **Art.21(2)(h)** | Cryptografie |
| **Art.21(2)(i)** | Toegangsbeleid |
| **Art.21(3)** | Leveranciersrisico's |


## Gekoppelde Controls

```dataview
TABLE WITHOUT ID
  file.link as "Control",
  priority_label as "Prioriteit",
  status as "Status"
FROM "Controls"
WHERE contains(file.frontmatter, "nis")
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
