---
id: "EXT-BM-Governance-v1.0"
type: benchmark
benchmark_type: "EXT-Organizational"
name: "Extended Benchmark - Security Governance"
domain: "Governance"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-05
next_review: 2027-02-05
owner: "CISO"
ext_controls:
  - "EXT-O"
sources:
  - "ISO 27001:2022 A.5.1-A.5.8"
  - "BIO2 B1, B2"
  - "NIS2 Art. 20, Art. 21(2)(a)"
recommendations_count: 25
level_1_count: 18
level_2_count: 7
created: 2026-02-05
modified: 2026-02-05
tags:
  - benchmark
  - extended
  - organizational
  - governance
  - beleid
---

# Extended Benchmark: Security Governance v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Domein** | Security Governance |
| **Benchmark Versie** | v1.0 |
| **Status** | Active |
| **Eigenaar** | CISO |
| **Laatste Review** | 2026-02-05 |
| **Volgende Review** | 2027-02-05 |
| **Recommendations** | 25 (18 L1, 7 L2) |

## Navigatie

| ← Terug | Omhoog | Gerelateerde Controls |
|---------|--------|----------------------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Controls/EXT-O/_index\|EXT-O Controls]] |

---

## 1. Overzicht

### 1.1 Scope

Deze Extended Benchmark beschrijft auditeerbare maatregelen voor **Security Governance** — het geheel van beleid, processen, rollen en verantwoordelijkheden voor informatiebeveiliging. De maatregelen zijn gebaseerd op ISO 27001:2022 Annex A.5 (Organizational Controls), BIO2 hoofdstuk B1/B2, en NIS2 governance-eisen.

**Gerelateerde Extended Controls:**
- EXT-O.1 t/m EXT-O.12 (Governance, Beleid, Classificatie)
- Deels EXT-O.13 t/m EXT-O.14 (Informatieoverdracht)

### 1.2 Normenkader Mapping

| Normenkader | Sectie | Beschrijving |
|-------------|--------|--------------|
| **ISO 27001:2022** | A.5.1-A.5.8 | Organizational policies, roles, SoD, management |
| **BIO2** | B1, B2 | Beleid, organisatie, verantwoordelijkheden |
| **NIS2** | Art. 20, 21(2)(a) | Management accountability, governance measures |
| **NEN 7510** | 5.1-5.8 | Organisatorische beheersmaatregelen (zorgsector) |

### 1.3 Profiel Definities

| Profiel | Beschrijving | Doelgroep |
|---------|--------------|-----------|
| **Level 1** | Basismaatregelen voor elke organisatie | Alle organisaties |
| **Level 2** | Uitgebreide maatregelen voor volwassen security | BBN2+, grote organisaties |

---

## 2. Recommendations

### 2.1 Beveiligingsbeleid

#### GOV-1.1: Informatiebeveiligingsbeleid vastgesteld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.1 - Informatiebeveiligingsbeleid Beheer\|EXT-O.1]] |
| **ISO 27001** | A.5.1 |
| **BIO2** | B1.1 |
| **NIS2** | Art. 21(2)(a) |

**Beschrijving:**
De organisatie heeft een informatiebeveiligingsbeleid vastgesteld dat de strategische richting voor informatiebeveiliging definieert, is goedgekeurd door het hoogste management, en is gecommuniceerd naar alle relevante partijen.

**Rationale:**
Het beveiligingsbeleid is het fundament voor alle security-activiteiten. Zonder formeel beleid ontbreekt mandaat, richting en accountability voor informatiebeveiliging.

**Audit Procedure:**
1. Vraag het actuele informatiebeveiligingsbeleid op
2. Controleer of het document is goedgekeurd door directie/bestuur
3. Verifieer dat het beleid is gecommuniceerd (bijv. via intranet, e-mail, awareness)
4. Controleer de reviewdatum en reviewcyclus

**Verwacht Bewijs:**
- [ ] Informatiebeveiligingsbeleid (PDF/docx)
- [ ] Goedkeuringsrecord (handtekening, besluit, notulen MT)
- [ ] Communicatierecord (e-mail, intranet publicatie)
- [ ] Versiebeheer met review historie

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Beleid aanwezig, door MT goedgekeurd, gecommuniceerd, < 1 jaar oud |
| ⚠️ Partial | Beleid aanwezig maar verouderd (> 1 jaar) of niet formeel goedgekeurd |
| ❌ Non-Compliant | Geen beleid, of concept zonder goedkeuring |

**Remediation:**
1. Stel informatiebeveiligingsbeleid op (gebruik template)
2. Leg voor aan MT ter goedkeuring
3. Publiceer en communiceer
4. Plan jaarlijkse review

---

#### GOV-1.2: Beleid bevat verplichte elementen

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.1 - Informatiebeveiligingsbeleid Beheer\|EXT-O.1]] |
| **ISO 27001** | A.5.1 |
| **BIO2** | B1.1 |
| **NIS2** | Art. 21(2)(a) |

**Beschrijving:**
Het informatiebeveiligingsbeleid bevat minimaal: scope, doelstellingen, principes, rollen en verantwoordelijkheden, verwijzing naar onderliggende beleidsdocumenten, en reviewcyclus.

**Audit Procedure:**
1. Review het beleidsdocument op aanwezigheid van verplichte elementen
2. Controleer of elementen inhoudelijk adequaat zijn

**Verwacht Bewijs:**
- [ ] Beleidsdocument met alle verplichte secties

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Alle elementen aanwezig en inhoudelijk adequaat |
| ⚠️ Partial | Meeste elementen aanwezig, enkele ontbreken of zijn onvolledig |
| ❌ Non-Compliant | Meerdere elementen ontbreken |

**Verplichte Elementen Checklist:**
- [ ] Scope (welke systemen, data, processen)
- [ ] Doelstellingen informatiebeveiliging
- [ ] Beveiligingsprincipes
- [ ] Rollen en verantwoordelijkheden
- [ ] Verwijzing naar onderliggend beleid
- [ ] Compliance-eisen (BIO, NIS2, AVG)
- [ ] Sanctiebeleid bij overtredingen
- [ ] Review- en goedkeuringsprocedure
- [ ] Versienummer en -datum

---

#### GOV-1.3: Jaarlijkse beleidsreview uitgevoerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.1 - Informatiebeveiligingsbeleid Beheer\|EXT-O.1]] |
| **ISO 27001** | A.5.1 |
| **BIO2** | B1.1 |
| **NIS2** | Art. 21(2)(a) |

**Beschrijving:**
Het informatiebeveiligingsbeleid wordt minimaal jaarlijks gereviewd, of eerder bij significante wijzigingen in de organisatie, dreigingslandschap of regelgeving.

**Audit Procedure:**
1. Controleer de versiehistorie van het beleid
2. Vraag review-records op (notulen, goedkeuring)
3. Verifieer dat laatste review < 12 maanden geleden

**Verwacht Bewijs:**
- [ ] Versiehistorie met reviewdata
- [ ] Notulen of besluit van laatste review
- [ ] Eventuele wijzigingen ten opzichte van vorige versie

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Review < 12 maanden geleden, gedocumenteerd |
| ⚠️ Partial | Review 12-18 maanden geleden |
| ❌ Non-Compliant | Geen review in afgelopen 18 maanden |

---

#### GOV-1.4: Onderliggend beleid aanwezig

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.1 - Informatiebeveiligingsbeleid Beheer\|EXT-O.1]] |
| **ISO 27001** | A.5.1 |
| **BIO2** | B1.2 |
| **NIS2** | Art. 21(2) |

**Beschrijving:**
Naast het overkoepelende beleid zijn specifieke beleidsdocumenten aanwezig voor relevante domeinen: toegangsbeleid, wachtwoordbeleid, classificatiebeleid, incidentresponsbeleid, etc.

**Audit Procedure:**
1. Vraag lijst van beveiligingsbeleidsdocumenten op
2. Controleer aanwezigheid van minimaal vereiste documenten
3. Steekproefsgewijs: controleer goedkeuring en actualiteit

**Verwacht Bewijs:**
- [ ] Beleidsregister of -index
- [ ] Minimaal: toegangsbeleid, classificatiebeleid, incidentbeleid
- [ ] Aanbevolen: wachtwoordbeleid, thuiswerkbeleid, BYOD-beleid

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Alle minimale beleidsdocumenten aanwezig en actueel |
| ⚠️ Partial | Enkele beleidsdocumenten ontbreken of zijn verouderd |
| ❌ Non-Compliant | Geen of zeer beperkt onderliggend beleid |

---

### 2.2 Rollen en Verantwoordelijkheden

#### GOV-2.1: CISO of Security Officer aangesteld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.2 - Beveiligingsrollen en Verantwoordelijkheden\|EXT-O.2]] |
| **ISO 27001** | A.5.2 |
| **BIO2** | B2.1 |
| **NIS2** | Art. 20(1) |

**Beschrijving:**
Een Chief Information Security Officer (CISO) of Security Officer is formeel aangesteld met duidelijke verantwoordelijkheden, bevoegdheden en rapportagelijnen naar het hoogste management.

**Audit Procedure:**
1. Vraag de functiebeschrijving van de CISO/Security Officer op
2. Controleer formele aanstelling (aanstellingsbesluit, arbeidsovereenkomst)
3. Verifieer rapportagelijn naar directie/bestuur
4. Controleer of de rol is ingevuld (niet vacant)

**Verwacht Bewijs:**
- [ ] Functiebeschrijving CISO/Security Officer
- [ ] Aanstellingsbesluit of -overeenkomst
- [ ] Organogram met rapportagelijnen
- [ ] Bewijs van actuele invulling (naam + contactgegevens)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | CISO aangesteld, functiebeschrijving actueel, directe lijn naar MT |
| ⚠️ Partial | Security Officer aangesteld maar geen directe MT-lijn, of rol deels vacant |
| ❌ Non-Compliant | Geen formele security-rol aangesteld |

---

#### GOV-2.2: Beveiligingsverantwoordelijkheden gedocumenteerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.2 - Beveiligingsrollen en Verantwoordelijkheden\|EXT-O.2]] |
| **ISO 27001** | A.5.2 |
| **BIO2** | B2.2 |
| **NIS2** | Art. 20(1) |

**Beschrijving:**
Beveiligingsverantwoordelijkheden zijn gedocumenteerd voor alle relevante rollen: directie, lijnmanagement, system owners, IT-beheerders, eindgebruikers, en externe partijen.

**Audit Procedure:**
1. Vraag RACI-matrix of rolbeschrijvingen op
2. Controleer of alle relevante rollen zijn opgenomen
3. Verifieer dat verantwoordelijkheden zijn gecommuniceerd

**Verwacht Bewijs:**
- [ ] RACI-matrix informatiebeveiliging
- [ ] Functiebeschrijvingen met security-verantwoordelijkheden
- [ ] Communicatierecords (bijv. awareness materiaal)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | RACI aanwezig, alle rollen opgenomen, gecommuniceerd |
| ⚠️ Partial | Verantwoordelijkheden deels gedocumenteerd |
| ❌ Non-Compliant | Geen gedocumenteerde verantwoordelijkheden |

---

#### GOV-2.3: Functiescheiding toegepast

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.3 - Functiescheiding\|EXT-O.3]] |
| **ISO 27001** | A.5.3 |
| **BIO2** | B2.3 |
| **NIS2** | Art. 21(2)(i) |

**Beschrijving:**
Conflicterende taken en verantwoordelijkheden zijn gescheiden om het risico op ongeautoriseerde of onbedoelde wijzigingen te verminderen. Minimaal: scheiding tussen ontwikkeling/test en productie, scheiding tussen aanvraag en goedkeuring van rechten.

**Audit Procedure:**
1. Vraag functiescheidingsmatrix of -analyse op
2. Controleer op bekende conflicterende combinaties
3. Steekproefsgewijs: verifieer in systemen (bijv. geen dev-rechten op prod)

**Verwacht Bewijs:**
- [ ] Functiescheidingsmatrix
- [ ] Systeemrapporten die scheiding aantonen
- [ ] Compenserende maatregelen bij exceptions

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Functiescheiding geanalyseerd, gedocumenteerd, geïmplementeerd |
| ⚠️ Partial | Functiescheiding deels toegepast, enkele conflicten bestaan |
| ❌ Non-Compliant | Geen functiescheidingsanalyse, bekende conflicten onbehandeld |

---

#### GOV-2.4: Management commitment aantoonbaar

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.4 - Management Beveiligingsverantwoordelijkheden\|EXT-O.4]] |
| **ISO 27001** | A.5.4 |
| **BIO2** | B2.4 |
| **NIS2** | Art. 20(1) |

**Beschrijving:**
Het management toont actief commitment aan informatiebeveiliging door: goedkeuring van beleid, toewijzing van resources, deelname aan security-overleggen, en aandacht voor security in besluitvorming.

**Audit Procedure:**
1. Controleer goedkeuringsrecords van beveiligingsbeleid
2. Vraag budget-toewijzingen voor security op
3. Controleer notulen van MT-vergaderingen op security-agendapunten
4. Interview: vraag naar betrokkenheid directie

**Verwacht Bewijs:**
- [ ] Door directie goedgekeurd beleid
- [ ] Budgetdocumenten met security-allocatie
- [ ] Notulen met security-bespreking
- [ ] Eventueel: directie-statement over security

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Beleid goedgekeurd, budget toegewezen, regelmatige MT-aandacht |
| ⚠️ Partial | Beleid goedgekeurd maar beperkte resources of aandacht |
| ❌ Non-Compliant | Geen formele betrokkenheid MT bij security |

---

### 2.3 Externe Contacten

#### GOV-3.1: Contact met autoriteiten onderhouden

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.5 - Contact met Autoriteiten\|EXT-O.5]] |
| **ISO 27001** | A.5.5 |
| **BIO2** | B2.5 |
| **NIS2** | Art. 23 |

**Beschrijving:**
De organisatie onderhoudt contacten met relevante autoriteiten: toezichthouders (AP, NCSC), sectorale CERT, politie/justitie. Contactgegevens zijn gedocumenteerd en procedures voor escalatie zijn vastgesteld.

**Audit Procedure:**
1. Vraag contactenlijst met autoriteiten op
2. Controleer of relevante autoriteiten zijn opgenomen
3. Verifieer dat escalatieprocedures zijn gedocumenteerd (bijv. in incident response plan)

**Verwacht Bewijs:**
- [ ] Contactenlijst autoriteiten
- [ ] Escalatieprocedure in incident response plan
- [ ] Eventueel: correspondentie met autoriteiten

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Contacten gedocumenteerd, escalatieprocedure aanwezig |
| ⚠️ Partial | Contacten deels gedocumenteerd, procedure incompleet |
| ❌ Non-Compliant | Geen gedocumenteerde contacten of procedures |

---

#### GOV-3.2: Deelname aan security-community

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.6 - Deelname Security Gemeenschap\|EXT-O.6]] |
| **ISO 27001** | A.5.6 |
| **BIO2** | B2.6 |
| **NIS2** | Art. 29 |

**Beschrijving:**
De organisatie neemt actief deel aan security-community's en information sharing initiatieven (ISACs, NCSC, VNG, sectorale werkgroepen) om threat intelligence te delen en te ontvangen.

**Audit Procedure:**
1. Vraag lidmaatschappen en deelnames op
2. Controleer of er actieve deelname is (niet alleen passief lid)
3. Vraag voorbeelden van ontvangen en gedeelde intelligence

**Verwacht Bewijs:**
- [ ] Lidmaatschapsbewijzen (NCSC, Z-CERT, etc.)
- [ ] Deelname aan werkgroepen of overleggen
- [ ] Voorbeelden van ontvangen advisories of gedeelde informatie

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Actieve deelname aan relevante community's |
| ⚠️ Partial | Lidmaatschap maar beperkte actieve deelname |
| ❌ Non-Compliant | Geen deelname aan security-community's |

---

### 2.4 Informatieclassificatie

#### GOV-4.1: Classificatieschema vastgesteld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.12 - Informatieclassificatie\|EXT-O.12]] |
| **ISO 27001** | A.5.12 |
| **BIO2** | B4.1 |
| **NIS2** | Art. 21(2)(a) |

**Beschrijving:**
De organisatie heeft een classificatieschema voor informatie vastgesteld dat minimaal drie niveaus onderscheidt (bijv. Openbaar, Intern, Vertrouwelijk) met bijbehorende beveiligingseisen per niveau.

**Audit Procedure:**
1. Vraag het classificatiebeleid of -schema op
2. Controleer of minimaal drie niveaus zijn gedefinieerd
3. Verifieer dat per niveau beveiligingseisen zijn gespecificeerd
4. Controleer of schema is gecommuniceerd

**Verwacht Bewijs:**
- [ ] Classificatiebeleid of -schema
- [ ] Beveiligingseisen per classificatieniveau
- [ ] Communicatierecords (awareness)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Schema met ≥3 niveaus, eisen per niveau, gecommuniceerd |
| ⚠️ Partial | Schema aanwezig maar incompleet of niet gecommuniceerd |
| ❌ Non-Compliant | Geen classificatieschema |

---

#### GOV-4.2: Informatie is geclassificeerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.12 - Informatieclassificatie\|EXT-O.12]] |
| **ISO 27001** | A.5.12 |
| **BIO2** | B4.2 |
| **NIS2** | Art. 21(2)(a) |

**Beschrijving:**
Informatiesystemen en -assets zijn daadwerkelijk geclassificeerd volgens het vastgestelde schema. Classificatie is gedocumenteerd in asset-register of CMDB.

**Audit Procedure:**
1. Vraag asset-register of CMDB-export op
2. Controleer of assets een classificatie-attribuut hebben
3. Steekproef: zijn classificaties ingevuld en consistent?

**Verwacht Bewijs:**
- [ ] Asset-register met classificatie-kolom
- [ ] Steekproef van geclassificeerde assets

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | ≥90% van assets geclassificeerd |
| ⚠️ Partial | 50-90% van assets geclassificeerd |
| ❌ Non-Compliant | <50% van assets geclassificeerd |

---

#### GOV-4.3: Labeling van informatie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.13 - Informatie Labeling\|EXT-O.13]] |
| **ISO 27001** | A.5.13 |
| **BIO2** | B4.3 |
| **NIS2** | — |

**Beschrijving:**
Informatie en documenten worden gelabeld conform het classificatieschema. Dit kan via headers/footers, metadata, of technische labeling (Microsoft Purview, etc.).

**Audit Procedure:**
1. Controleer labeling-procedures of -richtlijnen
2. Steekproef: zijn documenten gelabeld?
3. Indien technische labeling: controleer configuratie

**Verwacht Bewijs:**
- [ ] Labeling-richtlijnen of -procedures
- [ ] Steekproef gelabelde documenten
- [ ] Eventueel: configuratie-export labeling-tool

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Labeling-procedure actief, documenten worden gelabeld |
| ⚠️ Partial | Procedure aanwezig maar inconsistente toepassing |
| ❌ Non-Compliant | Geen labeling |

---

### 2.5 Project Security

#### GOV-5.1: Security in projecten geborgd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-O/EXT-O.8 - Projectbeveiliging Management\|EXT-O.8]] |
| **ISO 27001** | A.5.8 |
| **BIO2** | B5.1 |
| **NIS2** | Art. 21(2)(a) |

**Beschrijving:**
Informatiebeveiliging is een vast onderdeel van projectmanagement. Elk project bevat een security-assessment of -review, risico-analyse, en beveiligingseisen in requirements.

**Audit Procedure:**
1. Vraag projectmanagement-methodiek of -handboek op
2. Controleer of security-activiteiten zijn opgenomen in het proces
3. Steekproef: controleer recent project op security-deliverables

**Verwacht Bewijs:**
- [ ] Projectmethodiek met security-onderdelen
- [ ] Templates voor security-assessment in projecten
- [ ] Steekproef: security-deliverables uit recent project

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Security in methodiek, aantoonbare toepassing in projecten |
| ⚠️ Partial | Security in methodiek maar inconsistente toepassing |
| ❌ Non-Compliant | Security niet in projectmethodiek |

---

## 3. Complete Recommendations Checklist

### 3.1 Beveiligingsbeleid

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| GOV-1.1 | Informatiebeveiligingsbeleid vastgesteld | L1 | ☐ |
| GOV-1.2 | Beleid bevat verplichte elementen | L1 | ☐ |
| GOV-1.3 | Jaarlijkse beleidsreview uitgevoerd | L1 | ☐ |
| GOV-1.4 | Onderliggend beleid aanwezig | L1 | ☐ |
| GOV-1.5 | Beleid is toegankelijk voor medewerkers | L1 | ☐ |
| GOV-1.6 | Uitzonderingen op beleid formeel goedgekeurd | L2 | ☐ |

### 3.2 Rollen en Verantwoordelijkheden

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| GOV-2.1 | CISO of Security Officer aangesteld | L1 | ☐ |
| GOV-2.2 | Beveiligingsverantwoordelijkheden gedocumenteerd | L1 | ☐ |
| GOV-2.3 | Functiescheiding toegepast | L1 | ☐ |
| GOV-2.4 | Management commitment aantoonbaar | L1 | ☐ |
| GOV-2.5 | Security-overlegstructuur aanwezig | L2 | ☐ |
| GOV-2.6 | Security-rapportage aan MT periodiek | L2 | ☐ |

### 3.3 Externe Contacten

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| GOV-3.1 | Contact met autoriteiten onderhouden | L1 | ☐ |
| GOV-3.2 | Deelname aan security-community | L2 | ☐ |
| GOV-3.3 | Threat intelligence ontvangen en verwerkt | L2 | ☐ |

### 3.4 Informatieclassificatie

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| GOV-4.1 | Classificatieschema vastgesteld | L1 | ☐ |
| GOV-4.2 | Informatie is geclassificeerd | L1 | ☐ |
| GOV-4.3 | Labeling van informatie | L2 | ☐ |
| GOV-4.4 | Handling-procedures per niveau | L1 | ☐ |

### 3.5 Project Security

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| GOV-5.1 | Security in projecten geborgd | L1 | ☐ |
| GOV-5.2 | Security-gate bij go-live | L2 | ☐ |

### 3.6 Wijzigingsbeheer

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| GOV-6.1 | Wijzigingsbeheerproces aanwezig | L1 | ☐ |
| GOV-6.2 | Security-impact assessment bij wijzigingen | L1 | ☐ |
| GOV-6.3 | Emergency change procedure | L1 | ☐ |

---

## 4. Normenkader Kruisverwijzingen

### ISO 27001:2022 Mapping

| ISO Control | Benchmark Recs | Level |
|-------------|----------------|-------|
| A.5.1 Policies for information security | GOV-1.1, GOV-1.2, GOV-1.3, GOV-1.4 | L1 |
| A.5.2 Information security roles | GOV-2.1, GOV-2.2 | L1 |
| A.5.3 Segregation of duties | GOV-2.3 | L1 |
| A.5.4 Management responsibilities | GOV-2.4 | L1 |
| A.5.5 Contact with authorities | GOV-3.1 | L1 |
| A.5.6 Contact with special interest groups | GOV-3.2 | L2 |
| A.5.8 Information security in project management | GOV-5.1 | L1 |
| A.5.12 Classification of information | GOV-4.1, GOV-4.2 | L1 |
| A.5.13 Labelling of information | GOV-4.3 | L2 |

### BIO2 Mapping

| BIO Maatregel | Benchmark Recs | Level |
|---------------|----------------|-------|
| B1.1 Informatiebeveiligingsbeleid | GOV-1.1, GOV-1.2, GOV-1.3 | L1 |
| B1.2 Onderliggend beleid | GOV-1.4 | L1 |
| B2.1 CISO/Security Officer | GOV-2.1 | L1 |
| B2.2 Verantwoordelijkheden | GOV-2.2 | L1 |
| B2.3 Functiescheiding | GOV-2.3 | L1 |
| B2.4 Management commitment | GOV-2.4 | L1 |
| B2.5 Contact autoriteiten | GOV-3.1 | L1 |
| B4.1 Classificatieschema | GOV-4.1 | L1 |
| B5.1 Project security | GOV-5.1 | L1 |

### NIS2 Mapping

| NIS2 Artikel | Benchmark Recs | Level |
|--------------|----------------|-------|
| Art. 20(1) Management accountability | GOV-2.1, GOV-2.4 | L1 |
| Art. 21(2)(a) Policies | GOV-1.1, GOV-1.2, GOV-4.1 | L1 |
| Art. 21(2)(i) HR security | GOV-2.3 | L1 |
| Art. 23 Reporting to authorities | GOV-3.1 | L1 |
| Art. 29 Information sharing | GOV-3.2 | L2 |

---

## 5. Evidence Vereisten

| Type Maatregel | Vereist Bewijs | Voorbeelden |
|----------------|----------------|-------------|
| **Beleid** | Goedgekeurd document | PDF met handtekening, besluitnotulen |
| **Rollen** | Functiebeschrijving, aanstelling | HR-document, organogram |
| **Proces** | Procedure + uitvoeringsrecords | Procedure.docx + tickets/notulen |
| **Classificatie** | Schema + CMDB-export | Beleid + asset-register |
| **Externe contacten** | Contactenlijst + correspondentie | Excel + e-mails |

---

## 6. Review Historie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-02-05 | CISO | Initiële versie |

---

## Bronnen

- [ISO 27001:2022](https://www.iso.org/standard/27001)
- [BIO2 - Baseline Informatiebeveiliging Overheid](https://bio-overheid.nl/)
- [NIS2 Directive](https://eur-lex.europa.eu/eli/dir/2022/2555)

---

## Gerelateerde Documenten

- [[Controls/EXT-O/_index|EXT-O Controls]]
- [[Documentatie/Taxonomie en Glossary|Taxonomie & Glossary]]
- [[Voorbeelden/_README|Gelaagd Assessment Model]]
