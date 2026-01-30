---
id: "NIST-CSF"
type: framework
name: "NIST Cybersecurity Framework"
version: "2.0"
framework_type: "Framework"
status: active
created: 2026-01-27
modified: 2026-01-28
tags:
  - framework
  - nist_csf
---

# NIST Cybersecurity Framework

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Versie** | 2.0 |
| **Type** | Framework |
| **Scope** | Overkoepelend raamwerk voor cybersecurity |
| **Status** | Actief |

## Beschrijving

Het NIST Cybersecurity Framework biedt een overkoepelende structuur voor het organiseren van cybersecurity activiteiten rond vijf kernfuncties: Identify, Protect, Detect, Respond en Recover. Het fungeert als de hoogste abstractielaag in de security governance hiërarchie.

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

- [[Frameworks/ISO-27001-2022|ISO 27001:2022]]
- [[Frameworks/NIS2|NIS2 Directive]]
- [[Frameworks/BIO2|Baseline Informatiebeveiliging Overheid 2.0]]

### Gekoppelde Security Requirements

- [[Frameworks/Security-Requirements/SR-1 - Security Governance Framework|SR-1 - Security Governance Framework]]
- [[Frameworks/Security-Requirements/SR-2 - Risk Assessment & Management|SR-2 - Risk Assessment & Management]]
- [[Frameworks/Security-Requirements/SR-3 - Access Control & Identity Management|SR-3 - Access Control & Identity Management]]
- [[Frameworks/Security-Requirements/SR-4 - Cryptographic Controls & Gegevensbescherming|SR-4 - Cryptographic Controls & Gegevensbescherming]]
- [[Frameworks/Security-Requirements/SR-5 - Secure System Development & Maintenance|SR-5 - Secure System Development & Maintenance]]
- [[Frameworks/Security-Requirements/SR-6 - Security Monitoring & Logging|SR-6 - Security Monitoring & Logging]]
- *...en 7 meer*

## NIST CSF Functies

| Code | Functie | Focus |
|------|---------|-------|
| **ID** | Identify | Asset management, risicobeoordeling, governance |
| **PR** | Protect | Toegangscontrole, awareness, data security |
| **DE** | Detect | Monitoring, detectie processen |
| **RS** | Respond | Incident response, communicatie |
| **RC** | Recover | Herstel, verbeteringen |


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
