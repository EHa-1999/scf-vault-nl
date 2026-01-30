---
id: "LISA-6"
type: framework-documentation
name: "LISA Risicobeheer"
version: "1.0"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - lisa
  - framework
  - risicobeheer
---

# LISA Laag 5: Risicobeheer & Evidence

## Overzicht

De vijfde laag van LISA adresseert twee nauw verweven onderwerpen: risicobeheer en evidence. Risicobeheer vormt de strategische motor die bepaalt waar beveiligingsinspanningen worden ingezet. Evidence vormt het bewijs dat deze inspanningen daadwerkelijk zijn gerealiseerd en effectief functioneren.

Samen zorgen deze twee pijlers ervoor dat informatiebeveiliging niet willekeurig maar risicogebaseerd wordt uitgevoerd, en dat de resultaten aantoonbaar zijn voor management, auditors en toezichthouders.

## Risicobeheer binnen LISA

Risicobeheer is het kompas van informatiebeveiliging. In een wereld van beperkte middelen en onbeperkte dreigingen is het niet mogelijk om alles te beveiligen. Een risicogebaseerde aanpak zorgt ervoor dat middelen worden ingezet waar ze de grootste risicoreductie opleveren.

LISA integreert risicobeheer op meerdere niveaus:

**Op framework-niveau** bepaalt de risico-analyse welke compliance frameworks relevant zijn voor de organisatie. Een gemeente heeft te maken met BIO en NIS2, terwijl een webshop primair focust op PCI-DSS.

**Op control-niveau** bepaalt het risicoprofiel de prioritering. Controls die kritieke risico's adresseren krijgen voorrang boven controls voor lage risico's.

**Op implementation-niveau** worden specifieke risico's gekoppeld aan de maatregelen die deze mitigeren. Dit maakt het mogelijk om te traceren welke risico's zijn afgedekt en welke nog openstaan.

## Het Risico-Object

Een Risk binnen LISA representeert een geïdentificeerd risico dat door één of meerdere controls kan worden gemitigeerd. Het risico-object volgt een gestandaardiseerde structuur:

**Identificatie** omvat een unieke ID (bijv. RSK-001) en een beschrijvende naam die het risico samenvat.

**Classificatie** bepaalt de ernst van het risico:
- **Critical** - Existentieel risico dat onmiddellijke actie vereist
- **High** - Significant risico met hoge prioriteit
- **Medium** - Relevant risico dat moet worden geadresseerd
- **Low** - Beperkt risico met lagere prioriteit

**Risico-analyse** beschrijft het risico in detail:
- **Dreiging** - Wat kan er misgaan?
- **Kwetsbaarheid** - Welke zwakheid wordt uitgebuit?
- **Impact** - Wat zijn de gevolgen als het risico zich manifesteert?
- **Waarschijnlijkheid** - Hoe waarschijnlijk is het dat dit gebeurt?

**Mitigatie** beschrijft hoe het risico wordt behandeld:
- **Behandelstrategie** - Accepteren, mitigeren, overdragen of vermijden
- **Gekoppelde Controls** - Welke controls adresseren dit risico?
- **Restrisico** - Wat blijft over na implementatie van maatregelen?

## Risico-Control Mapping

De koppeling tussen risico's en controls is bidirectioneel binnen LISA:

![[Assets/diagrams/LISA-Risk-Control-Mapping.svg]]

Vanuit een risico kan worden gezien welke controls dit risico adresseren. Vanuit een control kan worden gezien welke risico's erdoor worden gemitigeerd. Deze bidirectionaliteit ondersteunt zowel de risico-analyse (welke maatregelen zijn nodig?) als de compliance-rapportage (welke risico's worden door deze maatregel afgedekt?).

## Risico Prioritering

De prioritering van risico's volgt een systematische methodiek die rekening houdt met zowel impact als waarschijnlijkheid:

| | Waarschijnlijkheid Laag | Waarschijnlijkheid Midden | Waarschijnlijkheid Hoog |
|---|---|---|---|
| **Impact Hoog** | Medium | High | Critical |
| **Impact Midden** | Low | Medium | High |
| **Impact Laag** | Low | Low | Medium |

De resulterende classificatie bepaalt de urgentie waarmee het risico moet worden geadresseerd:

- **Critical risico's** vereisen onmiddellijke actie
- **High risico's** moeten binnen een kwartaal worden geadresseerd
- **Medium risico's** worden opgenomen in de reguliere planning
- **Low risico's** worden geaccepteerd of opgenomen in de backlog

## Evidence Management

Evidence is het bewijsmateriaal dat aantoont dat beveiligingsmaatregelen daadwerkelijk zijn geïmplementeerd en functioneren. Zonder adequate evidence is compliance niet aantoonbaar, ongeacht hoeveel maatregelen zijn getroffen.

LISA onderscheidt verschillende typen evidence:

**Configuration Evidence** toont aan dat systemen correct zijn geconfigureerd. Dit omvat screenshots van configuratieschermen, exports van configuratiebestanden en documentatie van instellingen. Dit type evidence is relatief eenvoudig te verzamelen maar geeft slechts een momentopname.

**Test Evidence** toont aan dat maatregelen effectief zijn. Dit omvat resultaten van security tests, vulnerability scans en penetration tests. Dit type evidence is waardevoller omdat het de effectiviteit test, niet alleen de aanwezigheid van configuratie.

**Process Evidence** toont aan dat procedures worden gevolgd. Dit omvat audit logs, approval records en workflow documentatie. Dit type evidence toont de operationele werking over tijd.

**Review Evidence** toont aan dat periodieke beoordelingen plaatsvinden. Dit omvat meeting notes, sign-offs en assessment rapporten. Dit type evidence ondersteunt de management review die ISO 27001 vereist.

## Evidence Lifecycle

Evidence is niet statisch maar heeft een levenscyclus:

**Verzamelen** - Evidence wordt gegenereerd door systemen (logs, configuratie-exports) of door mensen (test rapporten, review documenten).

**Opslaan** - Evidence wordt opgeslagen in een gecontroleerde omgeving waar integriteit en authenticiteit worden gewaarborgd. Dit is typisch een document management systeem, niet de Obsidian vault zelf.

**Linken** - Vanuit de LISA implementation wordt een link gelegd naar de evidence locatie. De link bevat metadata over het type evidence, de datum en de relevante control.

**Reviewen** - Evidence wordt periodiek gereviewd op volledigheid en actualiteit. Verouderde evidence moet worden vervangen door actuele versies.

**Archiveren** - Na de retentieperiode wordt evidence gearchiveerd of verwijderd conform het datamanagement beleid.

## Audit Support

LISA is ontworpen met audit-readiness als kernprincipe. De structuur ondersteunt zowel interne als externe audits:

**Interne Audits** kunnen gebruik maken van de Compliance Dashboard om snel te identificeren welke controls zijn geïmplementeerd en welke gaps bestaan. De bidirectionele links maken het mogelijk om van een compliance-eis door te navigeren naar de specifieke implementatie en het bijbehorende bewijsmateriaal.

**Externe Audits** profiteren van de gestructureerde documentatie. Een ISO 27001 auditor kan de Annex A controls aflopen en voor elke control zien welke LISA-implementaties deze adresseren. De evidence links bieden direct toegang tot het bewijsmateriaal.

**Certificeringsaudits** vereisen aanvullende documentatie zoals het ISMS handboek en de risicoanalyse. LISA vormt de operationele kern maar moet worden aangevuld met de proces-documentatie die de ISO 27001 clausules 4-10 vereisen.

## Dashboards

LISA biedt meerdere dashboards voor verschillende doelgroepen:

De [[Dashboards/Main Dashboard|Main Dashboard]] geeft een overzicht van de totale security posture met key metrics en status indicators.

De [[Dashboards/Compliance Dashboard|Compliance Dashboard]] focust op compliance per framework en toont de voortgang richting certificering of compliance-deadlines.

De [[Dashboards/Implementation Tracker|Implementation Tracker]] biedt operationeel inzicht in welke implementaties zijn afgerond en welke nog openstaan.

De [[Dashboards/Risk Dashboard|Risk Dashboard]] toont het risicolandschap met open risico's, mitigatiestatus en trends over tijd.

## Continue Verbetering

Risicobeheer en evidence zijn geen eenmalige activiteiten maar continue processen. De PDCA-cyclus (Plan-Do-Check-Act) vormt de basis:

**Plan** - Identificeer risico's, bepaal behandelstrategieën en plan implementaties.

**Do** - Implementeer maatregelen en verzamel evidence.

**Check** - Review de effectiviteit van maatregelen, analyseer incidents en audit bevindingen.

**Act** - Verbeter maatregelen op basis van bevindingen, update risico-analyses en pas prioritering aan.

LISA ondersteunt deze cyclus door de status tracking, review datums en version history die in elke entiteit zijn ingebouwd.

## Gerelateerde Documenten

- [[Frameworks/LISA/5-LISA-Implementatie|LISA Implementatie]]
- [[Frameworks/LISA/1-LISA-Introductie|LISA Introductie]]
- [[Risks|Risico's Overzicht]]
- [[Evidence|Evidence]]
- [[Dashboards/Risk Dashboard|Risk Dashboard]]
