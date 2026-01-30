---
id: "CIS-Controls-v8"
type: framework
name: "CIS Controls v8"
version: "8.0"
framework_type: "Best Practices"
status: active
created: 2026-01-27
modified: 2026-01-28
tags:
  - framework
  - cis_controls
---

# CIS Controls v8

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Versie** | 8.0 |
| **Type** | Best Practices |
| **Scope** | Tactische beveiligingsmaatregelen |
| **Status** | Actief |

## Beschrijving

De CIS Controls zijn een geprioriteerde set van acties die organisaties kunnen nemen om zich te beschermen tegen de meest voorkomende cyberaanvallen. De controls zijn georganiseerd in Implementation Groups (IG1, IG2, IG3) voor gefaseerde implementatie.

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
│  CIS Controls      ← Tactische maatregelen  ◄── U BENT HIER │
│      ↓                                                      │
│  Implementations   ← Concrete implementaties                │
└─────────────────────────────────────────────────────────────┘
```

### Bovenliggende Frameworks

- [[Frameworks/ISO-27001-2022]]
- [[Frameworks/NIS2]]
- [[Frameworks/BIO2]]

### Onderliggende Frameworks

*Geen - dit is het tactische niveau*

### Gekoppelde Security Requirements

- [[Frameworks/Security-Requirements/SR-1 - Security Governance Framework|SR-1 - Security Governance Framework]]
- [[Frameworks/Security-Requirements/SR-2 - Risk Assessment & Management|SR-2 - Risk Assessment & Management]]
- [[Frameworks/Security-Requirements/SR-3 - Access Control & Identity Management|SR-3 - Access Control & Identity Management]]
- [[Frameworks/Security-Requirements/SR-4 - Cryptographic Controls & Gegevensbescherming|SR-4 - Cryptographic Controls & Gegevensbescherming]]
- [[Frameworks/Security-Requirements/SR-5 - Secure System Development & Maintenance|SR-5 - Secure System Development & Maintenance]]
- [[Frameworks/Security-Requirements/SR-6 - Security Monitoring & Logging|SR-6 - Security Monitoring & Logging]]
- *...en 6 meer*

## CIS Control Categorieën

| Cat | Naam | Controls |
|-----|------|----------|
| **1** | Inventarisatie en Beheer van Bedrijfsmiddelen | 5 |
| **2** | Inventarisatie en Beheer van Software | 7 |
| **3** | Gegevensbescherming | 14 |
| **4** | Secure Configuration of Assets | 12 |
| **5** | Accountbeheer | 6 |
| **6** | Toegangsbeheer | 8 |
| **7** | Continu Kwetsbaarheidsbeheer | 7 |
| **8** | Auditlog Beheer | 12 |
| **9** | E-mail en Webbrowser Beveiliging | 7 |
| **10** | Malware Bescherming | 7 |
| **11** | Gegevensherstel | 5 |
| **12** | Netwerkinfrastructuur Beheer | 8 |
| **13** | Netwerkmonitoring en Verdediging | 11 |
| **14** | Security Awareness en Training | 9 |
| **15** | Leveranciersbeheer | 7 |
| **16** | Applicatiebeveiliging | 14 |
| **17** | Incidentrespons Beheer | 9 |
| **18** | Penetratietesten | 5 |

## Implementation Groups

| IG | Niveau | Beschrijving |
|----|--------|--------------|
| **IG1** | Basic | Essentiële cyber hygiëne - alle organisaties |
| **IG2** | Foundational | Voor organisaties met IT-personeel |
| **IG3** | Organizational | Voor organisaties met security specialisten |

## Alle CIS Controls

```dataview
TABLE WITHOUT ID
  file.link as "Control",
  category as "Cat",
  priority_label as "Prioriteit",
  status as "Status"
FROM "Controls/CIS"
SORT id ASC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-28 | Hiërarchie en relaties toegevoegd | @architect |
| 2026-01-27 | Initiële versie | @architect |
