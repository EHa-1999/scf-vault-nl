---
id: "LISA-3"
type: framework-documentation
name: "LISA Security Requirements"
version: "1.0"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - lisa
  - framework
  - security-requirements
---

# LISA Laag 2: Security Requirements

## Overzicht

De Security Requirements vormen de vertaallaag tussen de abstracte governance frameworks en de concrete tactische controls. Deze laag groepeert de veelheid aan compliance-eisen in dertien coherente domeinen die samen het volledige spectrum van informatiebeveiliging bestrijken.

## De Dertien Domeinen

![[Assets/diagrams/LISA-Security-Requirements.svg]]

De Security Requirements zijn genummerd van SR-1 tot en met SR-13, waarbij elk domein een specifiek aspect van informatiebeveiliging adresseert. Samen vormen ze een compleet beeld van wat een organisatie moet regelen om informatiebeveiliging adequaat te borgen.

## SR-1: Security Governance Framework

Het eerste domein adresseert de organisatorische inbedding van informatiebeveiliging. Een effectief governance framework zorgt ervoor dat security niet afhankelijk is van individuele inspanningen maar structureel is verankerd in de organisatie.

Dit domein omvat het vaststellen en onderhouden van informatiebeveiligingsbeleid, het definiëren van rollen en verantwoordelijkheden, het inrichten van een security awareness programma en het verzekeren van management commitment. Zonder deze governance-basis zijn alle technische maatregelen gebouwd op drijfzand.

→ [[Frameworks/Security-Requirements/SR-1 - Security Governance Framework|SR-1 Details]]

## SR-2: Risk Assessment & Management

Risicomanagement vormt de motor van effectieve informatiebeveiliging. In plaats van alle mogelijke maatregelen te implementeren, richt een risicogebaseerde aanpak zich op de maatregelen die de grootste risicoreductie opleveren.

Dit domein omvat het identificeren van assets en hun waarde, het identificeren van dreigingen en kwetsbaarheden, het bepalen van waarschijnlijkheid en impact, en het selecteren van passende behandelstrategieën.

→ [[Frameworks/Security-Requirements/SR-2 - Risk Assessment & Management|SR-2 Details]]

## SR-3: Access Control & Identity Management

Toegangsbeheer is wellicht het meest fundamentele security domein. Het principe van least privilege - gebruikers krijgen alleen de minimaal noodzakelijke rechten - vormt de basis voor alle access control maatregelen.

Dit domein omvat identity lifecycle management, authenticatie, autorisatie en het monitoren van toegang. Het omvat zowel eindgebruikers als privileged accounts en service accounts.

→ [[Frameworks/Security-Requirements/SR-3 - Access Control & Identity Management|SR-3 Details]]

## SR-4: Cryptographic Controls & Gegevensbescherming

Data vormt de kern van wat we beschermen. Dit domein richt zich op het classificeren van data, het beschermen van data in rust en in transit, en het beheren van cryptografische sleutels.

Het domein begint met weten welke data je hebt en hoe gevoelig deze is. Pas met die kennis kunnen passende beschermingsmaatregelen worden geselecteerd.

→ [[Frameworks/Security-Requirements/SR-4 - Cryptographic Controls & Gegevensbescherming|SR-4 Details]]

## SR-5: Secure System Development & Maintenance

Security moet worden ingebouwd vanaf het begin, niet achteraf worden toegevoegd. Dit domein adresseert de volledige levenscyclus van systemen: van ontwerp en ontwikkeling via deployment tot onderhoud en uitfasering.

Het domein omvat secure software development practices, configuratiebeheer, patch management en application security testing.

→ [[Frameworks/Security-Requirements/SR-5 - Secure System Development & Maintenance|SR-5 Details]]

## SR-6: Security Monitoring & Logging

Zonder zichtbaarheid is er geen security. Dit domein richt zich op het verzamelen, opslaan en analyseren van security-relevante informatie om aanvallen te detecteren en forensisch onderzoek mogelijk te maken.

Effectieve monitoring vereist een balans: te weinig logging mist relevante events, te veel logging leidt tot ruis die de echte signalen verbergt.

→ [[Frameworks/Security-Requirements/SR-6 - Security Monitoring & Logging|SR-6 Details]]

## SR-7: Network Security & Segmentation

De netwerk perimeter is niet langer de enige verdedigingslinie, maar netwerksecurity blijft cruciaal. Dit domein omvat firewalls, netwerksegmentatie, intrusion detection en het beveiligen van netwerkverkeer.

Het principe van defense in depth is hier leidend: meerdere lagen van bescherming zorgen ervoor dat het falen van één maatregel niet direct leidt tot compromittering.

→ [[Frameworks/Security-Requirements/SR-7 - Network Security & Segmentation|SR-7 Details]]

## SR-8: Incident Response & Recovery

Ondanks alle preventieve maatregelen zullen security incidents voorkomen. Dit domein zorgt ervoor dat de organisatie voorbereid is om effectief te reageren en te herstellen.

Incident response omvat detectie, containment, eradicatie en herstel, gevolgd door lessons learned.

→ [[Frameworks/Security-Requirements/SR-8 - Incident Response & Recovery|SR-8 Details]]

## SR-9: Compliance & Audit Management

Dit domein richt zich op het aantoonbaar voldoen aan alle relevante eisen. Het omvat het monitoren van compliance, het uitvoeren van interne audits en het voorbereiden op externe audits.

Compliance is geen einddoel maar een continu proces. Regelmatige assessments identificeren gaps voordat auditors deze vinden.

→ [[Frameworks/Security-Requirements/SR-9 - Compliance & Audit Management|SR-9 Details]]

## SR-10: Continuous Improvement

Informatiebeveiliging is geen project met een einddatum maar een continu proces van verbetering. Dit domein zorgt ervoor dat de organisatie leert van incidenten, audits en veranderende dreigingen.

Vulnerability scanning en penetration testing zijn instrumenten om de effectiviteit van maatregelen te toetsen.

→ [[Frameworks/Security-Requirements/SR-10 - Continuous Improvement|SR-10 Details]]

## SR-11: Physical & Environmental Security

Informatiebeveiliging stopt niet bij de firewall. Fysieke toegang tot systemen kan alle logische beveiligingsmaatregelen omzeilen. Dit domein adresseert de fysieke bescherming van locaties, apparatuur en media.

→ [[Frameworks/Security-Requirements/SR-11 - Physical & Environmental Security|SR-11 Details]]

## SR-12: Third-Party Management

Organisaties zijn steeds afhankelijker van externe leveranciers. Dit domein adresseert de risico's die voortvloeien uit deze afhankelijkheden.

Het omvat leveranciersselectie en due diligence, contractuele security-eisen, het monitoren van leveranciersprestaties en het veilig beëindigen van relaties.

→ [[Frameworks/Security-Requirements/SR-12 - Third-Party Management|SR-12 Details]]

## SR-13: Privacy

Het dertiende domein is specifiek voor privacy en adresseert de eisen van de AVG/GDPR. Hoewel security en privacy overlap hebben, kent privacy eigen concepten die apart moeten worden geadresseerd.

Dit domein omvat privacy governance, data protection impact assessments, rechten van betrokkenen, consent management en datalekprocedures. De 27 Extended Privacy Controls (EXT-P) vormen de tactische invulling.

→ [[Frameworks/Security-Requirements/SR-13 - Privacy|SR-13 Details]]

## Van Requirements naar Controls

Elk Security Requirement is gekoppeld aan een set CIS Controls (en voor SR-13 ook EXT-P Controls) die samen invulling geven aan het domein. Deze mapping is bidirectioneel: vanuit een Requirement zijn de bijbehorende Controls zichtbaar, en vanuit een Control is zichtbaar aan welke Requirements deze bijdraagt.

## Gerelateerde Documenten

- [[Frameworks/LISA/2-LISA-Governance-Laag|LISA Governance Laag]]
- [[Frameworks/LISA/4-LISA-Controls|LISA Controls]]
- [[Frameworks/Security-Requirements|Security Requirements Overzicht]]
