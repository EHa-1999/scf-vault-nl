---
id: "EXT-BM-HR-v1.0"
type: benchmark
benchmark_type: "EXT-Organizational"
name: "Extended Benchmark - Personele Beveiliging"
domain: "Human Resources Security"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "CISO / HR Manager"
ext_controls:
  - "EXT-HR"
sources:
  - "ISO 27001:2022 A.6.1-A.6.8"
  - "BIO2 B3"
  - "NIS2 Art. 21(2)(g)(i)"
  - "AVG Art. 32"
recommendations_count: 22
level_1_count: 16
level_2_count: 6
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - organizational
  - hr
  - personeel
---

# Extended Benchmark: Personele Beveiliging v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Domein** | Personele Beveiliging (Human Resources Security) |
| **Benchmark Versie** | v1.0 |
| **Status** | Active |
| **Eigenaar** | CISO / HR Manager |
| **Laatste Review** | 2026-02-10 |
| **Volgende Review** | 2027-02-10 |
| **Recommendations** | 22 (16 L1, 6 L2) |

## Navigatie

| ← Terug | Omhoog | Gerelateerde Controls |
|---------|--------|----------------------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Controls/EXT-HR/_index\|EXT-HR Controls]] |

---

## 1. Overzicht

### 1.1 Scope

Deze Extended Benchmark beschrijft auditeerbare maatregelen voor **Personele Beveiliging** — het geheel van maatregelen rondom de employee lifecycle: screening, arbeidsvoorwaarden, awareness, disciplinaire maatregelen en uitdiensttreding.

**Gerelateerde Extended Controls:**
- EXT-HR.1 Screening voor Indiensttreding
- EXT-HR.2 Arbeidsvoorwaarden en Condities
- EXT-HR.4 Disciplinaire Procedure
- EXT-HR.5 Beëindiging Dienstverband Beveiliging
- EXT-HR.6 Geheimhoudingsovereenkomsten
- EXT-HR.7 Security Awareness Training

### 1.2 Normenkader Mapping

| Normenkader | Sectie | Beschrijving |
|-------------|--------|--------------|
| **ISO 27001:2022** | A.6.1-A.6.8 | People controls |
| **BIO2** | B3 | Personele beveiliging |
| **NIS2** | Art. 21(2)(g)(i) | HR security, awareness |
| **AVG** | Art. 32 | Passende technische en organisatorische maatregelen |

### 1.3 Profiel Definities

| Profiel | Beschrijving | Doelgroep |
|---------|--------------|-----------|
| **Level 1** | Basismaatregelen, verplicht voor alle organisaties | Alle |
| **Level 2** | Uitgebreide maatregelen voor hoog-risico functies | BBN2+, kritieke functies |

---

## 2. Recommendations

### 2.1 Screening voor Indiensttreding

#### HR-1.1: Screeningprocedure gedocumenteerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.1 - Screening voor Indiensttreding\|EXT-HR.1]] |
| **ISO 27001** | A.6.1 |
| **BIO2** | B3.1 |

**Beschrijving:**
De organisatie heeft een gedocumenteerde screeningprocedure voor nieuwe medewerkers die beschrijft welke controles worden uitgevoerd afhankelijk van de functie en het risicoprofiel.

**Audit Procedure:**
1. Vraag de screeningprocedure of -richtlijn op
2. Controleer of risicoprofielen/functiecategorieën zijn gedefinieerd
3. Verifieer dat per categorie de vereiste controles zijn gespecificeerd

**Verwacht Bewijs:**
- [ ] Screeningprocedure of -beleid
- [ ] Risicocategorisering van functies
- [ ] Overzicht controles per categorie

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Procedure aanwezig, risicoprofielen gedefinieerd, controles gespecificeerd |
| ⚠️ Partial | Procedure aanwezig maar geen differentiatie naar risico |
| ❌ Non-Compliant | Geen gedocumenteerde screeningprocedure |

---

#### HR-1.2: Identiteitsverificatie uitgevoerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.1 - Screening voor Indiensttreding\|EXT-HR.1]] |
| **ISO 27001** | A.6.1 |
| **BIO2** | B3.1 |

**Beschrijving:**
Voor alle nieuwe medewerkers wordt de identiteit geverifieerd aan de hand van een geldig identiteitsbewijs voordat toegang wordt verleend tot systemen of informatie.

**Audit Procedure:**
1. Controleer of identiteitsverificatie in de procedure staat
2. Steekproef: vraag kopieën ID of verificatierecords op voor recente medewerkers
3. Verifieer dat verificatie plaatsvindt vóór eerste werkdag of systeemtoegang

**Verwacht Bewijs:**
- [ ] Procedure die identiteitsverificatie voorschrijft
- [ ] Kopie ID in personeelsdossier OF verificatierecord
- [ ] Bewijs dat dit vóór toegangsverlening gebeurt

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Identiteitsverificatie structureel, vóór toegang, gedocumenteerd |
| ⚠️ Partial | Verificatie vindt plaats maar niet altijd vóór toegang |
| ❌ Non-Compliant | Geen structurele identiteitsverificatie |

---

#### HR-1.3: Diploma- en referentiecontrole

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.1 - Screening voor Indiensttreding\|EXT-HR.1]] |
| **ISO 27001** | A.6.1 |
| **BIO2** | B3.1 |

**Beschrijving:**
Voor functies waar specifieke kwalificaties vereist zijn, worden diploma's geverifieerd. Voor functies met verhoogd risico worden referenties gecontroleerd.

**Audit Procedure:**
1. Controleer of diploma-/referentiecontrole in procedure staat
2. Steekproef: vraag verificatierecords voor functies met kwalificatie-eis
3. Controleer of dit wordt vastgelegd in personeelsdossier

**Verwacht Bewijs:**
- [ ] Procedure met diploma-/referentiecontrole
- [ ] Verificatierecords in personeelsdossiers (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Controles uitgevoerd voor relevante functies, vastgelegd |
| ⚠️ Partial | Controles soms uitgevoerd, niet structureel |
| ❌ Non-Compliant | Geen diploma-/referentiecontroles |

---

#### HR-1.4: VOG voor vertrouwensfuncties

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.1 - Screening voor Indiensttreding\|EXT-HR.1]] |
| **ISO 27001** | A.6.1 |
| **BIO2** | B3.1 |

**Beschrijving:**
Voor vertrouwensfuncties (toegang tot gevoelige informatie, financiële systemen, kritieke infrastructuur) wordt een Verklaring Omtrent het Gedrag (VOG) gevraagd.

**Audit Procedure:**
1. Controleer of vertrouwensfuncties zijn gedefinieerd
2. Controleer of VOG-eis in procedure staat voor deze functies
3. Steekproef: verifieer aanwezigheid VOG in dossiers van vertrouwensfuncties

**Verwacht Bewijs:**
- [ ] Definitie vertrouwensfuncties
- [ ] Procedure met VOG-eis
- [ ] VOG-kopieën in personeelsdossiers (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Vertrouwensfuncties gedefinieerd, VOG structureel gevraagd |
| ⚠️ Partial | VOG gevraagd maar niet voor alle vertrouwensfuncties |
| ❌ Non-Compliant | Geen VOG-beleid of -uitvoering |

---

#### HR-1.5: Periodieke herscreening

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.1 - Screening voor Indiensttreding\|EXT-HR.1]] |
| **ISO 27001** | A.6.1 |
| **BIO2** | B3.1 |

**Beschrijving:**
Voor hoog-risico functies vindt periodieke herscreening plaats (bijv. nieuwe VOG elke 3-5 jaar) om te waarborgen dat medewerkers geschikt blijven.

**Audit Procedure:**
1. Controleer of herscreeningbeleid bestaat
2. Controleer of frequentie is gedefinieerd per risicocategorie
3. Steekproef: verifieer of herscreening is uitgevoerd

**Verwacht Bewijs:**
- [ ] Herscreeningbeleid met frequentie
- [ ] Registratie van uitgevoerde herscreenings

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Herscreeningbeleid actief, aantoonbaar uitgevoerd |
| ⚠️ Partial | Beleid aanwezig maar niet consequent uitgevoerd |
| ❌ Non-Compliant | Geen herscreeningbeleid |

---

### 2.2 Arbeidsvoorwaarden

#### HR-2.1: Beveiligingsverantwoordelijkheden in arbeidsovereenkomst

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.2 - Arbeidsvoorwaarden en Condities\|EXT-HR.2]] |
| **ISO 27001** | A.6.2 |
| **BIO2** | B3.2 |

**Beschrijving:**
Arbeidsovereenkomsten bevatten clausules over beveiligingsverantwoordelijkheden, geheimhouding en consequenties bij niet-naleving.

**Audit Procedure:**
1. Vraag standaard arbeidsovereenkomst of -template op
2. Controleer aanwezigheid beveiligingsclausules
3. Steekproef: verifieer dat getekende overeenkomsten de clausules bevatten

**Verwacht Bewijs:**
- [ ] Arbeidsovereenkomst template met beveiligingsclausules
- [ ] Getekende overeenkomsten (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Beveiligingsclausules standaard in alle arbeidsovereenkomsten |
| ⚠️ Partial | Clausules in sommige overeenkomsten, niet standaard |
| ❌ Non-Compliant | Geen beveiligingsclausules in arbeidsovereenkomsten |

---

#### HR-2.2: Acceptable Use Policy ondertekend

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.2 - Arbeidsvoorwaarden en Condities\|EXT-HR.2]] |
| **ISO 27001** | A.6.2, A.5.10 |
| **BIO2** | B3.2 |

**Beschrijving:**
Alle medewerkers ondertekenen een Acceptable Use Policy (AUP) of gedragscode voor ICT-gebruik bij indiensttreding.

**Audit Procedure:**
1. Vraag de AUP of ICT-gedragscode op
2. Controleer of ondertekening verplicht is bij indiensttreding
3. Steekproef: verifieer getekende AUP's in personeelsdossiers

**Verwacht Bewijs:**
- [ ] AUP of ICT-gedragscode document
- [ ] Getekende AUP's (steekproef)
- [ ] Proces voor ondertekening bij indiensttreding

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | AUP aanwezig, structureel ondertekend, vastgelegd |
| ⚠️ Partial | AUP aanwezig maar niet door alle medewerkers getekend |
| ❌ Non-Compliant | Geen AUP of ondertekeningsproces |

---

### 2.3 Geheimhouding

#### HR-3.1: NDA voor medewerkers

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.6 - Geheimhoudingsovereenkomsten\|EXT-HR.6]] |
| **ISO 27001** | A.6.6 |
| **BIO2** | B2.6 |

**Beschrijving:**
Alle medewerkers met toegang tot vertrouwelijke informatie ondertekenen een geheimhoudingsovereenkomst (NDA) die ook na uitdiensttreding van kracht blijft.

**Audit Procedure:**
1. Vraag standaard NDA-template op
2. Controleer of NDA post-employment clausule bevat
3. Steekproef: verifieer getekende NDA's

**Verwacht Bewijs:**
- [ ] NDA-template met post-employment clausule
- [ ] Getekende NDA's (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | NDA standaard, met post-employment, structureel getekend |
| ⚠️ Partial | NDA aanwezig maar niet door alle relevante medewerkers getekend |
| ❌ Non-Compliant | Geen NDA of geheimhoudingsclausule |

---

#### HR-3.2: NDA voor externe partijen

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.6 - Geheimhoudingsovereenkomsten\|EXT-HR.6]] |
| **ISO 27001** | A.6.6 |
| **BIO2** | B2.6 |

**Beschrijving:**
Externe partijen (inhuurkrachten, leveranciers, consultants) met toegang tot vertrouwelijke informatie ondertekenen een NDA voordat toegang wordt verleend.

**Audit Procedure:**
1. Controleer of NDA-vereiste voor externen in beleid staat
2. Steekproef: verifieer NDA's voor actieve externe partijen
3. Controleer of NDA vóór toegangsverlening wordt getekend

**Verwacht Bewijs:**
- [ ] Beleid met NDA-eis voor externen
- [ ] Getekende NDA's voor externe partijen (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | NDA structureel voor alle externen, vóór toegang |
| ⚠️ Partial | NDA voor sommige externen, niet consequent |
| ❌ Non-Compliant | Geen NDA-beleid voor externen |

---

### 2.4 Security Awareness

#### HR-4.1: Awareness programma aanwezig

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.7 - Security Awareness Training\|EXT-HR.7]] |
| **ISO 27001** | A.6.3 |
| **BIO2** | B3.3 |
| **NIS2** | Art. 21(2)(g) |

**Beschrijving:**
De organisatie heeft een security awareness programma dat alle medewerkers bereikt met informatie over beveiligingsrisico's, beleid en hun verantwoordelijkheden.

**Audit Procedure:**
1. Vraag het awareness programma/plan op
2. Controleer of doelgroep, onderwerpen en frequentie zijn gedefinieerd
3. Verifieer dat het programma actief wordt uitgevoerd

**Verwacht Bewijs:**
- [ ] Awareness programma of -plan
- [ ] Overzicht van awareness activiteiten afgelopen jaar
- [ ] Bereik (welk percentage medewerkers)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Programma aanwezig, actief uitgevoerd, breed bereik |
| ⚠️ Partial | Ad-hoc awareness activiteiten, geen structureel programma |
| ❌ Non-Compliant | Geen awareness activiteiten |

---

#### HR-4.2: Onboarding awareness training

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.7 - Security Awareness Training\|EXT-HR.7]] |
| **ISO 27001** | A.6.3 |
| **BIO2** | B3.3 |
| **NIS2** | Art. 21(2)(g) |

**Beschrijving:**
Alle nieuwe medewerkers ontvangen security awareness training als onderdeel van het onboarding-proces, binnen de eerste maand na indiensttreding.

**Audit Procedure:**
1. Controleer of onboarding awareness in procedure staat
2. Vraag trainingsmateriaal op
3. Steekproef: verifieer trainingsrecords voor recent gestarte medewerkers

**Verwacht Bewijs:**
- [ ] Onboarding procedure met awareness training
- [ ] Trainingsmateriaal
- [ ] Trainingsrecords (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Alle nieuwe medewerkers getraind binnen eerste maand |
| ⚠️ Partial | Training aangeboden maar niet alle nieuwe medewerkers bereikt |
| ❌ Non-Compliant | Geen onboarding awareness training |

---

#### HR-4.3: Periodieke awareness training

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.7 - Security Awareness Training\|EXT-HR.7]] |
| **ISO 27001** | A.6.3 |
| **BIO2** | B3.3 |
| **NIS2** | Art. 21(2)(g) |

**Beschrijving:**
Alle medewerkers ontvangen minimaal jaarlijks een security awareness training of -update om kennis actueel te houden.

**Audit Procedure:**
1. Controleer of jaarlijkse training in programma staat
2. Vraag trainingsrecords van afgelopen jaar op
3. Bereken deelnemingspercentage

**Verwacht Bewijs:**
- [ ] Awareness programma met jaarlijkse frequentie
- [ ] Trainingsrecords afgelopen jaar
- [ ] Deelnemingspercentage

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | ≥90% medewerkers jaarlijks getraind |
| ⚠️ Partial | 70-90% medewerkers getraind |
| ❌ Non-Compliant | <70% medewerkers getraind of geen jaarlijkse training |

---

#### HR-4.4: Phishing simulaties

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.7 - Security Awareness Training\|EXT-HR.7]] |
| **ISO 27001** | A.6.3 |
| **BIO2** | B3.3 |

**Beschrijving:**
De organisatie voert periodiek phishing simulaties uit om de weerbaarheid van medewerkers te testen en gerichte training aan te bieden.

**Audit Procedure:**
1. Controleer of phishing simulaties in programma staan
2. Vraag resultaten van recente simulaties op
3. Controleer of follow-up training wordt gegeven aan "klikkers"

**Verwacht Bewijs:**
- [ ] Phishing simulatie programma
- [ ] Resultaten van simulaties (click rates, rapportage rates)
- [ ] Follow-up acties voor medewerkers die faalden

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Regelmatige simulaties, resultaten geanalyseerd, follow-up |
| ⚠️ Partial | Incidentele simulaties, beperkte opvolging |
| ❌ Non-Compliant | Geen phishing simulaties |

---

#### HR-4.5: Rol-specifieke security training

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.7 - Security Awareness Training\|EXT-HR.7]] |
| **ISO 27001** | A.6.3 |
| **BIO2** | B3.3 |

**Beschrijving:**
Medewerkers in specifieke rollen (IT-beheerders, developers, management) ontvangen aanvullende, rol-specifieke security training.

**Audit Procedure:**
1. Controleer of rol-specifieke trainingen zijn gedefinieerd
2. Vraag trainingsrecords per rol op
3. Verifieer dat trainingen actueel en relevant zijn

**Verwacht Bewijs:**
- [ ] Overzicht rol-specifieke trainingen
- [ ] Trainingsrecords per doelgroep

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Rol-specifieke trainingen voor key rollen, aantoonbaar gevolgd |
| ⚠️ Partial | Sommige rol-specifieke trainingen, niet compleet |
| ❌ Non-Compliant | Geen rol-specifieke trainingen |

---

### 2.5 Disciplinaire Maatregelen

#### HR-5.1: Disciplinaire procedure gedocumenteerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.4 - Disciplinaire Procedure\|EXT-HR.4]] |
| **ISO 27001** | A.6.4 |
| **BIO2** | B3.4 |

**Beschrijving:**
De organisatie heeft een gedocumenteerde disciplinaire procedure voor beveiligingsovertredingen die beschrijft welke maatregelen bij welke overtredingen passen.

**Audit Procedure:**
1. Vraag de disciplinaire procedure op
2. Controleer of beveiligingsovertredingen expliciet zijn opgenomen
3. Verifieer dat maatregelen proportioneel zijn gedefinieerd

**Verwacht Bewijs:**
- [ ] Disciplinaire procedure/beleid
- [ ] Expliciete opname beveiligingsovertredingen
- [ ] Escalatieladder maatregelen

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Procedure aanwezig, security-specifiek, proportioneel |
| ⚠️ Partial | Algemene disciplinaire procedure zonder security-focus |
| ❌ Non-Compliant | Geen gedocumenteerde disciplinaire procedure |

---

#### HR-5.2: Procedure gecommuniceerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.4 - Disciplinaire Procedure\|EXT-HR.4]] |
| **ISO 27001** | A.6.4 |
| **BIO2** | B3.4 |

**Beschrijving:**
De disciplinaire procedure is gecommuniceerd naar alle medewerkers zodat zij op de hoogte zijn van de consequenties van beveiligingsovertredingen.

**Audit Procedure:**
1. Controleer hoe de procedure is gecommuniceerd
2. Verifieer dat dit onderdeel is van onboarding
3. Steekproef: vraag medewerkers of zij op de hoogte zijn

**Verwacht Bewijs:**
- [ ] Communicatierecord (intranet, e-mail, training)
- [ ] Onderdeel van onboarding checklist

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Procedure gecommuniceerd, onderdeel onboarding |
| ⚠️ Partial | Procedure beschikbaar maar niet actief gecommuniceerd |
| ❌ Non-Compliant | Procedure niet gecommuniceerd |

---

### 2.6 Uitdiensttreding

#### HR-6.1: Offboarding procedure gedocumenteerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.5 - Beëindiging Dienstverband Beveiliging\|EXT-HR.5]] |
| **ISO 27001** | A.6.5 |
| **BIO2** | B3.5 |

**Beschrijving:**
De organisatie heeft een gedocumenteerde offboarding procedure die alle security-relevante stappen bevat bij beëindiging van een dienstverband.

**Audit Procedure:**
1. Vraag de offboarding procedure of checklist op
2. Controleer of alle security-relevante stappen zijn opgenomen
3. Verifieer dat de procedure wordt gevolgd (steekproef)

**Verwacht Bewijs:**
- [ ] Offboarding procedure of checklist
- [ ] Ingevulde checklists voor recent vertrokken medewerkers (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Procedure aanwezig, compleet, aantoonbaar gevolgd |
| ⚠️ Partial | Procedure aanwezig maar incompleet of niet consistent gevolgd |
| ❌ Non-Compliant | Geen offboarding procedure |

---

#### HR-6.2: Toegang tijdig ingetrokken

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.5 - Beëindiging Dienstverband Beveiliging\|EXT-HR.5]] |
| **ISO 27001** | A.6.5 |
| **BIO2** | B3.5 |

**Beschrijving:**
Alle fysieke en logische toegangsrechten worden ingetrokken op of vóór de laatste werkdag. Bij onvrijwillig vertrek gebeurt dit onmiddellijk.

**Audit Procedure:**
1. Controleer of tijdlijn voor toegangsintrekking in procedure staat
2. Steekproef: vergelijk vertrekdata met deactivatiedata in IAM-systeem
3. Controleer procedure voor onvrijwillig vertrek

**Verwacht Bewijs:**
- [ ] Procedure met tijdlijnen
- [ ] IAM-logs met deactivatiedata (steekproef)
- [ ] Procedure onvrijwillig vertrek

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Toegang structureel op/vóór vertrekdatum ingetrokken |
| ⚠️ Partial | Meestal tijdig, incidenteel vertraging |
| ❌ Non-Compliant | Structurele vertraging in toegangsintrekking |

---

#### HR-6.3: Bedrijfsmiddelen geretourneerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.5 - Beëindiging Dienstverband Beveiliging\|EXT-HR.5]] |
| **ISO 27001** | A.6.5, A.7.10 |
| **BIO2** | B3.5 |

**Beschrijving:**
Alle bedrijfsmiddelen (laptop, telefoon, tokens, badges, documenten) worden geretourneerd bij uitdiensttreding en dit wordt geregistreerd.

**Audit Procedure:**
1. Controleer of retourprocedure in offboarding staat
2. Controleer of een asset-register of -checklist wordt gebruikt
3. Steekproef: verifieer retourrecords voor vertrokken medewerkers

**Verwacht Bewijs:**
- [ ] Retourprocedure in offboarding
- [ ] Asset-checklist of -register
- [ ] Retourrecords (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Retourprocedure actief, geregistreerd, compleet |
| ⚠️ Partial | Retour meestal geregistreerd, incidenteel incompleet |
| ❌ Non-Compliant | Geen structurele retourregistratie |

---

#### HR-6.4: Exit-interview met security component

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **EXT Control** | [[Controls/EXT-HR/EXT-HR.5 - Beëindiging Dienstverband Beveiliging\|EXT-HR.5]] |
| **ISO 27001** | A.6.5 |
| **BIO2** | B3.5 |

**Beschrijving:**
Bij exit-interviews wordt aandacht besteed aan security-aspecten: herinnering aan geheimhoudingsplicht, eventuele zorgen of observaties van de vertrekkende medewerker.

**Audit Procedure:**
1. Controleer of exit-interview procedure security-vragen bevat
2. Steekproef: verifieer dat security aan bod komt in exit-interviews

**Verwacht Bewijs:**
- [ ] Exit-interview template met security-vragen
- [ ] Exit-interview records (steekproef)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Security structureel onderdeel van exit-interviews |
| ⚠️ Partial | Exit-interviews zonder security-focus |
| ❌ Non-Compliant | Geen exit-interviews of security-aandacht |

---

## 3. Complete Recommendations Checklist

### 3.1 Screening

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| HR-1.1 | Screeningprocedure gedocumenteerd | L1 | ☐ |
| HR-1.2 | Identiteitsverificatie uitgevoerd | L1 | ☐ |
| HR-1.3 | Diploma- en referentiecontrole | L1 | ☐ |
| HR-1.4 | VOG voor vertrouwensfuncties | L1 | ☐ |
| HR-1.5 | Periodieke herscreening | L2 | ☐ |

### 3.2 Arbeidsvoorwaarden

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| HR-2.1 | Beveiligingsverantwoordelijkheden in arbeidsovereenkomst | L1 | ☐ |
| HR-2.2 | Acceptable Use Policy ondertekend | L1 | ☐ |

### 3.3 Geheimhouding

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| HR-3.1 | NDA voor medewerkers | L1 | ☐ |
| HR-3.2 | NDA voor externe partijen | L1 | ☐ |

### 3.4 Security Awareness

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| HR-4.1 | Awareness programma aanwezig | L1 | ☐ |
| HR-4.2 | Onboarding awareness training | L1 | ☐ |
| HR-4.3 | Periodieke awareness training | L1 | ☐ |
| HR-4.4 | Phishing simulaties | L2 | ☐ |
| HR-4.5 | Rol-specifieke security training | L2 | ☐ |

### 3.5 Disciplinaire Maatregelen

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| HR-5.1 | Disciplinaire procedure gedocumenteerd | L1 | ☐ |
| HR-5.2 | Procedure gecommuniceerd | L1 | ☐ |

### 3.6 Uitdiensttreding

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| HR-6.1 | Offboarding procedure gedocumenteerd | L1 | ☐ |
| HR-6.2 | Toegang tijdig ingetrokken | L1 | ☐ |
| HR-6.3 | Bedrijfsmiddelen geretourneerd | L1 | ☐ |
| HR-6.4 | Exit-interview met security component | L2 | ☐ |

---

## 4. Normenkader Kruisverwijzingen

### ISO 27001:2022 Mapping

| ISO Control | Benchmark Recs | Level |
|-------------|----------------|-------|
| A.6.1 Screening | HR-1.1, HR-1.2, HR-1.3, HR-1.4, HR-1.5 | L1/L2 |
| A.6.2 Terms and conditions | HR-2.1, HR-2.2 | L1 |
| A.6.3 Awareness, education and training | HR-4.1, HR-4.2, HR-4.3, HR-4.4, HR-4.5 | L1/L2 |
| A.6.4 Disciplinary process | HR-5.1, HR-5.2 | L1 |
| A.6.5 Responsibilities after termination | HR-6.1, HR-6.2, HR-6.3, HR-6.4 | L1/L2 |
| A.6.6 Confidentiality agreements | HR-3.1, HR-3.2 | L1 |

### BIO2 Mapping

| BIO Maatregel | Benchmark Recs | Level |
|---------------|----------------|-------|
| B3.1 Screening | HR-1.1, HR-1.2, HR-1.3, HR-1.4 | L1 |
| B3.2 Arbeidsvoorwaarden | HR-2.1, HR-2.2 | L1 |
| B3.3 Awareness | HR-4.1, HR-4.2, HR-4.3 | L1 |
| B3.4 Disciplinair | HR-5.1, HR-5.2 | L1 |
| B3.5 Beëindiging | HR-6.1, HR-6.2, HR-6.3 | L1 |
| B2.6 Geheimhouding | HR-3.1, HR-3.2 | L1 |

### NIS2 Mapping

| NIS2 Artikel | Benchmark Recs | Level |
|--------------|----------------|-------|
| Art. 21(2)(g) Cybersecurity training | HR-4.1, HR-4.2, HR-4.3 | L1 |
| Art. 21(2)(i) HR security | HR-1.1, HR-6.1, HR-6.2 | L1 |

---

## 5. Evidence Vereisten

| Type Maatregel | Vereist Bewijs | Voorbeelden |
|----------------|----------------|-------------|
| **Procedure** | Goedgekeurd document | PDF procedure, workflow |
| **Training** | Materiaal + deelnemerslijst | Slides, LMS-export, certificaten |
| **Overeenkomst** | Getekend document | NDA, arbeidsovereenkomst, AUP |
| **Screening** | Verificatierecords | VOG-kopie, diplomacheck |
| **Offboarding** | Checklist + IAM-logs | Ingevulde checklist, deactivatie-export |

---

## 6. Review Historie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-02-10 | CISO | Initiële versie |

---

## Bronnen

- [ISO 27001:2022 Annex A.6](https://www.iso.org/standard/27001)
- [BIO2 Hoofdstuk B3](https://bio-overheid.nl/)
- [NIS2 Directive Art. 21](https://eur-lex.europa.eu/eli/dir/2022/2555)

---

## Gerelateerde Documenten

- [[Controls/EXT-HR/_index|EXT-HR Controls]]
- [[Benchmarks/EXT/EXT-BM-Governance-v1.0|EXT-BM-Governance]] — Governance benchmark
- [[Documentatie/Taxonomie en Glossary|Taxonomie & Glossary]]
