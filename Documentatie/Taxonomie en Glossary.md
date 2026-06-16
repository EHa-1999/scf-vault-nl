---
id: "Taxonomie-Glossary"
type: documentation
name: "Taxonomie & Glossary"
version: "1.0"
status: active
created: 2026-02-05
modified: 2026-02-05
tags:
  - documentation
  - taxonomie
  - glossary
  - framework
---

# Taxonomie & Glossary

## Inleiding

Dit document beschrijft de taxonomie (hiërarchische ordening) en terminologie van het Security Control Framework. Een heldere taxonomie is essentieel voor consistente communicatie, effectieve audits en kruisverwijzingen naar externe normenkaders.

## De LISA Taxonomie

Het LISA framework onderscheidt vijf niveaus van abstractie, van strategisch governance-niveau tot operationele uitvoering:

```
┌─────────────────────────────────────────────────────────────────────────┐
│  NIVEAU 1: GOVERNANCE FRAMEWORKS                                         │
│  ─────────────────────────────────────────────────────────────────────  │
│  Externe normenkaders en wettelijke eisen                                │
│  → ISO 27001:2022, NIS2, BIO2, AVG/GDPR, NEN 7510                       │
├─────────────────────────────────────────────────────────────────────────┤
│  NIVEAU 2: SECURITY REQUIREMENTS                                         │
│  ─────────────────────────────────────────────────────────────────────  │
│  13 beveiligingsdomeinen die de frameworks operationaliseren            │
│  → SR-1 t/m SR-13                                                        │
├─────────────────────────────────────────────────────────────────────────┤
│  NIVEAU 3: CONTROLS                                                      │
│  ─────────────────────────────────────────────────────────────────────  │
│  Tactische beheersmaatregelen per domein                                │
│  → CIS Controls (153), Extended Controls (78)                           │
├─────────────────────────────────────────────────────────────────────────┤
│  NIVEAU 4: BENCHMARKS (nieuw in v3.8)                                    │
│  ─────────────────────────────────────────────────────────────────────  │
│  Concrete, auditeerbare maatregelen per control-type                    │
│  → CIS Benchmarks (technisch), EXT Benchmarks (organisatorisch)         │
├─────────────────────────────────────────────────────────────────────────┤
│  NIVEAU 5: IMPLEMENTATIONS                                               │
│  ─────────────────────────────────────────────────────────────────────  │
│  Specifieke toepassing per systeem/component/proces                     │
│  → IMPL-{Systeem}-{Component/Proces}-{Control}                          │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Niveau 1: Governance Frameworks

Governance Frameworks zijn externe normenkaders, wetten of industriestandaarden die de beveiligingseisen definiëren waaraan de organisatie moet voldoen.

| Framework | Type | Scope | Verplicht |
|-----------|------|-------|-----------|
| **ISO 27001:2022** | Certificeringsstandaard | Wereldwijd, alle sectoren | Optioneel (vaak gewenst) |
| **NIS2** | EU Richtlijn | Essentiële en belangrijke entiteiten | Ja, vanaf 2024 |
| **BIO2** | Overheidsstandaard | Nederlandse overheid | Ja, voor overheden |
| **AVG/GDPR** | EU Verordening | Persoonsgegevensverwerking | Ja |
| **NEN 7510** | Nederlandse norm | Zorgsector | Ja, voor zorginstellingen |

### Relatie tot LISA

LISA aggregeert de eisen uit deze frameworks en vertaalt ze naar een werkbaar control framework. Elk framework wordt gemapped naar:
- Security Requirements (SR-1 t/m SR-13) voor domein-indeling
- Controls (CIS + EXT) voor concrete maatregelen
- Benchmarks voor auditeerbare verificatie

---

## Niveau 2: Security Requirements

Security Requirements zijn de 13 beveiligingsdomeinen die de governance frameworks operationaliseren. Ze vormen de brug tussen abstracte compliance-eisen en concrete controls.

| ID | Domein | Beschrijving |
|----|--------|--------------|
| SR-1 | Security Governance | Beleid, rollen, verantwoordelijkheden |
| SR-2 | Risk Management | Risico-identificatie, -analyse, -behandeling |
| SR-3 | Access Control & IAM | Identiteit, authenticatie, autorisatie |
| SR-4 | Cryptography & Data Protection | Encryptie, sleutelbeheer, dataclassificatie |
| SR-5 | Secure Development | SDLC, code review, vulnerability management |
| SR-6 | Security Monitoring | Logging, SIEM, detectie |
| SR-7 | Network Security | Segmentatie, firewalls, IDS/IPS |
| SR-8 | Incident Response | Detectie, response, recovery |
| SR-9 | Compliance & Audit | Self-assessment, interne audit, externe audit |
| SR-10 | Continuous Improvement | Lessons learned, security metrics |
| SR-11 | Physical Security | Fysieke toegang, omgevingsbeveiliging |
| SR-12 | Third-Party Management | Leveranciersselectie, -monitoring, -contracten |
| SR-13 | Privacy | AVG-compliance, privacy by design |

---

## Niveau 3: Controls

Controls zijn tactische beheersmaatregelen die beschrijven **wat** moet worden geïmplementeerd. LISA onderscheidt twee hoofdcategorieën:

### CIS Controls (Technisch)

De 153 CIS Controls v8 zijn primair gericht op technische beveiliging:

| Categorie | Naam | Type | Aantal |
|-----------|------|------|--------|
| CIS 1-6 | Asset, Software, Data, Config, Account, Access | Preventief | 43 |
| CIS 7-10 | Vuln Mgmt, Logging, Email/Browser, Malware | Detectief | 37 |
| CIS 11-13 | Recovery, Network, Monitoring | Correctief | 27 |
| CIS 14-18 | Awareness, Suppliers, AppSec, IR, PenTest | Organisatorisch | 46 |

### Extended Controls (Organisatorisch)

De 78 Extended Controls dekken niet-technische domeinen:

| Categorie | Naam | Focus | Aantal | Normenkader |
|-----------|------|-------|--------|-------------|
| **EXT-O** | Organizational | Governance, beleid, classificatie | 18 | ISO A.5, BIO B1 |
| **EXT-HR** | Human Resources | Personele beveiliging | 6 | ISO A.6, BIO B3 |
| **EXT-PHY** | Physical | Fysieke beveiliging | 12 | ISO A.7, BIO B7 |
| **EXT-SUP** | Supplier | Leveranciersbeheer | 4 | ISO A.5.19-22, BIO B11 |
| **EXT-BC** | Business Continuity | Continuïteit | 4 | ISO A.5.29-30, BIO B12 |
| **EXT-COM** | Compliance | Wet- en regelgeving | 4 | ISO A.5.31-36, BIO B13 |
| **EXT-P** | Privacy | AVG/GDPR-specifiek | 27 | AVG Art. 5-32 |
| **EXT-T** | Technical | Overige technisch | 3 | ISO A.8 |

---

## Niveau 4: Benchmarks

Benchmarks beschrijven **hoe** controls moeten worden geïmplementeerd met concrete, auditeerbare maatregelen. Dit is het niveau waarop daadwerkelijke verificatie plaatsvindt.

### CIS Benchmarks (Technisch)

Voor technische componenten gebruiken we officiële CIS Benchmarks:

| Benchmark | Component | Maatregelen | Bron |
|-----------|-----------|-------------|------|
| CIS-PostgreSQL-16 | PostgreSQL | 78 | CIS WorkBench |
| CIS-RHEL-9 | RHEL/Linux | 255 | CIS WorkBench |
| CIS-Kubernetes-1.29 | K3S/Kubernetes | 124 | CIS WorkBench |
| CIS-NGINX | NGINX | 52 | CIS WorkBench |
| **Totaal** | | **509** | |

### EXT Benchmarks (Organisatorisch) — Nieuw in v3.8

Voor niet-technische controls gebruiken we Extended Benchmarks:

| Benchmark | Scope | Maatregelen | Bron |
|-----------|-------|-------------|------|
| EXT-BM-Governance | Beleid, rollen, classificatie | ~40 | ISO 27001, BIO2 |
| EXT-BM-HR | Personele beveiliging | ~25 | ISO 27001, BIO B3 |
| EXT-BM-Physical | Fysieke beveiliging | ~35 | ISO 27001, BIO B7 |
| EXT-BM-Supplier | Leveranciersbeheer | ~20 | ISO 27001, BIO B11 |
| EXT-BM-BC | Business continuity | ~20 | ISO 27001, BIO B12 |
| EXT-BM-Privacy | Privacy & AVG | ~45 | AVG, NEN 7510 |

> [!note] Status
> Extended Benchmarks zijn in ontwikkeling. Zie [[Benchmarks/EXT/_index|EXT Benchmarks]] voor beschikbare benchmarks.

### Benchmark vs. Control

| Aspect | Control | Benchmark |
|--------|---------|-----------|
| **Vraag** | Wat moet worden gedaan? | Hoe wordt het gedaan en gecontroleerd? |
| **Abstractie** | Hoog | Laag (concreet) |
| **Voorbeeld** | "Implementeer wachtwoordbeleid" | "Wachtwoord min. 12 tekens, complexiteitseis actief, history 24" |
| **Auditeerbaar** | Indirect | Direct (checkbox) |
| **Evidence** | Beschrijvend | Specifiek (screenshot, config, document) |

---

## Niveau 5: Implementations

Implementations zijn de concrete toepassing van controls en benchmarks op specifieke systemen, componenten of processen.

### Naamconventie

```
IMPL-{Systeem}-{Component/Proces}-{Control}
```

| Element | Beschrijving | Voorbeeld |
|---------|--------------|-----------|
| Systeem | Naam van het informatiesysteem | XENA, ZGW |
| Component/Proces | Technisch component of organisatorisch proces | PostgreSQL, HR-Onboarding |
| Control | Control ID | CIS-4.1, EXT-O.1 |

### Voorbeelden

| Implementation ID | Type | Beschrijving |
|-------------------|------|--------------|
| IMPL-XENA-PostgreSQL-4.1 | Technisch | Secure configuration van PostgreSQL |
| IMPL-ORG-HR-Onboarding-HR.1 | Proces | Screening procedure nieuwe medewerkers |
| IMPL-ORG-Beleid-O.1 | Document | Informatiebeveiligingsbeleid beheer |

---

## Glossary

### A

**Assessment** — Systematische beoordeling van de implementatie-status van controls. Zie ook: Self-Assessment, Component Assessment.

**Audit** — Onafhankelijke verificatie van de effectiviteit van controls, uitgevoerd door een auditor.

**Audit Trail** — Chronologisch overzicht van activiteiten en wijzigingen voor verantwoording en forensisch onderzoek.

### B

**Baseline Control** — Control die verplicht is geïmplementeerd tenzij een goedgekeurde exception bestaat (comply or explain).

**Benchmark** — Gedetailleerde set van auditeerbare maatregelen voor de implementatie van controls op een specifiek component of proces.

**BIO** — Baseline Informatiebeveiliging Overheid, het normenkader voor Nederlandse overheden.

**BIV-classificatie** — Classificatie naar Beschikbaarheid, Integriteit en Vertrouwelijkheid.

### C

**CIS** — Center for Internet Security, organisatie die security benchmarks en controls publiceert.

**Compenserende Maatregel** — Alternatieve maatregel die wordt geïmplementeerd wanneer de primaire control niet haalbaar is.

**Compliance** — Voldoen aan externe normen, wetten of interne beleidsregels.

**Component** — Technische bouwsteen van een informatiesysteem (database, webserver, container platform).

**Component Assessment** — Beoordeling van alle benchmark-maatregelen voor één component (nieuw in v3.8).

**Control** — Beheersmaatregel om een beveiligingsrisico te mitigeren.

### D

**Definition of Done** — Criteria waaraan een implementation moet voldoen om als "geïmplementeerd" te gelden.

**DPIA** — Data Protection Impact Assessment, verplichte privacybeoordeling bij hoog-risico verwerkingen.

### E

**Evidence** — Bewijsmateriaal dat de implementatie van een control aantoont.

**Exception** — Formele goedkeuring om een baseline control (tijdelijk) niet te implementeren, met compenserende maatregelen.

**Extended Control (EXT)** — Aanvullende control buiten CIS v8, voor organisatorische, fysieke, HR of privacy-domeinen.

**Extended Benchmark (EXT-BM)** — Benchmark voor Extended Controls, gebaseerd op ISO 27001, BIO2 en sectorspecifieke normen.

### F

**Finding** — Bevinding uit een audit die een gap of non-conformity identificeert.

**Framework** — Gestructureerd geheel van principes, eisen en richtlijnen (bijv. ISO 27001, NIST CSF).

### G

**Gap** — Verschil tussen de huidige en gewenste situatie qua control-implementatie.

**Governance** — Het geheel van beleid, processen en structuren voor besturing en verantwoording.

### I

**Implementation** — Concrete toepassing van een control op een specifiek systeem, component of proces.

**Implementation Group (IG)** — CIS-classificatie van controls naar implementatie-prioriteit (IG1=Basic, IG2=Foundational, IG3=Organizational).

### L

**LISA** — Layered Information Security Architecture, het raamwerk dat deze vault structureert.

### M

**Maatregel** — Synoniem voor control of benchmark-item.

**Mapping** — Kruisverwijzing tussen controls uit verschillende normenkaders.

### N

**NEN 7510** — Nederlandse norm voor informatiebeveiliging in de zorg.

**NIS2** — Network and Information Security Directive 2, EU-richtlijn voor cybersecurity.

**Non-conformity** — Situatie waarin niet wordt voldaan aan een vereiste uit een normenkader.

### P

**Process** — Organisatorisch proces dat controls implementeert (HR-onboarding, incident response).

**Profile** — Subset van benchmark-maatregelen (Level 1 = basis, Level 2 = uitgebreid).

### R

**Recommendation** — Individuele maatregel binnen een benchmark.

**Residual Risk** — Restrisico na implementatie van controls.

**Risk** — Kans × impact van een bedreiging die een kwetsbaarheid exploiteert.

### S

**SCB** — System Component Breakdown, overzicht van componenten per systeem.

**Security Requirement (SR)** — Beveiligingsdomein dat meerdere gerelateerde controls groepeert.

**Self-Assessment** — Beoordeling door de system owner of process owner van de eigen controls.

**System** — Informatiesysteem bestaande uit meerdere componenten (XENA, ZGW).

### T

**Taxonomy** — Hiërarchische ordening en classificatie van concepten.

**Traceability** — Herleidbaarheid van implementaties naar controls naar frameworks.

---

## Kruisverwijzingen Normenkaders

De volgende tabel toont de mapping tussen LISA Extended Controls en externe normenkaders:

| EXT Categorie | ISO 27001:2022 | BIO2 | NIS2 | NEN 7510 |
|---------------|----------------|------|------|----------|
| EXT-O | A.5 (Organizational) | B1, B2 | Art. 21(2)(a) | 5 |
| EXT-HR | A.6 (People) | B3 | Art. 21(2)(i) | 6 |
| EXT-PHY | A.7 (Physical) | B7 | — | 7 |
| EXT-SUP | A.5.19-22 | B11 | Art. 21(2)(d) | 5.19-22 |
| EXT-BC | A.5.29-30 | B12 | Art. 21(2)(c) | 5.29-30 |
| EXT-COM | A.5.31-36 | B13 | Art. 21(2)(a) | 5.31-36 |
| EXT-P | — | AVG | — | 7510-1, 7510-2 |
| EXT-T | A.8 (residual) | B8 | Art. 21(2)(b) | 8 |

### Dubbel Werk Vermijden

Door de kruisverwijzingen kan bij audits dubbel werk worden vermeden:

1. **Eén assessment, meerdere rapportages** — Een EXT-O.1 assessment levert evidence voor ISO A.5.1, BIO B1.1 én NIS2 Art. 21(2)(a)
2. **Hergebruik van evidence** — Dezelfde documentatie kan worden gebruikt voor verschillende auditors
3. **Gap-analyse over frameworks** — Identificeer welke controls nog ontbreken per normenkader

---

## Zie Ook

- [[Frameworks/LISA/1-LISA-Introductie|LISA Introductie]]
- [[Benchmarks/_index|Benchmarks Overzicht]]
- [[Controls/_index|Controls Overzicht]]
- [[Voorbeelden/_README|Gelaagd Assessment Model]]
