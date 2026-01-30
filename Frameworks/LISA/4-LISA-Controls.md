---
id: "LISA-4"
type: framework-documentation
name: "LISA Controls"
version: "1.0"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - lisa
  - framework
  - controls
---

# LISA Laag 3: Controls

## Overzicht

De control laag vormt de tactische kern van LISA. Hier worden de abstracte security requirements vertaald naar concrete, implementeerbare maatregelen. Elke control specificeert wat moet worden gedaan, waarom het belangrijk is en hoe het kan worden geïmplementeerd.

LISA maakt gebruik van de CIS Controls v8 als primaire control set, aangevuld met Extended Privacy Controls voor AVG-specifieke eisen. Samen vormen zij een compleet control framework van 180 controls.

## CIS Controls v8

De Center for Internet Security (CIS) Controls zijn wereldwijd erkend als een praktische, geprioriteerde set van cybersecurity maatregelen. De controls zijn ontwikkeld door een gemeenschap van security professionals en worden regelmatig bijgewerkt op basis van actuele dreigingsinformatie.

De kracht van de CIS Controls ligt in hun pragmatische aanpak. In plaats van alle mogelijke maatregelen te beschrijven, focussen zij op de maatregelen met de hoogste impact tegen de meest voorkomende aanvallen. Dit maakt ze bijzonder geschikt als tactische implementatielaag.

CIS Controls v8 bevat 153 controls georganiseerd in 18 categorieën:

| # | Categorie | Controls | Focus |
|---|-----------|----------|-------|
| 1 | Enterprise Asset Inventory | 5 | Hardware inventarisatie |
| 2 | Software Asset Inventory | 7 | Software inventarisatie |
| 3 | Data Protection | 14 | Data classificatie en bescherming |
| 4 | Secure Configuration | 12 | Hardening van systemen |
| 5 | Account Management | 6 | Accountbeheer |
| 6 | Access Control | 8 | Toegangsbeheer |
| 7 | Vulnerability Management | 7 | Kwetsbaarheidsbeheer |
| 8 | Audit Log Management | 12 | Logging en monitoring |
| 9 | Email/Browser Protection | 7 | E-mail en browser beveiliging |
| 10 | Malware Defenses | 7 | Anti-malware |
| 11 | Data Recovery | 5 | Backup en recovery |
| 12 | Network Infrastructure | 8 | Netwerkbeheer |
| 13 | Network Monitoring | 11 | Netwerkdetectie |
| 14 | Security Awareness | 9 | Training en bewustwording |
| 15 | Service Provider Management | 7 | Leveranciersbeheer |
| 16 | Application Security | 14 | Applicatiebeveiliging |
| 17 | Incident Response | 9 | Incidentafhandeling |
| 18 | Penetration Testing | 5 | Pentesting |

→ [[Frameworks/CIS-Controls-v8|CIS Controls v8 Framework]]

## Implementation Groups

Een onderscheidende eigenschap van de CIS Controls is de indeling in Implementation Groups (IG). Deze indeling erkent dat niet elke organisatie dezelfde middelen en risicoprofiel heeft.

**Implementation Group 1 (IG1)** bevat de essentiële cyber hygiëne maatregelen die elke organisatie zou moeten implementeren. Deze 56 controls adresseren de meest voorkomende aanvallen en vormen het absolute minimum voor informatiebeveiliging. IG1 controls zijn gemarkeerd met priority 5 (Critical) en 4 (High) binnen LISA.

**Implementation Group 2 (IG2)** voegt controls toe voor organisaties met IT-personeel en meer complexe infrastructuur. Dit brengt het totaal op 130 controls. IG2 controls zijn gemarkeerd met priority 3 (Medium) binnen LISA.

**Implementation Group 3 (IG3)** omvat alle 153 controls en is bedoeld voor organisaties met security specialisten die te maken hebben met geavanceerde dreigingen. IG3-specifieke controls zijn gemarkeerd met priority 2 (Low) of 1 (Very Low) binnen LISA.

De prioritering binnen LISA combineert de IG-classificatie met factoren als compliance-relevantie en organisatiespecifieke context.

## Extended Privacy Controls (EXT-P)

De CIS Controls zijn primair gericht op informatiebeveiliging. Voor privacy-specifieke eisen zijn 27 Extended Privacy Controls toegevoegd die de AVG/GDPR operationaliseren. Deze controls adresseren aspecten die niet of onvoldoende worden gedekt door traditionele security controls.

De EXT-P controls zijn georganiseerd in 12 categorieën:

| # | Categorie | Controls | Focus |
|---|-----------|----------|-------|
| EXT-P1 | Privacy Governance | 3 | Beleid, FG, verwerkingsregister |
| EXT-P2 | DPIA | 2 | Impact assessments |
| EXT-P3 | Dataminimalisatie | 2 | Noodzakelijkheid en bewaartermijnen |
| EXT-P4 | Doelbinding | 2 | Purpose limitation |
| EXT-P5 | Gegevensbescherming | 3 | Pseudonimisering, toegang, encryptie |
| EXT-P6 | Aggregatie | 1 | Anonimisering |
| EXT-P7 | Transparantie | 2 | Privacyverklaring, informatieplicht |
| EXT-P8 | Rechten Betrokkenen | 5 | Inzage, rectificatie, vergetelheid, etc. |
| EXT-P9 | Grondslagen | 2 | Consent, documentatie |
| EXT-P10 | Privacy by Design | 2 | SDLC, inkoop |
| EXT-P11 | Datalekken | 2 | Procedures, registratie |
| EXT-P12 | Awareness | 1 | Training |

→ [[Controls/EXT-P|Extended Privacy Controls]]

## Anatomie van een Control

Elke control binnen LISA volgt een gestandaardiseerde structuur die consistentie en compleetheid waarborgt.

**Identificatie** omvat een unieke identifier (bijv. CIS-3.6 of EXT-P5.2), een beschrijvende naam en de categorie waartoe de control behoort.

**Prioritering** geeft de implementatievolgorde aan: priority 5 (Critical) tot priority 1 (Very Low), gebaseerd op de CIS Implementation Group classificatie en aanvullende factoren.

**Framework Mappings** leggen de relaties vast met governance frameworks. Elke control bevat referenties naar ISO 27001 Annex A, NIS2 artikelen en BIO2 maatregelen.

**Security Requirements** geven aan onder welke SR-domeinen de control valt, waardoor bidirectionele navigatie mogelijk is.

**Beschrijving** geeft de rationale achter de control: waarom is deze maatregel belangrijk?

**Implementatie Richtlijnen** bieden praktische handvatten voor het implementeren van de control.

**Dynamische Secties** tonen via Dataview queries welke implementaties zijn vastgelegd en welke risico's zijn gekoppeld.

## Control Status Tracking

Elke control kent een status die de voortgang van implementatie aangeeft:

**Draft** is de initiële status wanneer een control is gedefinieerd maar nog niet actief wordt geïmplementeerd.

**In Progress** geeft aan dat actief wordt gewerkt aan implementaties voor deze control.

**Implemented** betekent dat de control is geïmplementeerd voor alle relevante componenten.

**Verified** is de hoogste status, die aangeeft dat de implementatie onafhankelijk is geverifieerd.

De status op control-niveau is een aggregatie van de status van alle onderliggende implementaties.

## Van Controls naar Implementaties

Een control beschrijft wat moet worden gedaan, maar niet hoe dit specifiek moet worden geconfigureerd voor een bepaald systeem of component. De vertaling naar concrete configuraties, procedures en evidence vindt plaats in de implementatielaag.

E�n control kan meerdere implementaties hebben: één per component waarop de control van toepassing is. De control "Encrypt Sensitive Data at Rest" (CIS-3.11) zal apart worden geïmplementeerd voor MinIO, PostgreSQL en andere systemen die gevoelige data opslaan.

Deze one-to-many relatie maakt het mogelijk om:
- Op control-niveau te rapporteren over totale compliance
- Op implementatie-niveau de specifieke configuratiedetails vast te leggen
- Dezelfde control consistent toe te passen over meerdere systemen

## Prioritering voor Implementatie

Met 180 controls is het essentieel om te prioriteren. LISA biedt hiervoor een priority matrix die rekening houdt met:

**CIS Implementation Group** vormt de basis: IG1 controls gaan voor IG2, die gaan voor IG3.

**Compliance druk** past de prioriteit aan: controls die meerdere frameworks adresseren of wettelijk verplicht zijn krijgen hogere prioriteit.

**Risico context** weegt mee: controls die kritieke risico's mitigeren krijgen voorrang.

**Organisatie context** bepaalt de uiteindelijke prioriteit: de specifieke situatie van de organisatie kan aanleiding zijn om bepaalde controls hoger of lager te prioriteren.

De [[Dashboards/Implementation Tracker|Implementation Tracker]] visualiseert de voortgang per priority niveau.

## Gerelateerde Documenten

- [[Frameworks/LISA/3-LISA-Security-Requirements|LISA Security Requirements]]
- [[Frameworks/LISA/5-LISA-Implementatie|LISA Implementatie]]
- [[Controls/CIS|CIS Controls]]
- [[Controls/EXT-P|Extended Privacy Controls]]
