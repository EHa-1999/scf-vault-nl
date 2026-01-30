# SCF-Vault - Security Control Framework

Een Obsidian-gebaseerde knowledge base voor het beheren van security controls, compliance frameworks en implementaties volgens het **LISA** (Layered Information Security Architecture) model.

## Wat is LISA?

LISA is een gelaagd raamwerk voor informatiebeveiliging dat de kloof overbrugt tussen abstracte compliance-eisen en concrete technische implementaties. Net zoals GEMMA, NORA en PETRA referentiekaders bieden voor respectievelijk gemeenten, rijksoverheid en provincies, biedt LISA een referentiekader voor informatiebeveiliging.

→ [[Frameworks/LISA/1-LISA-Introductie|Lees de LISA documentatie]]

## De Zes Lagen

![[Assets/diagrams/LISA-Six-Layers.svg]]

---

## 🧭 Navigatie

Elke map heeft een **_index.md** pagina met overzicht en navigatie.

> [!tip] Interactieve Navigatie
> Open [[Vault-Navigation.canvas|🗺️ Vault Navigation Canvas]] voor een **klikbare kaart** van de vault!

![[Assets/diagrams/Vault-Navigation.svg]]

| Sectie | Beschrijving | Start hier |
|--------|--------------|------------|
| [[Frameworks/_index\|🏛️ Frameworks]] | Governance kaders (ISO, NIS2, BIO2) | [[Frameworks/LISA/1-LISA-Introductie\|LISA Intro]] |
| [[Controls/_index\|📋 Controls]] | 231 security controls | [[Controls/CIS/_index\|CIS Controls]] |
| [[Benchmarks/_index\|📏 Benchmarks]] | Hardening guides per technologie | [[Benchmarks/CIS/_index\|CIS Benchmarks]] |
| [[Systems/_index\|🖥️ Systems]] | Applicaties onder scope | [[Systems/XENA\|XENA]] |
| [[Components/_index\|🔧 Components]] | Technische bouwstenen | [[Components/PostgreSQL\|PostgreSQL]] |
| [[Implementations/_index\|⚙️ Implementations]] | Control → Component | — |
| [[Dashboards/_index\|📊 Dashboards]] | Monitoring & KPI's | [[Dashboards/Main Dashboard\|Main Dashboard]] |
| [[Risks/_index\|⚠️ Risks]] | Risico register | — |
| [[Audits/_index\|🔍 Audits]] | Assurance & findings | — |
| [[Documentatie/_index\|📚 Documentatie]] | Handleidingen | [[Documentatie/Systeem Onboarding Procedure\|Onboarding]] |
| [[Templates/_index\|📝 Templates]] | Herbruikbare templates | — |
| [[Planning/_index\|📅 Planning]] | Roadmaps & kalenders | [[Planning/Implementatieplan 2026\|Plan 2026]] |

---

## Mappenstructuur

```
SCF-Vault-NL/
├── Frameworks/                    # Governance frameworks
│   ├── LISA/                     # LISA framework documentatie
│   │   ├── 1-LISA-Introductie.md
│   │   ├── 2-LISA-Governance-Laag.md
│   │   ├── 3-LISA-Security-Requirements.md
│   │   ├── 4-LISA-Controls.md
│   │   ├── 5-LISA-Implementatie.md
│   │   ├── 6-LISA-Risicobeheer.md
│   │   └── 7-LISA-Audits.md
│   ├── Security-Requirements/    # SR-1 t/m SR-13
│   ├── NIST-CSF.md
│   ├── ISO-27001-2022.md
│   ├── NIS2.md
│   ├── BIO2.md
│   ├── AVG-GDPR.md
│   └── CIS-Controls-v8.md
├── Controls/                      # Tactische controls
│   ├── CIS/                      # 153 CIS Controls v8
│   └── EXT-*/                    # Extended Controls
├── Benchmarks/                    # Hardening guides (NIEUW)
│   ├── CIS/                      # Officiële CIS Benchmarks
│   │   ├── CIS-PostgreSQL-16-v1.0.0.md
│   │   └── CIS-NGINX-v2.1.0.md
│   ├── EXT/                      # Extended Benchmarks
│   │   ├── EXT-MinIO-v1.0.md
│   │   └── EXT-KeyCloak-v1.0.md
│   └── Templates/                # Benchmark templates
├── Systems/                       # Applicaties en platforms
├── Components/                    # Technische bouwstenen
├── Implementations/               # Control implementaties
├── Risks/                         # Risico register
├── Evidence/                      # Links naar bewijsmateriaal
├── Audits/                        # Audit documentatie
│   ├── {YYYY}/                   # Per jaar
│   │   └── IA-{ID}/              # Audit dossier
│   └── Scripts/                  # Templater scripts
├── Dashboards/                    # Overzichtspagina's
├── Planning/                      # Roadmaps en kalenders
├── Scripts/                       # Export en automatisering
├── Documentatie/                  # Handleidingen en procedures
├── Templates/                     # Templates voor nieuwe items
└── Assets/                        # SVG diagrammen
```

## Quick Start

1. Open deze vault in Obsidian
2. Installeer de Dataview plugin (Community Plugins → Browse → Dataview)
3. Start bij de [[Dashboards/Main Dashboard|Main Dashboard]]

## Inhoud

| Type | Aantal | Beschrijving |
|------|--------|--------------|
| Frameworks | 6 | NIST CSF, ISO 27001, NIS2, BIO2, AVG, CIS |
| Security Requirements | 13 | SR-1 t/m SR-13 |
| CIS Controls | 153 | CIS Controls v8 (93 baseline, 60 niet-baseline) |
| Privacy Controls (EXT-P) | 27 | Extended Privacy Controls (alle baseline) |
| Organizational (EXT-O) | 18 | ISO A.5 governance, beleid, classificatie |
| HR Security (EXT-HR) | 6 | ISO A.6 + BIO B3 personele beveiliging |
| Physical Security (EXT-PHY) | 12 | ISO A.7 + BIO B7 fysieke beveiliging |
| Supplier Mgmt (EXT-SUP) | 4 | BIO B11 + NIS2 supply chain security |
| Business Continuity (EXT-BC) | 4 | BIO B12 + NIS2 continuïteit |
| Compliance (EXT-COM) | 4 | BIO B13 wet- en regelgeving |
| Technical (EXT-T) | 3 | ISO A.8 resterende gaps |
| **Totaal Controls** | **231** | **168 baseline** |
| **CIS Benchmarks** | 4 | PostgreSQL 16, NGINX, Kubernetes 1.29, RHEL 9 |
| **EXT Benchmarks** | 2 | MinIO, KeyCloak |
| Systems | 3 | XENA, ZGW, E-mail Archief |
| Components | 10 | MinIO, PostgreSQL, KeyCloak, NGINX, K3S, RHEL, etc. |
| Dashboards | 7 | Main, Executive, Compliance, Impl, Risk, Audit, Baseline |
| Templates | 8 | Control, Implementation, Risk, System, Component, SCB, CIS Benchmark, EXT Benchmark |

## Baseline Security (Comply or Explain)

Het framework maakt onderscheid tussen **baseline** en **niet-baseline** controls:

- **Baseline controls** (`baseline: true`) zijn verplicht - "always on"
- Als een baseline control niet is geïmplementeerd, moet er een goedgekeurde **exception** zijn met compenserende maatregelen
- Zie [[Dashboards/Baseline Dashboard|Baseline Dashboard]] voor monitoring en exception management

| Type | Baseline | Niet-Baseline |
|------|----------|---------------|
| CIS Controls | 93 | 60 |
| Privacy Controls | 27 | 0 |
| **Totaal** | **120** | **60** |

## Belangrijke Links

- [[Frameworks/LISA/1-LISA-Introductie|LISA Introductie]] - Het framework begrijpen
- [[Dashboards/Main Dashboard|Main Dashboard]] - Centraal overzicht
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]] - **Comply or Explain** monitoring
- [[Dashboards/Executive Summary|Executive Summary]] - Management rapportage
- [[Dashboards/Compliance Dashboard|Compliance Dashboard]] - Framework compliance
- [[Benchmarks/_index|Benchmarks]] - Hardening guides per technologie
- [[CHANGELOG|Release Notes]] - Versiegeschiedenis
- [[Dashboards/Audit Dashboard|Audit Dashboard]] - Audits en bevindingen
- [[Planning/Implementatieplan 2026|Implementatieplan 2026]] - Roadmap
- [[Planning/Compliance Kalender 2026|Compliance Kalender]] - Deadlines
- [[Documentatie/Systeem Onboarding Procedure|Systeem Onboarding Procedure]] - Nieuwe systemen toevoegen
- [[Documentatie/CIS Benchmark Handleiding|CIS Benchmark Handleiding]] - Benchmarks gebruiken
- [[Documentatie/Dual Scoring Model|Dual Scoring Model]] - Implementatie vs. Compliance
- [[Scripts/README|Export Scripts]] - Jira/Redmine export

## Versie

**SCF-Vault v3.6 NL** - RHEL 9 Benchmark + K3S Component  
Laatste update: 2026-01-30

### Nieuwe Features v3.6

* **CIS RHEL 9 Benchmark v2.0.0** - 255 recommendations voor Linux hardening
* **K3S Component** - Met links naar Kubernetes én RHEL benchmarks
* **RHEL Component** - Basis OS voor alle XENA servers

### Features v3.5

* **CIS Kubernetes 1.29 Benchmark** - 124 recommendations voor K3S/Kubernetes hardening
* **CHANGELOG.md** - Volledige release historie vanaf v1.x
* **Version sync** - NL en EN vault nu op zelfde versienummer

### Features v3.4 NL

* **Benchmarks als hoofdfolder** - CIS en Extended Benchmarks op root niveau
* **5 Benchmarks** - PostgreSQL 16, NGINX, Kubernetes 1.29, MinIO, KeyCloak
* **Benchmark Templates** - Voor CIS en EXT benchmarks
* **Component ↔ Benchmark linking** - Directe verwijzingen in YAML frontmatter

### Features v3.3 NL

* **Dual Scoring Model** - Implementatie vs. Compliance tracking
* **ArchiMate-style SVG diagrammen** - Vervangt ASCII workflows
* **Documentatie vertaald** - Alle handleidingen in het Nederlands
* **Consistente naamgeving** - Nederlandse bestandsnamen

### Features v3.2 NL

* **Volledig Nederlandstalig** - Alle 153 CIS Controls vertaald
* **Nederlandse bestandsnamen** - Intuïtieve navigatie
* **18 CIS categorieën** - Nederlandse namen
* **Consistente terminologie** - Door hele vault

### Features v3.1

* **+51 Extended Controls** voor ISO 27001, NIS2 en BIO gaps
* **EXT-O**: 18 Organizational Controls (ISO A.5)
* **EXT-HR**: 6 HR Security Controls (ISO A.6, BIO B3)
* **EXT-PHY**: 12 Physical Security Controls (ISO A.7, BIO B7)
* **EXT-SUP**: 4 Supplier Management Controls (BIO B11, NIS2)
* **EXT-BC**: 4 Business Continuity Controls (BIO B12, NIS2)
* **EXT-COM**: 4 Compliance Controls (BIO B13)
* **EXT-T**: 3 Technical Controls (ISO A.8)
* Framework coverage: ISO 95%+, NIS2 100%, BIO 95%+

### Features v3.0
- **Index pagina's (_index.md)** voor elke map
- **Vault-Navigation.svg** interactief navigatiediagram
- Website-achtige navigatie door de hiërarchie
- Breadcrumb navigatie in elke index
- Dataview queries voor dynamische inhoud per sectie

### Features v2.9
- Baseline parameter op alle 180 controls (120 baseline)
- Baseline Dashboard voor comply-or-explain monitoring
- Exception Management workflow
