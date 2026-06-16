---
id: "EXT-BM-Physical-v1.0"
type: benchmark
benchmark_type: "EXT-Organizational"
name: "Extended Benchmark - Fysieke Beveiliging"
domain: "Physical Security"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "CISO / Facility Manager"
ext_controls:
  - "EXT-PHY"
sources:
  - "ISO 27001:2022 A.7.1-A.7.14"
  - "BIO2 B7"
  - "NEN 7510-2"
recommendations_count: 28
level_1_count: 20
level_2_count: 8
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - organizational
  - physical
  - fysiek
---

# Extended Benchmark: Fysieke Beveiliging v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Domein** | Fysieke Beveiliging (Physical Security) |
| **Benchmark Versie** | v1.0 |
| **Status** | Active |
| **Eigenaar** | CISO / Facility Manager |
| **Laatste Review** | 2026-02-10 |
| **Volgende Review** | 2027-02-10 |
| **Recommendations** | 28 (20 L1, 8 L2) |

## Navigatie

| ← Terug | Omhoog | Gerelateerde Controls |
|---------|--------|----------------------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Controls/EXT-PHY/_index\|EXT-PHY Controls]] |

---

## 1. Overzicht

### 1.1 Scope

Deze Extended Benchmark beschrijft auditeerbare maatregelen voor **Fysieke Beveiliging** — de bescherming van gebouwen, ruimtes, apparatuur en informatiedragers tegen ongeautoriseerde fysieke toegang, schade en verstoring.

**Gerelateerde Extended Controls:**
- EXT-PHY.1 t/m EXT-PHY.13 (Perimeters, Toegang, Faciliteiten, Monitoring, Apparatuur)

### 1.2 Normenkader Mapping

| Normenkader | Sectie | Beschrijving |
|-------------|--------|--------------|
| **ISO 27001:2022** | A.7.1-A.7.14 | Physical controls |
| **BIO2** | B7 | Fysieke beveiliging |
| **NEN 7510-2** | 7 | Fysieke beheersmaatregelen (zorg) |

### 1.3 Profiel Definities

| Profiel | Beschrijving | Doelgroep |
|---------|--------------|-----------|
| **Level 1** | Basismaatregelen voor kantooromgevingen | Alle locaties |
| **Level 2** | Uitgebreide maatregelen voor datacenters en kritieke ruimtes | Serverruimtes, BBN2+ |

---

## 2. Recommendations

### 2.1 Beveiligingsperimeters

#### PHY-1.1: Beveiligingszones gedefinieerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.1 - Fysieke Beveiligingsperimeters\|EXT-PHY.1]] |
| **ISO 27001** | A.7.1 |
| **BIO2** | B7.1 |

**Beschrijving:**
De organisatie heeft beveiligingszones gedefinieerd met oplopende beveiligingsniveaus (publiek → kantoor → beveiligd → hoog-beveiligd) en deze gedocumenteerd in een zonering-overzicht.

**Audit Procedure:**
1. Vraag het zonering-overzicht of beveiligingsplan op
2. Controleer of zones zijn gedefinieerd met beveiligingsniveaus
3. Verifieer dat kritieke assets in passende zones zijn geplaatst

**Verwacht Bewijs:**
- [ ] Zonering-overzicht of beveiligingsplan
- [ ] Plattegrond met zones gemarkeerd
- [ ] Classificatie per zone

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Zones gedefinieerd, gedocumenteerd, actueel |
| ⚠️ Partial | Informele zonering, niet gedocumenteerd |
| ❌ Non-Compliant | Geen zonering gedefinieerd |

---

#### PHY-1.2: Fysieke barrières aanwezig

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.1 - Fysieke Beveiligingsperimeters\|EXT-PHY.1]] |
| **ISO 27001** | A.7.1 |
| **BIO2** | B7.1 |

**Beschrijving:**
Beveiligingszones zijn afgeschermd met fysieke barrières (muren, deuren, hekken) die passen bij het beveiligingsniveau van de zone.

**Audit Procedure:**
1. Inspecteer fysieke barrières ter plaatse
2. Controleer of barrières compleet zijn (geen openingen)
3. Verifieer dat barrières passen bij het zone-niveau

**Verwacht Bewijs:**
- [ ] Fysieke inspectie barrières
- [ ] Foto's of inspectierapport
- [ ] Onderhoudsstatus barrières

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Barrières compleet, passend bij zone-niveau |
| ⚠️ Partial | Barrières aanwezig maar niet overal compleet |
| ❌ Non-Compliant | Onvoldoende fysieke barrières |

---

### 2.2 Toegangscontrole

#### PHY-2.1: Toegangscontrolesysteem actief

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.2 - Fysieke Toegangscontrole\|EXT-PHY.2]] |
| **ISO 27001** | A.7.2 |
| **BIO2** | B7.2 |

**Beschrijving:**
Beveiligde zones zijn voorzien van een toegangscontrolesysteem (badges, sleutels, biometrie) dat toegang beperkt tot geautoriseerde personen.

**Audit Procedure:**
1. Inventariseer toegangscontrolesystemen per zone
2. Controleer of alle beveiligde zones zijn afgedekt
3. Test of systeem functioneert (toegang verlenen/weigeren)

**Verwacht Bewijs:**
- [ ] Overzicht toegangscontrolesystemen
- [ ] Functioneringstest resultaten
- [ ] Onderhoudscontract systemen

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Alle beveiligde zones met werkend toegangssysteem |
| ⚠️ Partial | Sommige zones zonder toegangscontrole |
| ❌ Non-Compliant | Geen of niet-werkend toegangssysteem |

---

#### PHY-2.2: Toegangsregistratie actief

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.2 - Fysieke Toegangscontrole\|EXT-PHY.2]] |
| **ISO 27001** | A.7.2 |
| **BIO2** | B7.2 |

**Beschrijving:**
Toegang tot beveiligde zones wordt geregistreerd (wie, wanneer, welke zone) en logs worden minimaal 90 dagen bewaard.

**Audit Procedure:**
1. Vraag toegangslogs op voor beveiligde zones
2. Controleer of logs wie/wanneer/waar bevatten
3. Verifieer bewaartermijn van minimaal 90 dagen

**Verwacht Bewijs:**
- [ ] Voorbeeld toegangslogs
- [ ] Bewaartermijn configuratie
- [ ] Log-export mogelijkheid

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Logs compleet, ≥90 dagen bewaard, opvraagbaar |
| ⚠️ Partial | Logs aanwezig maar incompleet of te korte bewaartermijn |
| ❌ Non-Compliant | Geen toegangsregistratie |

---

#### PHY-2.3: Bezoekerregistratie en -begeleiding

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.2 - Fysieke Toegangscontrole\|EXT-PHY.2]] |
| **ISO 27001** | A.7.2 |
| **BIO2** | B7.2 |

**Beschrijving:**
Bezoekers worden geregistreerd, ontvangen een bezoekersbadge en worden begeleid in beveiligde zones.

**Audit Procedure:**
1. Controleer bezoekerregistratieprocedure
2. Vraag bezoekerslogboek op
3. Controleer of bezoekersbadges worden uitgegeven
4. Verifieer begeleidingsbeleid voor beveiligde zones

**Verwacht Bewijs:**
- [ ] Bezoekerregistratieprocedure
- [ ] Bezoekerslogboek (steekproef)
- [ ] Bezoekersbadges aanwezig
- [ ] Begeleidingsbeleid

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Registratie, badges, begeleiding structureel |
| ⚠️ Partial | Registratie aanwezig maar begeleiding inconsistent |
| ❌ Non-Compliant | Geen bezoekerregistratie of -controle |

---

#### PHY-2.4: Toegangsrechten periodiek gereviewd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.2 - Fysieke Toegangscontrole\|EXT-PHY.2]] |
| **ISO 27001** | A.7.2 |
| **BIO2** | B7.2 |

**Beschrijving:**
Fysieke toegangsrechten worden minimaal jaarlijks gereviewd om te verifiëren dat alleen geautoriseerde personen toegang hebben.

**Audit Procedure:**
1. Vraag bewijs van laatste toegangsrechten-review op
2. Controleer of review alle zones dekt
3. Verifieer dat wijzigingen zijn doorgevoerd

**Verwacht Bewijs:**
- [ ] Review rapport of notulen
- [ ] Lijst van doorgevoerde wijzigingen
- [ ] Datum laatste review

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Review afgelopen 12 maanden, wijzigingen doorgevoerd |
| ⚠️ Partial | Review 12-18 maanden geleden of incompleet |
| ❌ Non-Compliant | Geen review afgelopen 18 maanden |

---

### 2.3 Beveiligde Ruimtes

#### PHY-3.1: Serverruimte fysiek beveiligd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.3 - Faciliteitenbeveiliging\|EXT-PHY.3]] |
| **ISO 27001** | A.7.3 |
| **BIO2** | B7.3 |

**Beschrijving:**
Serverruimtes en datacenters zijn voorzien van versterkte toegangscontrole (minimaal badge + PIN of biometrie) en zijn niet toegankelijk voor ongeautoriseerde personen.

**Audit Procedure:**
1. Inspecteer fysieke beveiliging serverruimte
2. Controleer toegangscontrolemechanisme
3. Verifieer dat alleen IT-personeel toegang heeft

**Verwacht Bewijs:**
- [ ] Toegangscontrolesysteem serverruimte
- [ ] Lijst geautoriseerde personen
- [ ] Inspectieresultaten

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Versterkte toegang, beperkte autorisatielijst |
| ⚠️ Partial | Toegangscontrole aanwezig maar te ruime autorisatie |
| ❌ Non-Compliant | Onvoldoende beveiliging serverruimte |

---

#### PHY-3.2: Klimaatbeheersing kritieke ruimtes

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.3 - Faciliteitenbeveiliging\|EXT-PHY.3]] |
| **ISO 27001** | A.7.3 |
| **BIO2** | B7.3 |

**Beschrijving:**
Serverruimtes en technische ruimtes zijn voorzien van klimaatbeheersing (airco, ventilatie) met monitoring en alarmering bij overschrijding van temperatuur/vochtigheid.

**Audit Procedure:**
1. Controleer aanwezigheid klimaatsysteem
2. Verifieer monitoring en alarmeringsinstellingen
3. Vraag onderhoudsrecords op

**Verwacht Bewijs:**
- [ ] Klimaatsysteem aanwezig
- [ ] Monitoring configuratie
- [ ] Alarmering instellingen
- [ ] Onderhoudsrecords

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Klimaatsysteem met monitoring en alarmering |
| ⚠️ Partial | Klimaatsysteem aanwezig maar geen monitoring |
| ❌ Non-Compliant | Geen klimaatbeheersing |

---

### 2.4 Monitoring

#### PHY-4.1: Camerabewaking aanwezig

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.4 - Fysieke Beveiligingsmonitoring\|EXT-PHY.4]] |
| **ISO 27001** | A.7.4 |
| **BIO2** | — |

**Beschrijving:**
Kritieke toegangspunten en beveiligde zones zijn voorzien van camerabewaking met opname-mogelijkheid.

**Audit Procedure:**
1. Inventariseer cameradekking
2. Controleer opnamecapaciteit en bewaartermijn
3. Test beeldkwaliteit

**Verwacht Bewijs:**
- [ ] Camera-overzicht met posities
- [ ] Opname-instellingen
- [ ] Bewaartermijn configuratie

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Camera's op kritieke punten, opname ≥7 dagen |
| ⚠️ Partial | Beperkte dekking of korte bewaartermijn |
| ❌ Non-Compliant | Geen camerabewaking |

---

#### PHY-4.2: Inbraakdetectie actief

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.4 - Fysieke Beveiligingsmonitoring\|EXT-PHY.4]] |
| **ISO 27001** | A.7.4 |
| **BIO2** | — |

**Beschrijving:**
Beveiligde zones zijn voorzien van inbraakdetectie (bewegingsmelders, deur-/raamcontacten) die doormeldt naar een alarmcentrale of beveiligingsdienst.

**Audit Procedure:**
1. Controleer aanwezigheid inbraakdetectiesysteem
2. Verifieer doormelding naar centrale/dienst
3. Test alarmsysteem functioneren

**Verwacht Bewijs:**
- [ ] Inbraakdetectiesysteem configuratie
- [ ] Doormelding contract/instellingen
- [ ] Testresultaten

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Inbraakdetectie actief met doormelding |
| ⚠️ Partial | Inbraakdetectie zonder doormelding |
| ❌ Non-Compliant | Geen inbraakdetectie |

---

### 2.5 Omgevingsbescherming

#### PHY-5.1: Branddetectie en -bestrijding

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.5 - Omgevingsdreigingen Bescherming\|EXT-PHY.5]] |
| **ISO 27001** | A.7.5 |
| **BIO2** | B7.4 |

**Beschrijving:**
Alle ruimtes zijn voorzien van rookmelders en brandblusapparatuur. Serverruimtes hebben aanvullend automatische blusinstallaties en rookmelding met doormelding.

**Audit Procedure:**
1. Controleer aanwezigheid rookmelders en blussers
2. Verifieer keuring en onderhoudsrecords
3. Controleer automatische installaties in serverruimtes

**Verwacht Bewijs:**
- [ ] Inventaris brandveiligheidsvoorzieningen
- [ ] Keuringsrapporten
- [ ] Onderhoudsrecords

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Brandbeveiliging compleet, keuringen actueel |
| ⚠️ Partial | Basisvoorzieningen maar keuringen verlopen |
| ❌ Non-Compliant | Onvoldoende brandbeveiliging |

---

#### PHY-5.2: Waterdetectie in technische ruimtes

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.5 - Omgevingsdreigingen Bescherming\|EXT-PHY.5]] |
| **ISO 27001** | A.7.5 |
| **BIO2** | B7.4 |

**Beschrijving:**
Serverruimtes en technische ruimtes zijn voorzien van waterdetectie die alarmeert bij lekkage.

**Audit Procedure:**
1. Controleer aanwezigheid watersensoren
2. Verifieer alarmering configuratie
3. Test detectiesysteem

**Verwacht Bewijs:**
- [ ] Watersensoren geïnstalleerd
- [ ] Alarmering configuratie
- [ ] Testrecords

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Waterdetectie met alarmering in alle technische ruimtes |
| ⚠️ Partial | Waterdetectie in sommige ruimtes |
| ❌ Non-Compliant | Geen waterdetectie |

---

### 2.6 Apparatuurbescherming

#### PHY-6.1: Noodstroomvoorziening

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.11 - Ondersteunende Voorzieningen\|EXT-PHY.11]] |
| **ISO 27001** | A.7.11 |
| **BIO2** | — |

**Beschrijving:**
Kritieke systemen zijn aangesloten op een UPS (Uninterruptible Power Supply) die voldoende tijd biedt voor controlled shutdown of overname door noodstroom.

**Audit Procedure:**
1. Inventariseer UPS-systemen
2. Controleer capaciteit vs. aangesloten load
3. Vraag testrecords op

**Verwacht Bewijs:**
- [ ] UPS-inventaris
- [ ] Capaciteitsberekening
- [ ] Testrecords

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | UPS voor kritieke systemen, getest, voldoende capaciteit |
| ⚠️ Partial | UPS aanwezig maar niet getest of onderbemeten |
| ❌ Non-Compliant | Geen UPS voor kritieke systemen |

---

#### PHY-6.2: Apparatuur onderhoud

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.13 - Apparatuuronderhoud\|EXT-PHY.13]] |
| **ISO 27001** | A.7.13 |
| **BIO2** | — |

**Beschrijving:**
Kritieke apparatuur (servers, netwerk, UPS, klimaat) wordt periodiek onderhouden volgens fabrikantvoorschriften.

**Audit Procedure:**
1. Vraag onderhoudsschema's op
2. Controleer onderhoudsrecords
3. Verifieer dat onderhoud tijdig is uitgevoerd

**Verwacht Bewijs:**
- [ ] Onderhoudsschema's per apparatuurtype
- [ ] Onderhoudsrecords
- [ ] SLA's met onderhoudspartijen

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Onderhoudsschema's actief, records compleet |
| ⚠️ Partial | Onderhoud vindt plaats maar niet gedocumenteerd |
| ❌ Non-Compliant | Geen structureel onderhoud |

---

### 2.7 Werkplek Beveiliging

#### PHY-7.1: Clean desk policy

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.7 - Leeg Bureau en Scherm\|EXT-PHY.7]] |
| **ISO 27001** | A.7.7 |
| **BIO2** | B7.8 |

**Beschrijving:**
Een clean desk policy is vastgesteld en gecommuniceerd: vertrouwelijke documenten worden opgeborgen bij afwezigheid.

**Audit Procedure:**
1. Vraag clean desk policy op
2. Controleer communicatie naar medewerkers
3. Inspectie: steekproef na werktijd

**Verwacht Bewijs:**
- [ ] Clean desk policy document
- [ ] Communicatierecord
- [ ] Inspectieresultaten (optioneel)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Policy vastgesteld, gecommuniceerd, nageleefd |
| ⚠️ Partial | Policy aanwezig maar naleving inconsistent |
| ❌ Non-Compliant | Geen clean desk policy |

---

#### PHY-7.2: Clear screen policy

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.7 - Leeg Bureau en Scherm\|EXT-PHY.7]] |
| **ISO 27001** | A.7.7 |
| **BIO2** | B7.8 |

**Beschrijving:**
Werkstations vergrendelen automatisch na periode van inactiviteit (maximaal 15 minuten) en medewerkers vergrendelen handmatig bij weglopen.

**Audit Procedure:**
1. Controleer GPO of MDM-instellingen voor screensaver/lock
2. Verifieer timeout van maximaal 15 minuten
3. Steekproef: test automatische vergrendeling

**Verwacht Bewijs:**
- [ ] GPO/MDM configuratie
- [ ] Timeout instelling ≤15 min
- [ ] Testresultaten

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Automatische vergrendeling ≤15 min, afgedwongen |
| ⚠️ Partial | Vergrendeling ingesteld maar >15 min |
| ❌ Non-Compliant | Geen automatische vergrendeling |

---

### 2.8 Afvoer en Hergebruik

#### PHY-8.1: Veilige afvoer media

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **EXT Control** | [[Controls/EXT-PHY/EXT-PHY.8 - Plaatsing en Bescherming Apparatuur\|EXT-PHY.8]] |
| **ISO 27001** | A.7.10, A.7.14 |
| **BIO2** | B7.6 |

**Beschrijving:**
Opslagmedia (harde schijven, USB, tapes) worden veilig gewist of vernietigd voordat ze worden afgevoerd of hergebruikt.

**Audit Procedure:**
1. Vraag procedure voor media-afvoer op
2. Controleer of gecertificeerde methoden worden gebruikt
3. Vraag vernietigingscertificaten op

**Verwacht Bewijs:**
- [ ] Media-afvoerprocedure
- [ ] Vernietigingscertificaten
- [ ] Contract met vernietigingsbedrijf (indien uitbesteed)

**Beoordelingscriteria:**

| Oordeel | Criteria |
|---------|----------|
| ✅ Compliant | Procedure actief, certificaten beschikbaar |
| ⚠️ Partial | Procedure aanwezig maar niet altijd gevolgd |
| ❌ Non-Compliant | Geen veilige media-afvoer |

---

## 3. Complete Recommendations Checklist

### 3.1 Perimeters

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| PHY-1.1 | Beveiligingszones gedefinieerd | L1 | ☐ |
| PHY-1.2 | Fysieke barrières aanwezig | L1 | ☐ |

### 3.2 Toegangscontrole

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| PHY-2.1 | Toegangscontrolesysteem actief | L1 | ☐ |
| PHY-2.2 | Toegangsregistratie actief | L1 | ☐ |
| PHY-2.3 | Bezoekerregistratie en -begeleiding | L1 | ☐ |
| PHY-2.4 | Toegangsrechten periodiek gereviewd | L1 | ☐ |
| PHY-2.5 | Dubbele authenticatie kritieke zones | L2 | ☐ |
| PHY-2.6 | Anti-passback actief | L2 | ☐ |

### 3.3 Beveiligde Ruimtes

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| PHY-3.1 | Serverruimte fysiek beveiligd | L1 | ☐ |
| PHY-3.2 | Klimaatbeheersing kritieke ruimtes | L1 | ☐ |
| PHY-3.3 | Geen ramen in serverruimte | L2 | ☐ |
| PHY-3.4 | Aparte stroomgroep kritieke ruimtes | L2 | ☐ |

### 3.4 Monitoring

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| PHY-4.1 | Camerabewaking aanwezig | L1 | ☐ |
| PHY-4.2 | Inbraakdetectie actief | L1 | ☐ |
| PHY-4.3 | 24/7 security monitoring | L2 | ☐ |

### 3.5 Omgevingsbescherming

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| PHY-5.1 | Branddetectie en -bestrijding | L1 | ☐ |
| PHY-5.2 | Waterdetectie in technische ruimtes | L2 | ☐ |
| PHY-5.3 | Bliksembeveiliging | L1 | ☐ |

### 3.6 Apparatuurbescherming

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| PHY-6.1 | Noodstroomvoorziening (UPS) | L1 | ☐ |
| PHY-6.2 | Apparatuur onderhoud | L1 | ☐ |
| PHY-6.3 | Noodstroomaggregaat | L2 | ☐ |

### 3.7 Werkplek Beveiliging

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| PHY-7.1 | Clean desk policy | L1 | ☐ |
| PHY-7.2 | Clear screen policy | L1 | ☐ |
| PHY-7.3 | Kabelsloten voor laptops | L2 | ☐ |

### 3.8 Afvoer en Hergebruik

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| PHY-8.1 | Veilige afvoer media | L1 | ☐ |
| PHY-8.2 | Gecertificeerde vernietiging | L2 | ☐ |

---

## 4. Normenkader Kruisverwijzingen

### ISO 27001:2022 Mapping

| ISO Control | Benchmark Recs | Level |
|-------------|----------------|-------|
| A.7.1 Physical security perimeters | PHY-1.1, PHY-1.2 | L1 |
| A.7.2 Physical entry | PHY-2.1, PHY-2.2, PHY-2.3, PHY-2.4 | L1 |
| A.7.3 Securing offices, rooms and facilities | PHY-3.1, PHY-3.2 | L1 |
| A.7.4 Physical security monitoring | PHY-4.1, PHY-4.2 | L1 |
| A.7.5 Protecting against physical threats | PHY-5.1, PHY-5.2, PHY-5.3 | L1/L2 |
| A.7.7 Clear desk and clear screen | PHY-7.1, PHY-7.2 | L1 |
| A.7.11 Supporting utilities | PHY-6.1 | L1 |
| A.7.13 Equipment maintenance | PHY-6.2 | L1 |
| A.7.14 Secure disposal or re-use | PHY-8.1 | L1 |

### BIO2 Mapping

| BIO Maatregel | Benchmark Recs | Level |
|---------------|----------------|-------|
| B7.1 Beveiligingsperimeters | PHY-1.1, PHY-1.2 | L1 |
| B7.2 Fysieke toegang | PHY-2.1, PHY-2.2, PHY-2.3, PHY-2.4 | L1 |
| B7.3 Faciliteitenbeveiliging | PHY-3.1, PHY-3.2 | L1 |
| B7.4 Omgevingsdreigingen | PHY-5.1, PHY-5.2 | L1/L2 |
| B7.5 Beveiligde gebieden | PHY-3.1 | L1 |
| B7.6 Apparatuurbeveiliging | PHY-6.1, PHY-6.2, PHY-8.1 | L1 |
| B7.8 Leeg bureau en scherm | PHY-7.1, PHY-7.2 | L1 |

---

## 5. Evidence Vereisten

| Type Maatregel | Vereist Bewijs | Voorbeelden |
|----------------|----------------|-------------|
| **Zonering** | Documentatie, plattegrond | Beveiligingsplan, floor plan |
| **Toegang** | Systeemlogs, configuratie | Badge-logs, ACL-export |
| **Inspectie** | Fysieke verificatie | Foto's, inspectierapport |
| **Onderhoud** | Records, certificaten | Onderhoudsbon, keuringsrapport |
| **Monitoring** | Configuratie, logs | Camera-instellingen, alarmlogs |

---

## 6. Review Historie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-02-10 | CISO | Initiële versie |

---

## Gerelateerde Documenten

- [[Controls/EXT-PHY/_index|EXT-PHY Controls]]
- [[Benchmarks/EXT/EXT-BM-Governance-v1.0|EXT-BM-Governance]]
- [[Benchmarks/EXT/EXT-BM-HR-v1.0|EXT-BM-HR]]
