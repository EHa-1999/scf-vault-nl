---
id: "PROC-Onboarding"
type: procedure
name: "Systeem Onboarding Procedure"
version: "1.0"
status: Active
owner: CISO
created: 2026-01-28
modified: 2026-01-28
tags:
  - procedure
  - onboarding
  - scb
---

# Systeem Onboarding Procedure

## Doel

Deze procedure beschrijft hoe een nieuw (of bestaand) systeem wordt opgenomen in het LISA Security Control Framework. Het proces zorgt ervoor dat alle relevante security controls systematisch worden geïdentificeerd, toegewezen en geïmplementeerd.

## Scope

Deze procedure is van toepassing op:
- Nieuwe systemen die in productie worden genomen
- Bestaande systemen die nog niet in SCF zijn opgenomen
- Systemen die significante wijzigingen ondergaan

## Rollen en Verantwoordelijkheden

| Rol | Verantwoordelijkheid |
|-----|----------------------|
| **System Owner** | Eigenaar van het systeem, eindverantwoordelijk |
| **Security Officer** | Begeleidt onboarding, valideert control toewijzing |
| **Architect** | Levert technische input, SCB analyse |
| **CISO** | Goedkeuring, risico-acceptatie |

---

## Proces Overzicht

![[Assets/diagrams/LISA-Onboarding-Process.svg]]

Het onboarding proces bestaat uit vier hoofdfasen die samen zorgen voor een complete en gestructureerde opname van systemen in het security framework.

---

## Fase 1: Intake & Classificatie

### 1.1 Systeem Registratie

Maak een nieuw System document aan via de template:

1. Kopieer `Templates/System Template.md`
2. Vul de basis informatie in:
   - Systeem naam en ID
   - Beschrijving en doel
   - System Owner
   - Vendor/leverancier

**Of gebruik Templater:** (indien geconfigureerd)
- `Ctrl/Cmd + P` → "Templater: Insert Template" → "Nieuw Systeem"

### 1.2 BIV Classificatie

Bepaal de classificatie voor elk aspect:

| Niveau | Beschikbaarheid | Integriteit | Vertrouwelijkheid |
|--------|-----------------|-------------|-------------------|
| **Laag** | Uitval < 1 week acceptabel | Fouten hebben beperkte impact | Publieke informatie |
| **Midden** | Uitval < 1 dag acceptabel | Fouten hebben operationele impact | Interne informatie |
| **Hoog** | Uitval < 4 uur acceptabel | Fouten hebben ernstige gevolgen | Vertrouwelijke/persoons gegevens |

### 1.3 Data Classificatie

Identificeer welke data het systeem verwerkt:

| Data Type | Classificatie | AVG Relevant | Voorbeeld |
|-----------|---------------|--------------|-----------|
| Persoonsgegevens | Vertrouwelijk | Ja | NAW, BSN |
| Bijzondere persoonsgegevens | Strikt vertrouwelijk | Ja | Medisch, religie |
| Bedrijfsgegevens | Intern | Nee | Financieel, strategie |
| Publieke gegevens | Openbaar | Nee | Publicaties |

**Output Fase 1:**
- [ ] System document aangemaakt
- [ ] BIV classificatie vastgesteld
- [ ] Data classificatie gedocumenteerd
- [ ] System Owner geïdentificeerd

---

## Fase 2: System Component Breakdown (SCB)

### 2.1 Component Identificatie

Analyseer het systeem en identificeer alle technische componenten:

```
Systeem
├── Applicatie Laag
│   ├── Frontend (web, mobile)
│   ├── API / Backend
│   └── Workflow engine
├── Data Laag
│   ├── Database (SQL, NoSQL)
│   ├── Object storage
│   └── Cache
├── Integratie Laag
│   ├── Message broker
│   ├── API gateway
│   └── ETL / orchestratie
├── Security Laag
│   ├── Identity provider
│   ├── Authorization service
│   └── Secret management
└── Infrastructuur Laag
    ├── Container platform
    ├── Load balancer
    └── Netwerk
```

### 2.2 Component Documentatie

Voor elk geïdentificeerd component:

1. Maak een Component document aan via `Templates/Component Template.md`
2. Vul in:
   - Component type en vendor
   - Versie informatie
   - Koppeling naar systeem(en)
   - Technische details (hostname, poorten, protocollen)

### 2.3 SCB Document

Maak een gedetailleerd SCB document aan (zie [[Documentatie/SCB/SCB-Template]]):

Het SCB document bevat:
- Architectuur diagram
- Component inventaris met versies
- Data flows tussen componenten
- Externe integraties
- Security boundaries

**Output Fase 2:**
- [ ] Alle componenten geïdentificeerd
- [ ] Component documenten aangemaakt
- [ ] SCB document compleet
- [ ] Architectuur diagram beschikbaar

---

## Fase 3: Control Mapping

### Relatie Control-Component-Implementation

![[Assets/diagrams/LISA-Control-Component-Relation.svg]]

### 3.1 CIS Benchmark Identificatie

Controleer of er CIS Benchmarks beschikbaar zijn voor de componenten:

| Component Type | CIS Benchmark | Versie |
|----------------|---------------|--------|
| PostgreSQL | CIS PostgreSQL Benchmark | 1.0.0 |
| Kubernetes | CIS Kubernetes Benchmark | 1.8.0 |
| Docker | CIS Docker Benchmark | 1.6.0 |
| NGINX | CIS NGINX Benchmark | 2.0.0 |
| Ubuntu | CIS Ubuntu Linux Benchmark | 2.0.0 |
| Windows Server | CIS Microsoft Windows Server | 2.0.0 |

**CIS Benchmark bronnen:**
- https://www.cisecurity.org/cis-benchmarks
- https://workbench.cisecurity.org/

### 3.2 Control Toewijzing

#### A. Component MET CIS Benchmark

1. Download de CIS Benchmark PDF
2. Map de Benchmark recommendations naar CIS Controls v8:

```
CIS Benchmark Recommendation → CIS Control → Implementation
```

Voorbeeld PostgreSQL:
| Benchmark Item | CIS Control | Prioriteit |
|----------------|-------------|------------|
| 1.1 Ensure login audit | CIS-8.2 | IG1 |
| 2.1 Ensure TLS | CIS-3.10 | IG1 |
| 3.1 Ensure default passwords changed | CIS-4.7 | IG1 |
| 4.1 Ensure privileges are restricted | CIS-6.8 | IG2 |

#### B. Component ZONDER CIS Benchmark

Ontwikkel een Extended Benchmark:

1. **Identificeer vergelijkbare benchmarks**
   - Vendor security guides
   - OWASP guidelines
   - Industry best practices

2. **Map naar Security Requirements**
   
   Gebruik de 13 Security Requirements als basis:
   
   | SR | Vraag | Relevante Controls |
   |----|-------|-------------------|
   | SR-1 | Heeft het component security policies? | CIS-4.1 |
   | SR-3 | Hoe werkt authenticatie/autorisatie? | CIS-5.x, 6.x |
   | SR-4 | Is encryptie nodig? | CIS-3.x |
   | SR-6 | Wordt logging ondersteund? | CIS-8.x |
   | SR-8 | Wat bij een incident? | CIS-17.x |

3. **Documenteer als Extended Benchmark**
   
   Plaats in: `Documentatie/Benchmarks/EXT-{Component}.md`

### 3.3 Gap Analyse

Vergelijk de vereiste controls met de huidige situatie:

| Control | Vereist | Huidig | Gap | Prioriteit |
|---------|---------|--------|-----|------------|
| CIS-3.10 | TLS 1.3 | TLS 1.2 | Upgrade nodig | Hoog |
| CIS-8.2 | Audit logging | Niet actief | Implementeren | Hoog |
| CIS-6.5 | MFA | Niet aanwezig | Implementeren | Hoog |

**Output Fase 3:**
- [ ] CIS Benchmarks geïdentificeerd (of Extended Benchmark gemaakt)
- [ ] Control mapping compleet
- [ ] Gap analyse uitgevoerd
- [ ] Prioritering vastgesteld

---

## Fase 4: Implementation Registratie

### 4.1 Implementation Documenten

Voor elke control-component combinatie:

1. Maak een Implementation document aan
2. Gebruik naamconventie: `IMPL-{System}-{Component}-{Control}.md`

**Voorbeeld:** `IMPL-XENA-PostgreSQL-3.11.md`

### 4.2 Definition of Done (DoD)

Definieer per implementation concrete acceptatiecriteria:

```markdown
## Definition of Done

- [ ] DoD-1: [Specifiek criterium]
- [ ] DoD-2: [Specifiek criterium]
- [ ] DoD-3: [Specifiek criterium]
```

**Richtlijnen voor goede DoD:**
- Meetbaar en verifieerbaar
- Specifiek voor deze control-component combinatie
- Inclusief configuratie EN test

### 4.3 Evidence Requirements

Definieer welk bewijs nodig is:

| Evidence Type | Beschrijving | Frequentie |
|---------------|--------------|------------|
| Configuratie | Export van security settings | Bij wijziging |
| Screenshot | Console/UI bewijs | Jaarlijks |
| Test rapport | Penetration test, scan | Kwartaal |
| Log sample | Audit log extract | Maandelijks |

### 4.4 CMDB Registratie

Zorg dat de componenten ook in de CMDB zijn geregistreerd:

| SCF Document | CMDB Veld | Sync |
|--------------|-----------|------|
| System | CI - Application | Handmatig |
| Component | CI - Component | Handmatig |
| Implementation | Security Control | Link |

**Output Fase 4:**
- [ ] Alle Implementation documenten aangemaakt
- [ ] DoD gedefinieerd per implementation
- [ ] Evidence requirements vastgelegd
- [ ] CMDB gesynchroniseerd

---

## Fase 5: Risico Analyse

### 5.1 Risico Identificatie

Identificeer risico's gerelateerd aan het systeem:

**Methoden:**
- Dreigingsanalyse (STRIDE, MITRE ATT&CK)
- Control gap analyse (welke controls ontbreken?)
- Historische incidenten
- Vendor security advisories

### 5.2 Risico Registratie

Maak Risk documenten aan via `Templates/Risk Template.md`:

1. Beschrijf het risico scenario
2. Beoordeel likelihood en impact
3. Koppel aan componenten en controls
4. Bepaal behandelstrategie

### 5.3 Risico-Control Mapping

Elke risico moet gekoppeld zijn aan mitigerende controls:

```yaml
# In Risk frontmatter
controls:
  - "[[Controls/CIS/CIS-3.11]]"
  - "[[Controls/CIS/CIS-8.2]]"
components:
  - "[[Components/PostgreSQL]]"
```

**Output Fase 5:**
- [ ] Risico's geïdentificeerd en gedocumenteerd
- [ ] Risico's gekoppeld aan controls en componenten
- [ ] Behandelstrategie bepaald

---

## Fase 6: Goedkeuring & Baseline

### 6.1 Review Checklist

De Security Officer verifieert:

- [ ] System document compleet
- [ ] Alle componenten gedocumenteerd
- [ ] SCB document beschikbaar
- [ ] Control mapping volledig (geen gaps in IG1)
- [ ] Alle IG1 controls hebben Implementation
- [ ] DoD gedefinieerd voor alle implementations
- [ ] Risico's geïdentificeerd en behandeld
- [ ] Privacy controls geadresseerd (indien PII)

### 6.2 CISO Goedkeuring

De CISO keurt goed:

- [ ] BIV classificatie akkoord
- [ ] Control selectie passend bij risicoprofiel
- [ ] Residual risks acceptabel
- [ ] Implementatie planning realistisch

### 6.3 Baseline Vastleggen

Na goedkeuring:

1. Zet alle Implementation statussen op "Planned" of "Implemented"
2. Documenteer de baseline datum in System document
3. Plan eerste Self-Assessment

**Output Fase 6:**
- [ ] Security Officer sign-off
- [ ] CISO goedkeuring
- [ ] Baseline gedocumenteerd
- [ ] Eerste assessment gepland

---

## Quick Reference: Templates

| Document | Template | Locatie |
|----------|----------|---------|
| Systeem | System Template.md | Templates/ |
| Component | Component Template.md | Templates/ |
| Implementation | Implementation Template.md | Templates/ |
| Risk | Risk Template.md | Templates/ |
| SCB | SCB-Template.md | Documentatie/SCB/ |

## Quick Reference: Naamconventies

| Type | Conventie | Voorbeeld |
|------|-----------|-----------|
| System | {Naam} | XENA |
| Component | {Naam} | PostgreSQL |
| Implementation | IMPL-{Sys}-{Comp}-{Ctrl} | IMPL-XENA-PostgreSQL-3.11 |
| Risk | RSK-{NNN} | RSK-001 |
| SCB | SCB-{System} | SCB-XENA |

## Gerelateerde Documenten

- [[Documentatie/SCB/SCB-Template|SCB Template]]
- [[Documentatie/SCB/SCB-XENA|SCB XENA]]
- [[Frameworks/LISA/5-LISA-Implementatie|LISA Implementatie Laag]]
- [[Frameworks/LISA/6-LISA-Risicobeheer|LISA Risicobeheer]]
