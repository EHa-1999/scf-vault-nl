---
id: "LISA-2"
type: framework-documentation
name: "LISA Governance Laag"
version: "1.0"
status: active
created: 2026-01-28
modified: 2026-01-28
tags:
  - lisa
  - framework
  - governance
---

# LISA Laag 1: Governance & Frameworks

## Overzicht

De governance laag vormt het strategische fundament van LISA. Hier worden de externe eisen vastgelegd waaraan de organisatie moet voldoen: wetgeving, standaarden, certificeringseisen en best practices. Deze laag beantwoordt de vraag "waarom" bepaalde beveiligingsmaatregelen nodig zijn.

## Framework Hiërarchie

![[Assets/diagrams/LISA-Governance-Hierarchy.svg]]

De governance frameworks binnen LISA zijn georganiseerd in een hiërarchie die loopt van abstract naar concreet. Het NIST Cybersecurity Framework fungeert als overkoepelend raamwerk, met ISO 27001, NIS2 en AVG als compliance-niveau frameworks, en de BIO als overheidsspecifieke implementatie.

## NIST Cybersecurity Framework

Het NIST Cybersecurity Framework fungeert als het overkoepelende raamwerk binnen LISA. Ontwikkeld door het National Institute of Standards and Technology van de Verenigde Staten, biedt het een universele taal voor cybersecurity die wereldwijd wordt erkend.

Het framework organiseert cybersecurity rondom vijf kernfuncties die de volledige security lifecycle bestrijken:

**Identify (ID)** richt zich op het ontwikkelen van organisatorisch begrip van cybersecurity risico's. Dit omvat asset management, business environment, governance, risk assessment en risk management strategy.

**Protect (PR)** omvat de implementatie van waarborgen die de levering van kritieke diensten verzekeren. Hieronder vallen access control, awareness training, data security, information protection processes en maintenance.

**Detect (DE)** definieert activiteiten om cybersecurity events tijdig te identificeren. Dit betreft anomalies en events, security continuous monitoring en detection processes.

**Respond (RS)** beschrijft activiteiten om actie te ondernemen bij gedetecteerde cybersecurity incidents. Dit omvat response planning, communications, analysis, mitigation en improvements.

**Recover (RC)** identificeert activiteiten om veerkracht te behouden en capabilities te herstellen na een incident. Dit betreft recovery planning, improvements en communications.

→ [[Frameworks/NIST-CSF|NIST CSF Framework]]

## ISO 27001:2022

ISO 27001 is de internationale standaard voor Information Security Management Systems (ISMS). De 2022-versie bevat 93 controls in Annex A, georganiseerd in vier categorieën:

**Organizational Controls (A.5)** omvatten 37 controls gericht op beleid, rollen, verantwoordelijkheden en de organisatorische inbedding van informatiebeveiliging.

**People Controls (A.6)** bevatten 8 controls die betrekking hebben op medewerkers gedurende hun gehele dienstverband.

**Physical Controls (A.7)** bestaan uit 14 controls voor de fysieke beveiliging van locaties en apparatuur.

**Technological Controls (A.8)** omvatten 34 controls voor technische beveiligingsmaatregelen.

Het is belangrijk te begrijpen dat ISO 27001 niet voorschrijft hoe controls moeten worden geïmplementeerd. De standaard definieert wat moet worden geadresseerd, terwijl de organisatie zelf bepaalt hoe dit wordt ingevuld op basis van een risicoanalyse.

→ [[Frameworks/ISO-27001-2022|ISO 27001:2022 Framework]]

## NIS2 Directive

De Network and Information Security Directive 2 (2022/2555) is de Europese richtlijn voor cybersecurity die sinds 2024 van kracht is. De richtlijn stelt eisen aan "essentiële" en "belangrijke" entiteiten in kritieke sectoren, waaronder de overheid.

Artikel 21 van de richtlijn specificeert de minimale beveiligingsmaatregelen:

- **Art.21(2)(a)** - Beleid inzake risicoanalyse en beveiliging van informatiesystemen
- **Art.21(2)(b)** - Incidentenbehandeling
- **Art.21(2)(c)** - Bedrijfscontinuïteit en crisisbeheer
- **Art.21(2)(d)** - Beveiliging van de toeleveringsketen
- **Art.21(2)(e)** - Beveiliging bij de verwerving, ontwikkeling en onderhoud
- **Art.21(2)(f)** - Beoordeling van de doeltreffendheid van maatregelen
- **Art.21(2)(g)** - Basispraktijken cyberhygiëne en opleiding
- **Art.21(2)(h)** - Beleid inzake cryptografie en encryptie
- **Art.21(2)(i)** - Beveiligingsbeleid inzake personeel en toegangsbeleid

De richtlijn introduceert ook significante meldplichten (24 uur voor early warning, 72 uur voor volledig rapport) en substantiële boetes bij non-compliance.

→ [[Frameworks/NIS2|NIS2 Framework]]

## BIO 2.0 - Baseline Informatiebeveiliging Overheid

De BIO is het normenkader voor informatiebeveiliging binnen de Nederlandse overheid. BIO 2.0 is gebaseerd op ISO 27001:2022 en hanteert dezelfde structuur, maar bevat aanvullende overheidsspecifieke eisen.

De BIO kent een verplichtend karakter voor alle overheidsorganisaties: Rijk, provincies, gemeenten en waterschappen. Het framework volgt de ISO 27001 nummering maar voegt waar nodig specifieke overheidseisen toe.

Een belangrijk onderscheid met ISO 27001 is de BIV-classificatie (Beschikbaarheid, Integriteit, Vertrouwelijkheid). De BIO specificeert welke maatregelen verplicht zijn op basis van de classificatie van het informatiesysteem.

→ [[Frameworks/BIO2|BIO2 Framework]]

## AVG/GDPR - Privacy Framework

De Algemene Verordening Gegevensbescherming (AVG/GDPR) is weliswaar primair een privacy-framework, maar bevat significante eisen voor informatiebeveiliging. Artikel 32 vereist "passende technische en organisatorische maatregelen" om een beveiligingsniveau te waarborgen dat past bij het risico.

De AVG is binnen LISA geïntegreerd via twee mechanismen: ten eerste zijn de beveiligingseisen gemapped naar de relevante CIS Controls, ten tweede zijn 27 Extended Privacy Controls (EXT-P) toegevoegd die specifiek de privacy-eisen adresseren.

→ [[Frameworks/AVG-GDPR|AVG/GDPR Framework]]

## Integratie en Mappings

De kracht van LISA ligt in de integratie van deze frameworks. Elke control binnen LISA bevat mappings naar alle relevante governance frameworks. Een control zoals "Encrypt Sensitive Data at Rest" (CIS-3.11) is gemapped naar:

| Framework | Referentie |
|-----------|------------|
| ISO 27001:2022 | A.8.24 - Use of cryptography |
| NIS2 | Art.21(2)(h) - Cryptografie |
| BIO2 | 8.24 |

Deze mappings maken het mogelijk om vanuit één implementatie compliance aan te tonen voor meerdere frameworks tegelijk.

## Gerelateerde Documenten

- [[Frameworks/LISA/1-LISA-Introductie|LISA Introductie]]
- [[Frameworks/LISA/3-LISA-Security-Requirements|LISA Security Requirements]]
- [[Dashboards/Compliance Dashboard|Compliance Dashboard]]
