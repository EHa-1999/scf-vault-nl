---
id: "LISA-1"
type: framework-documentation
name: "LISA Introductie"
version: "1.0"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - lisa
  - framework
  - introductie
---

# LISA - Layered Information Security Architecture

## Wat is LISA?

LISA (Layered Information Security Architecture) is een gestructureerd raamwerk voor informatiebeveiliging dat organisaties helpt om security controls systematisch te implementeren, monitoren en verbeteren. Het framework is ontworpen om de kloof te overbruggen tussen abstracte compliance-eisen en concrete technische implementaties.

De naam LISA verwijst naar de gelaagde architectuur die het fundament vormt van dit framework. Net zoals de Nederlandse overheidsarchitecturen GEMMA, NORA en PETRA een referentiekader bieden voor respectievelijk gemeenten, de rijksoverheid en provincies, biedt LISA een referentiekader voor informatiebeveiliging dat toepasbaar is binnen elke organisatie die werkt met meerdere compliance-frameworks en technische systemen.

## Waarom LISA?

Organisaties worden geconfronteerd met een groeiend aantal compliance-verplichtingen: ISO 27001 voor certificering, NIS2 voor Europese wetgeving, BIO voor de Nederlandse overheid, AVG voor privacy. Elk framework heeft zijn eigen terminologie, structuur en focus. Dit leidt vaak tot fragmentatie waarbij dezelfde beveiligingsmaatregel meerdere keren wordt geïmplementeerd, gedocumenteerd en geauditeerd voor verschillende frameworks.

LISA lost dit probleem op door een uniforme architectuur te bieden waarin alle frameworks samenkomen. Een enkele implementatie van een control kan worden gemapped naar meerdere compliance-eisen, waardoor dubbel werk wordt voorkomen en een integraal beeld ontstaat van de security posture.

## De Vijf Lagen van LISA

![[Assets/diagrams/LISA-Architecture.svg]]

Elke laag bouwt voort op de onderliggende laag en voegt een niveau van concreetheid toe. De governance frameworks definiëren wat moet worden bereikt, de security requirements groeperen dit in beheersbare domeinen, de controls specificeren welke maatregelen nodig zijn, de implementaties beschrijven hoe dit wordt gerealiseerd, en de evidence bewijst dat het daadwerkelijk werkt.

## Kernprincipes

LISA is gebouwd op vier kernprincipes die de effectiviteit en bruikbaarheid van het framework waarborgen.

**Traceerbaarheid** vormt het eerste principe. Elke implementatie is traceerbaar naar een control, elke control naar een security requirement, en elk requirement naar een of meerdere governance frameworks. Deze volledige traceerbaarheid is essentieel voor audits en compliance-rapportages.

**Herbruikbaarheid** is het tweede principe. Een control hoeft slechts één keer te worden gedefinieerd en kan vervolgens worden toegepast op meerdere componenten en systemen. De specifieke implementatiedetails worden vastgelegd in het Implementation object, niet in de control zelf.

**Schaalbaarheid** vormt het derde principe. LISA is ontworpen om mee te groeien met de organisatie. Nieuwe systemen, componenten of frameworks kunnen worden toegevoegd zonder de bestaande structuur aan te tasten.

**Audit-readiness** is het vierde en laatste principe. Alle informatie die nodig is voor interne en externe audits is direct beschikbaar: de control-definitie, de implementatiestatus, het bewijsmateriaal en de risico-analyse.

## Navigeren door LISA

Dit document is het startpunt voor het begrijpen van LISA. De volgende documenten beschrijven elke laag in detail:

- [[Frameworks/LISA/2-LISA-Governance-Laag|LISA Governance Laag]] - De strategische frameworks
- [[Frameworks/LISA/3-LISA-Security-Requirements|LISA Security Requirements]] - De 13 kerngebieden
- [[Frameworks/LISA/4-LISA-Controls|LISA Controls]] - De tactische maatregelen
- [[Frameworks/LISA/5-LISA-Implementatie|LISA Implementatie]] - De concrete toepassing
- [[Frameworks/LISA/6-LISA-Risicobeheer|LISA Risicobeheer]] - Evidence en risico's
- [[Frameworks/LISA/7-LISA-Audits|LISA Audits]] - Self-assessments en interne audits

## Documenthistorie

| Versie | Datum | Wijziging | Auteur |
|--------|-------|-----------|--------|
| 1.0 | 2026-01-28 | Initiële versie | Security Architect |
