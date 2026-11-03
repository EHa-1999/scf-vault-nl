---
type: documentation
title: "SCF Vault Architectuur en Samenhang"
version: "1.0"
created: 2025-01-27
modified: 2025-01-27
author: "XENA Architecture Team"
tags:
  - documentatie
  - architectuur
  - handleiding
---

# SCF Vault Architectuur en Samenhang

Dit document beschrijft de architectuur, structuur en onderlinge samenhang van alle componenten binnen de Security Control Framework (SCF) Vault.

## Inleiding

De SCF Vault is ontworpen als een flexibel, herbruikbaar framework voor het beheren van security controls over meerdere systemen. Het centrale uitgangspunt is dat security controls niet slechts een checklist zijn, maar een levend systeem van maatregelen die specifiek moeten worden geïmplementeerd per technische component, compleet met meetbare criteria en bewijsvoering.

## Conceptueel Model

De kern van het SCF bestaat uit zes primaire entiteiten die samen een volledig beeld geven van de security posture:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         CONCEPTUEEL MODEL                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│                           ┌───────────────┐                                 │
│                           │   FRAMEWORK   │                                 │
│                           │ (ISO, NIS2,   │                                 │
│                           │  BIO2, AVG)   │                                 │
│                           └───────┬───────┘                                 │
│                                   │ mapped to                               │
│                                   ▼                                         │
│                     ┌─────────────────────────────┐                         │
│                     │   SECURITY REQUIREMENT      │                         │
│                     │        (SR-1 t/m SR-13)     │                         │
│                     │  "Core Security Domains"    │                         │
│                     └─────────────┬───────────────┘                         │
│                                   │ grouped into                            │
│                                   ▼                                         │
│                           ┌───────────────┐                                 │
│                           │   CONTROL     │                                 │
│                           │  (CIS, EXT-P) │                                 │
│                           └───────┬───────┘                                 │
│                                   │                                         │
│              ┌────────────────────┼────────────────────┐                    │
│              │                    │                    │                    │
│              ▼                    ▼                    ▼                    │
│       ┌───────────┐       ┌─────────────┐      ┌───────────┐               │
│       │  SYSTEM   │◄─────►│IMPLEMENTATION│◄────►│ COMPONENT │               │
│       │(XENA, ZGW)│       │             │      │(MinIO,    │               │
│       └───────────┘       │  • DoD      │      │ PostgreSQL)│              │
│                           │  • Evidence │      └───────────┘               │
│                           │  • Status   │                                   │
│                           └──────┬──────┘                                   │
│                                  │                                          │
│                                  ▼                                          │
│                           ┌───────────────┐                                 │
│                           │     RISK      │                                 │
│                           │  (gekoppeld   │                                 │
│                           │   risico)     │                                 │
│                           └───────────────┘                                 │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Entiteiten en Hun Rol

### 1. Frameworks (`/Frameworks`)

Frameworks vormen de strategische laag van het SCF. Ze vertegenwoordigen de externe compliance-eisen waaraan de organisatie moet voldoen.

| Framework | Type | Scope |
|-----------|------|-------|
| **ISO 27001:2022** | Internationale standaard | ISMS, certificering |
| **NIS2** | Europese richtlijn | Netwerk- en informatiebeveiliging |
| **BIO2** | Nederlandse overheidsstandaard | Baseline informatiebeveiliging |
| **AVG/GDPR** | Europese verordening | Privacy en gegevensbescherming |
| **CIS Controls v8** | Best practices | Tactische beveiligingsmaatregelen |
| **NIST CSF** | Framework | Identify, Protect, Detect, Respond, Recover |

Elk framework is gekoppeld aan de controls via de frontmatter velden `iso27001`, `nis2`, `bio2` in de control bestanden.

### 2. Security Requirements (`/Frameworks/Security-Requirements`)

Security Requirements (SR-1 t/m SR-13) vormen de **brug** tussen de high-level frameworks en de tactische controls. Ze zijn gebaseerd op de PCI-DSS security cores, vertaald naar generieke security domeinen.

| SR | Naam | Primaire CIS Mapping |
|----|------|---------------------|
| **SR-1** | Security Governance Framework | CIS 14, 17 |
| **SR-2** | Risk Assessment & Management | CIS 7, 18 |
| **SR-3** | Access Control & Identity Management | CIS 5, 6 |
| **SR-4** | Cryptographic Controls & Gegevensbescherming | CIS 3 |
| **SR-5** | Secure System Development & Maintenance | CIS 2, 10, 16 |
| **SR-6** | Security Monitoring & Logging | CIS 8 |
| **SR-7** | Network Security & Segmentation | CIS 9, 12, 13 |
| **SR-8** | Incident Response & Recovery | CIS 11, 17 |
| **SR-9** | Compliance & Audit Management | CIS 8 |
| **SR-10** | Continuous Improvement | CIS 7, 18 |
| **SR-11** | Physical & Environmental Security | CIS 1, 4 |
| **SR-12** | Third-Party Management | CIS 15 |
| **SR-13** | Privacy | EXT-P1 t/m EXT-P12 |

Deze laag maakt het mogelijk om:
- Compliance te rapporteren op domein-niveau
- Gap-analyses uit te voeren per security domein
- Prioriteiten te stellen over categorieën heen
- Management-rapportages te genereren zonder technisch detail

### 3. Controls (`/Controls`)

Controls zijn de concrete beveiligingsmaatregelen. Ze zijn onderverdeeld in:

#### CIS Controls (`/Controls/CIS`) - 153 stuks
Gebaseerd op CIS Controls v8, met prioritering volgens Implementation Groups:
- **IG1 (Basic)**: Essentiële hygiëne, prioriteit 5 (Critical)
- **IG2 (Foundational)**: Uitgebreide bescherming, prioriteit 4 (High)
- **IG3 (Organizational)**: Geavanceerde maatregelen, prioriteit 3 (Medium)

#### Extended Privacy Controls (`/Controls/EXT-P`) - 27 stuks
Aanvullende controls voor Privacy by Design, gebaseerd op:
- Hoepman's Privacy Design Strategies
- AVG-vereisten
- Nederlandse privacy wetgeving

**Frontmatter structuur van een Control:**
```yaml
---
id: "CIS-3.6"
type: control
category: "CIS 3"
category_name: "Gegevensbescherming"
control_name: "Encrypt Data on End-User Devices"
priority: 5
priority_label: "Critical"
extended_baseline: true
control_type: "Technical"
iso27001: "A.8.24"
nis2: "Art.21(2)(d)"
bio2: "8.24"
status: draft
---
```

### 3. Systems (`/Systems`)

Een System vertegenwoordigt een complete applicatie of platform dat uit meerdere componenten bestaat. Voorbeelden:

| Systeem | Beschrijving | Classificatie |
|---------|--------------|---------------|
| **XENA** | Document Management Systeem | BBN2 |
| **ZGW** | Zaakgericht Werken platform | BBN2 |
| **E-mail Archief** | E-mail archiveringssysteem | BBN2 |

Systems zijn de scope waarbinnen compliance wordt gemeten en gerapporteerd.

### 4. Components (`/Components`)

Components zijn de technische bouwstenen waaruit Systems bestaan. Een Component kan in meerdere Systems voorkomen.

| Component | Type | Systems |
|-----------|------|---------|
| **MinIO** | Object Storage | XENA, E-mail Archief |
| **PostgreSQL** | Database | XENA, ZGW |
| **KeyCloak** | Identity Provider | XENA, ZGW |
| **Apache NiFi** | Integration | XENA |
| **Saviynt** | IGA | XENA, ZGW |

**Relatie met Systems:**
```yaml
---
systems:
  - "XENA-NZGW"
  - "XENA-ZGW"
---
```

### 5. Implementations (`/Implementations`)

De Implementation is het **kernstuk** van het SCF. Het beschrijft hoe een specifieke Control wordt toegepast op een specifieke Component.

**Naamconventie:** `IMPL-{System}-{Component}-{Control}.md`
Voorbeeld: `IMPL-XENA-MinIO-3.6.md`

**Wat bevat een Implementation:**

| Sectie | Beschrijving |
|--------|--------------|
| **Implementatie Specificatie** | Hoe de control technisch wordt toegepast |
| **Definition of Done (DoD)** | Meetbare criteria voor "implementatie compleet" |
| **Bewijsmateriaal** | Welk evidence nodig is, type en frequentie |
| **Risico Koppeling** | Link naar het risico dat ontstaat bij ontbreken |
| **Uitzonderingen** | Eventuele goedgekeurde afwijkingen |
| **Audit Trail** | Wijzigingshistorie voor compliance |

**Frontmatter structuur:**
```yaml
---
id: "IMPL-XENA-MinIO-3.6"
type: implementation
control: "[[Controls/CIS/CIS-3.6 - Versleutel Gegevens op Apparaten|CIS-3.6]]"
component: "[[Components/MinIO]]"
system: "[[Systems/XENA-NZGW]]"
impl_status: "Implemented"
dod_status: "Verified"
risk_if_missing: "[[Risks/RSK-001]]"
owner: "@storage-team"
next_review: 2025-07-27
---
```

### 6. Risks (`/Risks`)

Risico's beschrijven wat er kan gebeuren als controls niet (volledig) zijn geïmplementeerd.

**Relaties:**
- Gekoppeld aan **Systems** die getroffen worden
- Gekoppeld aan **Components** die kwetsbaar zijn
- Gekoppeld aan **Controls** die het risico mitigeren

**Risico scoring:**
```
Risico Score = Likelihood × Impact

┌─────────────────────────────────────────────────┐
│  Impact ↓ / Likelihood →   1    2    3    4    5│
├─────────────────────────────────────────────────┤
│  5 (Kritiek)               5   10   15   20   25│
│  4 (Hoog)                  4    8   12   16   20│
│  3 (Medium)                3    6    9   12   15│
│  2 (Laag)                  2    4    6    8   10│
│  1 (Zeer laag)             1    2    3    4    5│
└─────────────────────────────────────────────────┘
```

## Relaties en Cardinaliteit

```
┌─────────────────────────────────────────────────────────────────┐
│                    RELATIE DIAGRAM                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Framework ─────1:N──────► Control                              │
│       "Een framework bevat meerdere controls"                   │
│                                                                 │
│  Control ◄─────M:N──────► Component                             │
│       "Een control kan op meerdere components,                  │
│        een component heeft meerdere controls"                   │
│       VIA: Implementation                                       │
│                                                                 │
│  System ────────1:N──────► Component                            │
│       "Een system bestaat uit meerdere components"              │
│                                                                 │
│  Component ◄────N:M──────► System                               │
│       "Een component kan in meerdere systems zitten"            │
│                                                                 │
│  Implementation ──1:1───► Control                               │
│  Implementation ──1:1───► Component                             │
│  Implementation ──1:1───► System                                │
│  Implementation ──1:1───► Risk                                  │
│       "Elke implementation koppelt exact één control            │
│        aan één component binnen één system,                     │
│        met één gekoppeld risico"                                │
│                                                                 │
│  Risk ◄─────────N:M──────► Control                              │
│  Risk ◄─────────N:M──────► Component                            │
│  Risk ◄─────────N:M──────► System                               │
│       "Een risico kan meerdere controls/components/systems      │
│        betreffen en vice versa"                                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Mappenstructuur

```
SCF-Vault/
│
├── Controls/                    # Security controls
│   ├── CIS/                     # 153 CIS Controls v8
│   │   ├── CIS-1.1 - ....md
│   │   └── ...
│   └── EXT-P/                   # 27 Extended Privacy Controls
│       ├── EXT-P1.1 - ....md
│       └── ...
│
├── Systems/                     # Applicaties en platforms
│   ├── XENA.md
│   ├── ZGW.md
│   └── E-mail-Archief.md
│
├── Components/                  # Technische bouwstenen
│   ├── MinIO.md
│   ├── PostgreSQL.md
│   ├── KeyCloak.md
│   └── ...
│
├── Implementations/             # Control ↔ Component koppelingen
│   ├── IMPL-XENA-MinIO-3.6.md
│   ├── IMPL-XENA-PostgreSQL-3.11.md
│   └── ...
│
├── Risks/                       # Risico register
│   ├── RSK-001.md
│   └── ...
│
├── Frameworks/                  # Compliance frameworks
│   ├── Security-Requirements/   # 13 Core Security Requirements
│   │   ├── SR-1 - Security Governance Framework.md
│   │   ├── SR-2 - Risk Assessment & Management.md
│   │   ├── ...
│   │   └── SR-13 - Privacy.md
│   ├── ISO-27001-2022.md
│   ├── NIS2.md
│   ├── BIO2.md
│   ├── AVG-GDPR.md
│   └── CIS-Controls-v8.md
│
├── Dashboards/                  # Overzichten en rapportages
│   ├── Main Dashboard.md
│   ├── Compliance Dashboard.md
│   ├── Risk Dashboard.md
│   └── Implementation Tracker.md
│
├── Templates/                   # Document templates
│   ├── Control Template.md
│   ├── Component Template.md
│   ├── System Template.md
│   ├── Implementation Template.md
│   └── Risk Template.md
│
├── Evidence/                    # Bewijsmateriaal (links/referenties)
│
├── Documentatie/                # Handleidingen en architectuur
│   └── SCF Architectuur.md     # Dit document
│
└── README.md                    # Quick start guide
```

## Dataview Queries

De vault maakt intensief gebruik van Dataview voor dynamische overzichten. Hier zijn de belangrijkste query-patronen:

### Vanuit een Control: Toon Implementations
```dataview
TABLE 
  component as "Component",
  system as "Systeem", 
  impl_status as "Status"
FROM "Implementations"
WHERE contains(string(control), this.id)
```

### Vanuit een Component: Toon toegepaste Controls
```dataview
TABLE 
  control as "Control",
  impl_status as "Status"
FROM "Implementations"
WHERE contains(string(component), this.file.name)
```

### Vanuit een System: Compliance overzicht
```dataview
TABLE WITHOUT ID
  impl_status as "Status",
  length(rows) as "Aantal"
FROM "Implementations"
WHERE contains(string(system), this.file.name)
GROUP BY impl_status
```

### Dashboard: Kritieke controls zonder implementatie
```dataview
LIST
FROM "Controls"
WHERE priority = 5 AND status != "implemented"
```

## Workflow

### Nieuwe Control Toevoegen

1. Kopieer `/Templates/Control Template.md`
2. Vul frontmatter in met framework mappings
3. Bepaal voor welke Components de control relevant is
4. Maak per Component een Implementation aan

### Nieuwe Component Toevoegen

1. Kopieer `/Templates/Component Template.md`
2. Koppel aan relevante Systems
3. Bepaal welke Controls van toepassing zijn
4. Maak per Control een Implementation aan

### Nieuw System Toevoegen

1. Kopieer `/Templates/System Template.md`
2. Identificeer de Components
3. Maak Components aan indien nodig
4. Implementations worden per Component aangemaakt

### Compliance Review

1. Open `/Dashboards/Implementation Tracker.md`
2. Controleer welke Implementations review nodig hebben
3. Per Implementation:
   - Verifieer DoD criteria
   - Verzamel bewijsmateriaal
   - Update status
   - Registreer in Audit Trail

## Uitbreidbaarheid

Het SCF is ontworpen voor uitbreiding:

### Nieuwe Frameworks
Voeg toe aan `/Frameworks` en breid de frontmatter van Controls uit met nieuwe mapping velden.

### Nieuwe Control Categorieën
Maak een nieuwe subfolder onder `/Controls` (bijv. `/Controls/EXT-CLOUD` voor cloud-specifieke controls).

### Meerdere Organisaties
Maak per organisatie een aparte System of gebruik tags voor multi-tenancy.

## Best Practices

1. **Consistente naamgeving**: Volg de bestaande conventies voor bestandsnamen
2. **Volledige frontmatter**: Vul alle velden in voor correcte Dataview queries
3. **Wiki-links**: Gebruik `[[...]]` links voor navigatie en relaties
4. **Regelmatige review**: Plan periodieke reviews in de Implementation bestanden
5. **Evidence verzamelen**: Link bewijsmateriaal vanuit Implementations naar `/Evidence`
6. **Versiebeheer**: Gebruik Git voor alle wijzigingen (zie Infrastructure documentatie)

## Gerelateerde Documentatie

- [[README|Quick Start Guide]]
- [[Dashboards/Main Dashboard|Hoofd Dashboard]]
- [[Templates/Implementation Template|Implementation Template]]

---

*Document versie 1.0 - Laatst bijgewerkt: 2025-01-27*
