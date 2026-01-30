---
id: "BIO2"
type: framework
name: "Baseline Informatiebeveiliging Overheid 2.0"
version: "2.0"
framework_type: "Nederlandse Overheidsstandaard"
status: active
created: 2026-01-27
modified: 2026-01-28
tags:
  - framework
  - bio2
---

# Baseline Informatiebeveiliging Overheid 2.0

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Versie** | 2.0 |
| **Type** | Nederlandse Overheidsstandaard |
| **Scope** | Informatiebeveiliging voor Nederlandse overheid |
| **Status** | Actief |

## Beschrijving

De BIO (Baseline Informatiebeveiliging Overheid) is het normenkader voor informatiebeveiliging binnen de Nederlandse overheid. BIO 2.0 is gebaseerd op ISO 27001:2022 en bevat aanvullende overheidsspecifieke eisen en richtlijnen.

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

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]

### Onderliggende Frameworks

- [[Frameworks/CIS-Controls-v8|CIS Controls v8]]

### Gekoppelde Security Requirements

- [[Frameworks/Security-Requirements/SR-1 - Security Governance Framework|SR-1 - Security Governance Framework]]
- [[Frameworks/Security-Requirements/SR-2 - Risk Assessment & Management|SR-2 - Risk Assessment & Management]]
- [[Frameworks/Security-Requirements/SR-3 - Access Control & Identity Management|SR-3 - Access Control & Identity Management]]
- [[Frameworks/Security-Requirements/SR-4 - Cryptographic Controls & Gegevensbescherming|SR-4 - Cryptographic Controls & Gegevensbescherming]]
- [[Frameworks/Security-Requirements/SR-5 - Secure System Development & Maintenance|SR-5 - Secure System Development & Maintenance]]
- [[Frameworks/Security-Requirements/SR-6 - Security Monitoring & Logging|SR-6 - Security Monitoring & Logging]]
- *...en 6 meer*

## Hoofdstukken

| Hfst | Onderwerp |
|------|----------|
| **5** | Organisatorische beheersmaatregelen |
| **6** | Beheersmaatregelen voor mensen |
| **7** | Fysieke beheersmaatregelen |
| **8** | Technologische beheersmaatregelen |


## Gekoppelde Controls

```dataview
TABLE WITHOUT ID
  file.link as "Control",
  priority_label as "Prioriteit",
  status as "Status"
FROM "Controls"
WHERE contains(file.frontmatter, "bio")
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
