---
id: "LISA-7"
type: framework-documentation
name: "LISA Audits"
version: "2.0"
status: active
created: 2026-01-28
modified: 2026-02-05
tags:
  - lisa
  - framework
  - audits
  - self-assessment
---

# LISA Laag 6: Audits & Assurance

## Overzicht

De auditlaag vormt de verificatiecomponent van LISA. Waar de implementatielaag beschrijft hoe controls zijn geïmplementeerd, zorgt de auditlaag ervoor dat deze implementaties periodiek worden beoordeeld op effectiviteit en compliance. Deze laag sluit de Plan-Do-Check-Act cyclus en maakt continue verbetering mogelijk.

Het auditproces binnen LISA is gebaseerd op het principe van gespreide verantwoordelijkheid: system owners en security officers voeren self-assessments uit, terwijl de interne auditor onafhankelijke verificatie biedt. Deze scheiding waarborgt zowel eigenaarschap als objectiviteit.

## De Audit Cyclus

![[Assets/diagrams/LISA-Audit-Cycle.svg]]

De audit cyclus binnen LISA bestaat uit vier fasen die elkaar opvolgen en versterken. Elke fase heeft een eigen verantwoordelijke en levert specifieke output die als input dient voor de volgende fase.

**Fase 1: Self-Assessment** wordt uitgevoerd door de system owner (voor systeem-assessments) of de security officer (voor domein-assessments). De assessor beoordeelt alle relevante implementations, controleert of de Definition of Done is bereikt, verzamelt evidence en documenteert het oordeel per control.

**Fase 2: Interne Audit** wordt uitgevoerd door de interne auditor, die onafhankelijk is van de geassesseerde systemen en domeinen. De auditor verifieert de self-assessments, controleert steekproefsgewijs de evidence en vormt een onafhankelijk oordeel over de compliance status.

**Fase 3: Bevindingen** worden geregistreerd wanneer gaps of non-conformities worden geconstateerd. Elke bevinding wordt geclassificeerd naar ernst, voorzien van een root cause analyse en gekoppeld aan de betreffende implementation(s).

**Fase 4: Verbeteracties** worden gedefinieerd om bevindingen op te lossen. Deze acties worden geëxporteerd naar het taakbeheersysteem (Jira/Redmine) voor tracking en na implementatie wordt de betreffende implementation bijgewerkt.

## Entiteit Relaties

![[Assets/diagrams/LISA-Audit-Entities.svg]]

De audit-entiteiten binnen LISA zijn gestructureerd volgens een hiërarchisch model dat volledige traceerbaarheid waarborgt. Een Control wordt geïmplementeerd via één of meer Implementations. Meerdere Implementations binnen hetzelfde systeem worden samen beoordeeld in een Self-Assessment. Eén of meer Self-Assessments worden geverifieerd in een Interne Audit. Een Interne Audit kan leiden tot meerdere Bevindingen, die elk terug te herleiden zijn naar specifieke Implementations.

## Assessment Types

LISA onderscheidt drie typen self-assessments, elk met een eigen scope en verantwoordelijke:

### Systeem Assessment

Een systeem assessment beoordeelt alle implementations binnen één specifiek systeem. De scope wordt bepaald door de componenten waaruit het systeem is opgebouwd en de controls die op deze componenten van toepassing zijn.

| Aspect | Beschrijving |
|--------|--------------|
| Scope | Alle IMPL-{Systeem}-* implementations |
| Verantwoordelijke | System Owner |
| Frequentie | Minimaal jaarlijks, bij voorkeur per kwartaal |
| Output | Compliance status per control, evidence links |

Voorbeelden: SA-2026-Q1-XENA, SA-2026-Q1-ZGW, SA-2026-Q1-Email-Archief

### Domein Assessment

Een domein assessment beoordeelt organisatie-brede controls die niet systeem-specifiek zijn. Dit betreft typisch governance, awareness, leveranciersbeheer en incident response.

| Aspect | Beschrijving |
|--------|--------------|
| Scope | CIS categorieën 14, 15, 17, 18 + EXT-P governance |
| Verantwoordelijke | CISO / Security Officer |
| Frequentie | Minimaal jaarlijks |
| Output | Compliance status per control, evidence links |

Voorbeelden: SA-2026-Q1-Security-Awareness, SA-2026-Q1-Leveranciers, SA-2026-Q1-Incident-Response

### Infrastructuur Assessment

Een infrastructuur assessment beoordeelt centraal beheerde technische controls die meerdere systemen bedienen maar niet tot één systeem behoren.

| Aspect | Beschrijving |
|--------|--------------|
| Scope | CIS categorieën 7, 12, 13 (patching, netwerk, monitoring) |
| Verantwoordelijke | Infrastructuur Manager / Security Officer |
| Frequentie | Minimaal jaarlijks, bij voorkeur per kwartaal |
| Output | Compliance status per control, evidence links |

Voorbeelden: SA-2026-Q1-Infrastructuur, SA-2026-Q1-Netwerk-Security

## CIS Controls Categorisatie

De 18 CIS Control categorieën zijn als volgt verdeeld over de assessment types:

| CIS Categorie | Assessment Type | Rationale |
|---------------|-----------------|-----------|
| 1. Asset Inventory | Systeem + Infra | Deels per systeem, deels centraal |
| 2. Software Inventory | Systeem + Infra | Deels per systeem, deels centraal |
| 3. Gegevensbescherming | Systeem | Per systeem waar data wordt verwerkt |
| 4. Secure Configuration | Systeem | Per component binnen systeem |
| 5. Accountbeheer | Systeem + Domein | Systeem-specifiek + centraal IAM |
| 6. Access Control | Systeem | Per systeem |
| 7. Vulnerability Management | Infrastructuur | Centraal beheerd |
| 8. Audit Logging | Systeem | Per systeem |
| 9. Email/Browser Protection | Domein | Organisatie-breed |
| 10. Malware Defense | Infrastructuur | Centraal beheerd |
| 11. Gegevensherstel | Systeem | Per systeem |
| 12. Network Infrastructure | Infrastructuur | Centraal beheerd |
| 13. Network Monitoring | Infrastructuur | Centraal beheerd |
| 14. Security Awareness | Domein | Organisatie-breed |
| 15. Leveranciersbeheer | Domein | Organisatie-breed |
| 16. Application Security | Systeem | Per applicatie |
| 17. Incident Response | Domein | Organisatie-breed |
| 18. Penetratietesten | Domein + Systeem | Organisatie-breed + per systeem |

## Gelaagd Assessment Model (v3.8)

> [!tip] Nieuw in v3.8
> Het gelaagde assessment model integreert CIS/EXT benchmark checklists direct in het auditproces.

Vanaf v3.8 ondersteunt LISA een **drielaags assessment model** dat de kloof overbrugt tussen abstracte CIS Controls en concrete benchmark recommendations:

```
Laag 3: Audit Dossier (verificatie)
         ↑ verifieert steekproefsgewijs
Laag 2: Systeem Assessment (aggregatie)
         ↑ aggregeert scores uit
Laag 1: Component Assessments (technisch detail)
         ↑ gebaseerd op
         CIS/EXT Benchmark Checklists (535 recommendations)
```

### Component Assessment

Een component assessment is nieuw in v3.8 en beoordeelt één technisch component aan de hand van alle recommendations uit de bijbehorende CIS of EXT benchmark. Dit assessment wordt uitgevoerd door de technisch beheerder van het component.

| Aspect | Beschrijving |
|--------|--------------|
| Scope | Alle recommendations uit één benchmark (bijv. 78 voor PostgreSQL) |
| Verantwoordelijke | Technisch Beheerder (DBA, Linux Admin, Platform Engineer) |
| Frequentie | Per kwartaal of bij significante wijzigingen |
| Output | Status per recommendation, score berekening, gap analyse |

Voorbeelden: SA-2026-Q1-XENA-PostgreSQL, SA-2026-Q1-XENA-RHEL, SA-2026-Q1-XENA-Kubernetes

### Voordelen Gelaagd Model

Het gelaagde model biedt significante voordelen ten opzichte van het traditionele systeem-only assessment:

**Technische diepgang** — 535 individuele benchmark recommendations bieden concrete, verifieerbare beoordelingscriteria in plaats van abstracte "is CIS-4.1 geïmplementeerd?" vragen.

**Duidelijk eigenaarschap** — Elk component heeft een dedicated assessor met de juiste technische expertise. De DBA beoordeelt PostgreSQL, de platform engineer beoordeelt Kubernetes.

**Flexibele cadans** — Verschillende componenten kunnen op verschillende frequenties worden beoordeeld. PostgreSQL misschien per kwartaal, RHEL jaarlijks.

**Objectieve scores** — Compliance percentages worden berekend op basis van concrete recommendation-beoordelingen, niet op subjectieve interpretaties.

**Audit-readiness** — De auditor kan steekproefsgewijs recommendations verifiëren met directe referentie naar de officiële CIS benchmark PDF.

### Zie Voorbeelden

Een volledig uitgewerkt voorbeeld van het gelaagde model is beschikbaar in de [[Voorbeelden/_README|Voorbeelden map]], inclusief:

- [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-PostgreSQL|PostgreSQL Component Assessment]] — Alle 78 recommendations beoordeeld
- [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA|XENA Systeem Assessment]] — Aggregeert 6 component scores
- [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/_IA-2026-001-XENA|Audit Dossier]] — Met steekproefsgewijze verificatie

## Bevindingen Classificatie

Bevindingen worden geclassificeerd naar ernst om prioritering van verbeteracties mogelijk te maken:

| Classificatie | Criteria | Response Tijd |
|---------------|----------|---------------|
| **Kritiek** | Directe bedreiging voor BIV, compliance-blokkerende gap | Onmiddellijk (< 1 week) |
| **Hoog** | Significante gap in control effectiviteit | Kort (< 1 maand) |
| **Medium** | Gedeeltelijke implementatie, verbetering nodig | Middellang (< 3 maanden) |
| **Laag** | Minor gap, best practice niet volledig gevolgd | Langere termijn (< 6 maanden) |
| **Observatie** | Aanbeveling zonder compliance-impact | Optioneel |

## Audit Planning

De audit planning volgt een risico-gebaseerde aanpak waarbij systemen met hogere BIV-classificatie en meer recente wijzigingen vaker worden beoordeeld:

| BIV Classificatie | Self-Assessment Frequentie | Interne Audit Frequentie |
|-------------------|----------------------------|--------------------------|
| Hoog (III) | Per kwartaal | Jaarlijks volledig |
| Midden (II) | Per half jaar | Jaarlijks steekproef |
| Laag (I) | Jaarlijks | Tweejaarlijks |

Aanvullende triggers voor tussentijdse assessments zijn: significante wijzigingen aan het systeem, security incidents, nieuwe compliance-eisen, en bevindingen uit externe audits.

## Evidence Vereisten

Voor elk assessment type gelden specifieke evidence vereisten:

### Configuratie Evidence
- Screenshots van security-relevante instellingen
- Exports van configuratiebestanden
- Infrastructure-as-Code bestanden (Terraform, Ansible)

### Test Evidence
- Resultaten van vulnerability scans
- Penetration test rapporten
- Security test resultaten

### Proces Evidence
- Audit logs die werking aantonen
- Goedkeuringsrecords
- Change management tickets

### Review Evidence
- Meeting notulen
- Sign-off documenten
- Assessment rapporten

## Integratie met Externe Audits

Self-assessments en interne audits dienen als voorbereiding op externe audits zoals ISO 27001 certificering en BIO assessments. De LISA structuur maakt het mogelijk om:

- Per Annex A control de relevante implementations te tonen
- Evidence direct beschikbaar te hebben voor auditors
- Gaps proactief te identificeren en te adresseren
- Audit trail te demonstreren voor continue verbetering

## Folder Structuur

LISA gebruikt een audit-dossier structuur waarbij alle documenten van één audit bij elkaar staan. Met het gelaagde model (v3.8) bevat de Self-Assessments map zowel het systeem-assessment als de component-assessments:

```
Audits/
├── 2026/                                    ← Per jaar
│   ├── IA-2026-001-XENA/                   ← Audit dossier
│   │   ├── _IA-2026-001-XENA.md            ← Hoofdrapport
│   │   ├── Self-Assessments/
│   │   │   ├── SA-2026-Q1-XENA.md          ← Systeem assessment (aggregerend)
│   │   │   ├── SA-2026-Q1-XENA-PostgreSQL.md  ← Component: 78 recs
│   │   │   ├── SA-2026-Q1-XENA-RHEL.md        ← Component: 255 recs
│   │   │   ├── SA-2026-Q1-XENA-Kubernetes.md   ← Component: 124 recs
│   │   │   ├── SA-2026-Q1-XENA-NGINX.md        ← Component: 52 recs
│   │   │   ├── SA-2026-Q1-XENA-MinIO.md        ← Component: 11 recs
│   │   │   └── SA-2026-Q1-XENA-KeyCloak.md     ← Component: 15 recs
│   │   ├── Bevindingen/
│   │   │   ├── FIND-2026-001.md
│   │   │   └── FIND-2026-002.md
│   │   └── Evidence/                        ← Lokale evidence kopieën
│   │
│   └── IA-2026-002-Domeinen/
│       ├── _IA-2026-002-Domeinen.md
│       └── ...
│
├── Scripts/                                 ← Templater scripts
│   ├── Nieuwe Interne Audit.md
│   ├── Nieuw Self-Assessment.md
│   └── Nieuwe Bevinding.md
│
└── README.md                                ← Handleiding
```

Het voordeel van deze dossier-structuur is dat alle documenten van één audit fysiek bij elkaar staan, wat archivering en overdracht vergemakkelijkt. De Dataview queries zoeken recursief door alle submappen, waardoor cross-audit rapportages mogelijk blijven.

> [!example] Voorbeeld
> Zie [[Voorbeelden/_README|Voorbeelden map]] voor een volledig uitgewerkt voorbeeld van deze structuur.

## Gerelateerde Documenten

- [[Frameworks/LISA/5-LISA-Implementatie|LISA Implementatie]]
- [[Frameworks/LISA/6-LISA-Risicobeheer|LISA Risicobeheer]]
- [[Dashboards/Audit Dashboard|Audit Dashboard]]
- [[Templates/Component Assessment Template|Component Assessment Template]]
- [[Voorbeelden/_README|Voorbeelden - Gelaagd Assessment Model]]
