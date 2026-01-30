---
id: "LISA-5"
type: framework-documentation
name: "LISA Implementatie"
version: "1.0"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - lisa
  - framework
  - implementatie
---

# LISA Laag 4: Implementatie

## Overzicht

De implementatielaag vormt de brug tussen tactische controls en de technische realiteit. Hier wordt vastgelegd hoe controls concreet zijn geïmplementeerd voor specifieke systemen en componenten. Deze laag beantwoordt de vraag "hoe" en levert het bewijs dat maatregelen daadwerkelijk zijn gerealiseerd.

## Het Implementation Relatie Model

![[Assets/diagrams/LISA-Implementation-Model.svg]]

De implementatielaag bestaat uit drie kernentiteiten: Systems, Components en Implementations. Een Implementation documenteert hoe een specifieke Control is geïmplementeerd voor een specifieke Component binnen een specifiek System.

## Systems

Een System binnen LISA representeert een afgebakende applicatie of platform die als geheel kan worden beheerd vanuit een security perspectief. Voorbeelden zijn XENA (document management), ZGW (zaakgericht werken) en E-mail Archief.

Elk System wordt gekarakteriseerd door eigenaarschap (business en technical owner), classificatie (BIV-niveaus) en de componenten waaruit het is opgebouwd.

→ [[Systems|Systemen Overzicht]]

## Components

Een Component is een technische bouwsteen waaruit systems zijn opgebouwd. Het is typisch een specifieke software applicatie, dienst of infrastructuuronderdeel met een afgebakende functie.

Voorbeelden: MinIO (object storage), PostgreSQL (database), KeyCloak (IAM), Apache NiFi (data orchestratie), NGINX (webserver), OpenBAO (secrets management).

Het onderscheid tussen systems en components is cruciaal. Controls worden geïmplementeerd op component-niveau, niet op system-niveau. Dit maakt hergebruik mogelijk wanneer dezelfde component in meerdere systems voorkomt.

→ [[Components|Componenten Overzicht]]

## Implementations

De Implementation is het kernobject van de operationele laag. Het documenteert hoe een specifieke control is geïmplementeerd voor een specifieke component binnen een specifiek system. Het fungeert als "junction table" die controls verbindt met de technische realiteit.

Elke implementation kent een gestandaardiseerde structuur: identificatie (unieke ID), koppelingen (control, component, system), status, Definition of Done, implementatie details, evidence links en risico-koppelingen.

## Definition of Done

De Definition of Done (DoD) verdient bijzondere aandacht omdat deze het verschil maakt tussen vage claims en aantoonbare beveiliging. Een goede DoD is specifiek, meetbaar, relevant en verifieerbaar.

Een voorbeeld DoD voor "Encrypt Sensitive Data at Rest" (CIS-3.11) op MinIO:

1. Server-side encryption is ingeschakeld (SSE-S3 of SSE-KMS)
2. Encryption keys worden beheerd via OpenBAO
3. Key rotation is geconfigureerd (interval ≤ 90 dagen)
4. Unencrypted uploads worden geweigerd via bucket policy
5. Configuratie is gedocumenteerd en gereviewd door security officer

## Implementation Status Lifecycle

![[Assets/diagrams/LISA-Implementation-Lifecycle.svg]]

Implementations doorlopen een lifecycle van initiatie tot verificatie. De statussen zijn: Not Started, Planned, In Progress, Partial, Implemented en Verified. De hoogste status (Verified) vereist onafhankelijke verificatie, bijvoorbeeld door een security review of audit.

## Multi-System Implementaties

Wanneer dezelfde component in meerdere systems wordt gebruikt, kunnen implementaties worden gedeeld of als template dienen. Dit vereist wel zorgvuldigheid: de technische configuratie kan identiek zijn, maar de context kan verschillen.

LISA ondersteunt dit door implementaties te koppelen aan specifieke system-component combinaties, terwijl de onderliggende control hetzelfde blijft.

## Gerelateerde Documenten

- [[Frameworks/LISA/4-LISA-Controls|LISA Controls]]
- [[Frameworks/LISA/6-LISA-Risicobeheer|LISA Risicobeheer]]
- [[Implementations|Implementaties Overzicht]]
- [[Dashboards/Implementation Tracker|Implementation Tracker]]
