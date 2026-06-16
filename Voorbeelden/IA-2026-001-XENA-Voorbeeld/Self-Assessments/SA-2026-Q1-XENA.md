---
id: "SA-2026-Q1-XENA"
type: self-assessment
assessment_level: system
name: "Systeem Assessment XENA Q1 2026"
system: "[[Systems/XENA]]"
domain: ""
assessment_type: system
cis_categories: [1, 2, 3, 4, 5, 6, 8, 11, 16]
period: "2026-Q1"
status: Completed
assessor: "System Owner XENA"
assessment_date: 2026-01-15
review_date: 2026-01-25
sign_off_by: "CISO"
sign_off_date: 2026-01-25
overall_score: 82
component_assessments:
  - "[[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-PostgreSQL]]"
  - "[[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-RHEL]]"
  - "[[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-Kubernetes]]"
  - "[[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-NGINX]]"
  - "[[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-MinIO]]"
  - "[[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-KeyCloak]]"
created: 2026-01-15
modified: 2026-01-25
tags:
  - self-assessment
  - system-assessment
  - 2026
  - xena
---

# Systeem Assessment: XENA — Q1 2026

## Assessment Informatie

| Veld | Waarde |
|------|--------|
| **ID** | SA-2026-Q1-XENA |
| **Assessment Level** | Systeem (aggregerend) |
| **Systeem** | [[Systems/XENA]] |
| **Periode** | Q1 2026 |
| **Assessor** | System Owner XENA |
| **Status** | Completed |
| **Overall Score** | **82%** |

## Assessment Structuur

Dit systeem-assessment is opgebouwd uit twee lagen die samen een compleet beeld geven van de beveiligingsstatus van XENA.

**Laag 1 — Component Assessments** beoordelen de technische hardening van individuele componenten aan de hand van hun CIS/EXT Benchmark. Elk component-assessment wordt uitgevoerd door de betreffende technisch beheerder en bevat een recommendation-voor-recommendation beoordeling.

**Laag 2 — Dit systeem-assessment** aggregeert de component-scores, beoordeelt systeem-brede CIS Controls die niet component-specifiek zijn (zoals governance, access management processen en backup-strategie), en vormt het totaaloordeel.

```
┌──────────────────────────────────────────────────┐
│         SA-2026-Q1-XENA (dit document)           │
│         Systeem Assessment — Overall: 82%        │
├──────────────────────────────────────────────────┤
│  Component Assessments (Laag 1):                 │
│  ┌────────────┐ ┌────────────┐ ┌────────────┐   │
│  │ PostgreSQL │ │    RHEL    │ │ Kubernetes │   │
│  │  78 recs   │ │  255 recs  │ │  124 recs  │   │
│  │   84%      │ │   78%      │ │   81%      │   │
│  └────────────┘ └────────────┘ └────────────┘   │
│  ┌────────────┐ ┌────────────┐ ┌────────────┐   │
│  │   NGINX    │ │   MinIO    │ │  KeyCloak  │   │
│  │  52 recs   │ │  11 recs   │ │  15 recs   │   │
│  │   88%      │ │   91%      │ │   87%      │   │
│  └────────────┘ └────────────┘ └────────────┘   │
├──────────────────────────────────────────────────┤
│  Systeem-brede Controls (Laag 2):                │
│  CIS 1 (Inventory), CIS 5 (Accounts),           │
│  CIS 6 (Access), CIS 11 (Recovery),             │
│  CIS 16 (AppSec) — beoordeeld in dit document   │
└──────────────────────────────────────────────────┘
```

---

## Scope Beschrijving

Dit assessment beoordeelt alle security control implementations voor het XENA document management systeem. Het systeem bestaat uit de volgende componenten:

| Component | Functie | Benchmark | Recs |
|-----------|---------|-----------|------|
| PostgreSQL | Metadata database | CIS PostgreSQL 16 v1.0.0 | 78 |
| RHEL 9 | Operating system | CIS RHEL 9 v2.0.0 | 255 |
| K3S | Container orchestration | CIS Kubernetes 1.29 v1.0.0 | 124 |
| NGINX | Reverse proxy / TLS termination | CIS NGINX v2.1.0 | 52 |
| MinIO | Object storage | EXT MinIO v1.0 | 11 |
| KeyCloak | Authentication & authorization | EXT KeyCloak v1.0 | 15 |
| **Totaal** | | **4 CIS + 2 EXT benchmarks** | **535** |

Niet in scope: Apache NiFi (geen benchmark beschikbaar), Elasticsearch (nog in evaluatie), OpenBAO (nog niet gedeployed), Saviynt (SaaS, leveranciersbeoordeling).

### BIV Classificatie

| Aspect | Classificatie | Toelichting |
|--------|---------------|-------------|
| Beschikbaarheid | Midden | Uitval heeft operationele impact |
| Integriteit | Hoog | Documenten moeten betrouwbaar zijn |
| Vertrouwelijkheid | Hoog | Bevat gevoelige gemeentelijke documenten |

---

## Component Assessments — Overzicht

### Automatisch Overzicht

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Assessment",
  component as "Component",
  benchmark as "Benchmark",
  total_recommendations as "Recs",
  compliant as "✅",
  partial as "⚠️",
  non_compliant as "❌",
  not_applicable as "➖",
  score_percentage + "%" as "Score",
  status as "Status"
FROM "Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments"
WHERE assessment_level = "component"
SORT score_percentage DESC
```

### Handmatig Overzicht (als Dataview niet beschikbaar)

| Component | Benchmark | Recs | ✅ | ⚠️ | ❌ | ➖ | ☐ | Score | Assessor |
|-----------|-----------|------|-----|------|------|------|------|-------|----------|
| PostgreSQL | CIS PG 16 | 78 | 59 | 6 | 3 | 2 | 5 | **84%** | DBA Team Lead |
| RHEL 9 | CIS RHEL 9 | 255 | 178 | 25 | 12 | 15 | 25 | **78%** | Linux Team Lead |
| Kubernetes | CIS K8s 1.29 | 124 | 89 | 10 | 5 | 8 | 12 | **81%** | Platform Engineer |
| NGINX | CIS NGINX | 52 | 42 | 4 | 1 | 2 | 3 | **88%** | Platform Engineer |
| MinIO | EXT MinIO | 11 | 9 | 1 | 0 | 0 | 1 | **91%** | Storage Admin |
| KeyCloak | EXT KC | 15 | 11 | 2 | 1 | 0 | 1 | **87%** | IAM Specialist |
| **Totaal** | **6 benchmarks** | **535** | **388** | **48** | **22** | **27** | **47** | **82%** | |

> **Gewogen systeemscore:** (388 + 0,5 × 48) / (535 − 27 − 47) × 100% = 412 / 461 ≈ **89%** (uitgebreid) of **84%** (conservatief, alleen volledige compliance)

---

## Systeem-brede Controls Beoordeling

De volgende CIS Controls worden niet (alleen) gedekt door component-benchmarks en vereisen een systeem-brede beoordeling.

### CIS 1: Inventaris van Bedrijfsmiddelen

| Control | Status | Evidence | Oordeel |
|---------|--------|----------|---------|
| CIS-1.1 Asset Inventory | ✅ | CMDB export | Alle XENA componenten geregistreerd in CMDB |
| CIS-1.2 Address Unauthorized | ✅ | K3S admission control | Alleen goedgekeurde images toegestaan |

**Toelichting:** De XENA component-inventaris is compleet en actueel in de CMDB. K3S admission control voorkomt deployment van niet-goedgekeurde containers.

---

### CIS 3: Gegevensbescherming

| Control | Status | Evidence | Oordeel |
|---------|--------|----------|---------|
| CIS-3.6 / CIS-3.11 Encryption at Rest | ✅ | Component assessments PG + MinIO | Data-at-rest encryptie volledig |
| CIS-3.10 Encryption in Transit | ✅ | Component assessments PG + NGINX | TLS overal actief |

**Toelichting:** Data-at-rest encryptie is geverifieerd via de PostgreSQL en MinIO component assessments. Data-in-transit wordt afgedekt door NGINX (TLS termination) en PostgreSQL (SSL). Zie de betreffende component assessments voor details.

---

### CIS 5: Accountbeheer

| Control | Status | Evidence | Oordeel |
|---------|--------|----------|---------|
| CIS-5.1 Account Inventory | ✅ | Saviynt export | Centraal beheerd via Saviynt |
| CIS-5.4 Restrict Admin Privileges | ✅ | Component assessments | Per component geverifieerd |
| CIS-5.5 Service Account Inventory | ⚠️ | Handmatige lijst | Gedeeltelijk; 3 service accounts niet in Saviynt |

**Toelichting:** Gebruikersaccounts worden centraal beheerd via Saviynt. Drie technische service accounts (NiFi-naar-PostgreSQL, NiFi-naar-MinIO, backup-agent) zijn nog niet opgenomen in het Identity Governance systeem. Dit vormt een gap in de auditability.

---

### CIS 6: Access Management

| Control | Status | Evidence | Oordeel |
|---------|--------|----------|---------|
| CIS-6.3 MFA External Applications | ✅ | KeyCloak config | MFA actief voor alle externe toegang |
| CIS-6.4 MFA Remote Access | ✅ | VPN + KeyCloak | MFA voor beheer via VPN |
| CIS-6.5 MFA Admin Access | ⚠️ | KeyCloak config | MFA actief voor admins, niet voor alle privileged users |

**Toelichting:** MFA is geïmplementeerd voor beheerders en externe toegang. Zie bevinding FIND-2026-001 voor de gap bij privileged users.

---

### CIS 8: Audit Logging

| Control | Status | Evidence | Oordeel |
|---------|--------|----------|---------|
| CIS-8.2 Collect Audit Logs | ✅ | Component assessments | Logging per component geverifieerd |
| CIS-8.9 Centralize Audit Logs | ✅ | ELK stack config | Alle logs centraal in Elasticsearch |
| CIS-8.10 Retain Audit Logs | ✅ | Retention policy | 90 dagen online, 1 jaar archief |

**Toelichting:** De logging-keten is volledig: elk component logt conform zijn benchmark, Fluentd verzamelt centraal, en Elasticsearch biedt retentie en analyse. De component assessments vormen het technische bewijs dat logging per component correct is geconfigureerd.

---

### CIS 11: Gegevensherstel

| Control | Status | Evidence | Oordeel |
|---------|--------|----------|---------|
| CIS-11.1 Data Recovery Process | ✅ | DR-plan document | Gedocumenteerd recovery proces |
| CIS-11.2 Automated Backups | ✅ | Component assessments PG + MinIO | Dagelijkse backups geverifieerd |
| CIS-11.5 Test Data Recovery | ⚠️ | Testlog Q4 2025 | Laatst getest Q4 2025; Q1 test uitgesteld |

**Toelichting:** Backups draaien automatisch. De laatste volledige recovery test was in Q4 2025; de geplande Q1 test is uitgesteld vanwege de migratie-werkzaamheden.

---

### CIS 16: Applicatie Security

| Control | Status | Evidence | Oordeel |
|---------|--------|----------|---------|
| CIS-16.1 Secure SDLC | ✅ | Development guidelines | OWASP-gebaseerd ontwikkelproces |
| CIS-16.4 Third-party Inventory | ✅ | SBOM | Software Bill of Materials actueel |
| CIS-16.7 Hardening Templates | ✅ | CIS Benchmarks | Component benchmarks als hardening baseline |

**Toelichting:** De CIS Benchmarks in de vault fungeren zelf als de "hardening templates" voor CIS-16.7, waarmee deze control nu concreet is ingevuld.

---

## Baseline Controls Status

> [!warning] Comply or Explain
> Baseline controls moeten geïmplementeerd zijn óf een goedgekeurde exception hebben.

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  status as "Status",
  choice(status = "Verified", "✅", 
    choice(status = "Implemented", "🟢",
      choice(status = "Partial", "⚠️ ACTIE",
        choice(status = "In Progress", "⚠️ ACTIE", "❌ ACTIE")))) as "●"
FROM "Implementations"
WHERE contains(file.name, "XENA")
SORT id ASC
```

---

## Totaal Samenvatting

### Score Overzicht

| Onderdeel | Totaal | Compliant | Partial | Non-Compl | Score |
|-----------|--------|-----------|---------|-----------|-------|
| Component Assessments (535 recs) | 535 | 388 | 48 | 22 | 84% |
| Systeem-brede Controls | 15 | 12 | 3 | 0 | 90% |
| **Overall** | **550** | **400** | **51** | **22** | **82%** |

### Top Risico's uit Component Assessments

| Component | # | Gap | Ernst | Actie |
|-----------|---|-----|-------|-------|
| RHEL | Div. | 12 non-compliant recommendations | Hoog | Hardening sprint plannen |
| K3S | Div. | 5 non-compliant, waaronder pod security | Hoog | Platform team Q2 |
| PostgreSQL | 4.3/4.6 | Legacy privilege grants op PUBLIC | Hoog | DBA team, na impact-analyse |
| KeyCloak | — | 1 non-compliant (session hardening) | Medium | IAM team Q2 |

### Geïdentificeerde Bevindingen

| ID | Bevinding | Ernst | Bron |
|----|-----------|-------|------|
| FIND-2026-001 | MFA niet volledig uitgerold voor privileged users | Hoog | Systeem-brede beoordeling |
| FIND-2026-002 | Service accounts niet in Saviynt | Medium | Systeem-brede beoordeling |
| FIND-2026-003 | RHEL hardening onvoldoende (78% < 85% target) | Hoog | Component Assessment RHEL |
| FIND-2026-004 | Recovery test niet uitgevoerd in Q1 | Medium | Systeem-brede beoordeling |

---

## Conclusie

Het XENA systeem scoort overall **82%** op de gecombineerde assessment. De technische hardening van individuele componenten is overwegend goed (84% gemiddeld over 535 benchmark recommendations), met NGINX en MinIO als best scorende componenten. RHEL hardening vormt het grootste verbeterpunt met 12 non-compliant recommendations. De systeem-brede controls scoren 90%, met de service account governance en MFA-uitrol als bekendste gaps.

De invoering van component-level assessments gebaseerd op benchmark checklists geeft een significant gedetailleerder en objectiever beeld dan het vorige systeem-level-only assessment. De traceerbaarheid van benchmark recommendation → component assessment → systeem assessment → audit dossier is hiermee volledig.

---

## Evidence Referenties

Evidence voor dit systeem-assessment is te vinden in:
- De individuele component assessments (elk met eigen evidence register)
- De Evidence/ map in dit audit dossier

| Evidence ID | Type | Beschrijving | Locatie |
|-------------|------|--------------|---------|
| EVD-SYS-001 | Export | CMDB component inventaris | Evidence/cmdb-xena-export.csv |
| EVD-SYS-002 | Config | Saviynt account inventory | Evidence/saviynt-xena-accounts.pdf |
| EVD-SYS-003 | Config | ELK stack logging configuratie | Evidence/elk-config.yaml |
| EVD-SYS-004 | Test | Recovery test rapport Q4 2025 | Evidence/dr-test-q4-2025.pdf |

---

## Sign-Off

| Rol | Naam | Datum |
|-----|------|-------|
| Assessor | System Owner XENA | 2026-01-15 |
| System Owner | System Owner XENA | 2026-01-20 |
| CISO | CISO | 2026-01-25 |

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 0.1 | 2026-01-15 | System Owner | Initiële versie (alleen systeem-brede controls) |
| 0.2 | 2026-01-22 | System Owner | Component assessment resultaten geïntegreerd |
| 1.0 | 2026-01-25 | CISO | Reviewed, bevindingen aangemaakt, signed-off |
