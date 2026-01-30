---
id: "IMPL-XENA-Apache-NiFi-8.2"
type: implementation
control: "[[Controls/CIS/CIS-8.2 - Collect Audit Logs|CIS-8.2]]"
component: "[[Components/Apache-NiFi]]"
system: "[[Systems/XENA]]"
impl_status: "Implemented"
dod_status: "Partial"
risk_if_missing: "[[Risks/RSK-003]]"
owner: "@platform-team"
last_review: 2026-01-27
next_review: 2026-07-26
created: 2026-01-27
modified: 2026-01-27
tags:
  - implementation
  - xena
  - apache-nifi
---

# CIS-8.2 → Apache-NiFi

> **Collect Audit Logs** geïmplementeerd op **Apache-NiFi** binnen **XENA**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Control** | [[Controls/CIS/CIS-8.2 - Collect Audit Logs|CIS-8.2]] |
| **Component** | [[Components/Apache-NiFi]] |
| **Systeem** | [[Systems/XENA]] |
| **Status** | Implemented |
| **DoD Status** | Partial |
| **Eigenaar** | @platform-team |
| **Laatste Review** | 2026-01-27 |
| **Volgende Review** | 2026-07-26 |

## Risico bij Ontbreken

> [!warning] Gekoppeld Risico
> [[Risks/RSK-003]]
> 
> Zonder implementatie van deze control op dit component bestaat het risico dat gevoelige gegevens onbeschermd zijn of ongeautoriseerd toegankelijk.

## Implementatie Specificatie

### Hoe wordt deze control toegepast?

### Configuratie

NiFi provenance en audit logging naar centraal SIEM.

```properties
# nifi.properties
nifi.provenance.repository.implementation=org.apache.nifi.provenance.WriteAheadProvenanceRepository
nifi.provenance.repository.max.storage.time=30 days
nifi.provenance.repository.max.storage.size=10 GB
```

### Technische Maatregelen

1. **Provenance**: Volledige data lineage tracking
2. **User Events**: Alle user actions gelogd
3. **System Events**: Flow changes en system events

## Definition of Done (DoD)

De control is volledig geïmplementeerd wanneer aan alle volgende criteria is voldaan:

- [ ] **DoD-1**: Provenance logging is ingeschakeld
- [ ] **DoD-2**: Logs worden 30 dagen bewaard
- [ ] **DoD-3**: Logs worden doorgestuurd naar SIEM
- [ ] **DoD-4**: User authentication events worden gelogd
- [ ] **DoD-5**: Flow modification events worden gelogd

### DoD Status

| Criterium | Status | Datum | Bewijs |
|-----------|--------|-------|--------|
| DoD-1 | ⏳ Pending |  | |
| DoD-2 | ⏳ Pending |  | |
| DoD-3 | ⏳ Pending |  | |
| DoD-4 | ⏳ Pending |  | |
| DoD-5 | ⏳ Pending |  | |

**Legenda**: ✅ Verified | ⏳ Pending | ❌ Failed | 🔄 Retest

## Bewijsmateriaal (Evidence)

### Vereist Bewijsmateriaal

| # | Type Bewijs | Beschrijving | Frequentie |
|---|-------------|--------------|------------|
| E-1 | Configuratie | nifi.properties logging settings | Jaarlijks |
| E-2 | Screenshot | NiFi provenance UI | Maandelijks |
| E-3 | SIEM query | NiFi log ingestion verification | Wekelijks |
| E-4 | Test rapport | Audit completeness test | Kwartaal |

### Verzameld Bewijsmateriaal

| Datum | Type | Beschrijving | Link |
|-------|------|--------------|------|
| 2026-01-27 | Configuratie | nifi.properties logging settings | [[Evidence/XENA/Apache-NiFi/...]] |

## Uitzonderingen

### Actieve Uitzonderingen

| ID | Reden | Goedgekeurd door | Verloopdatum | Compenserende Control |
|----|-------|------------------|--------------|----------------------|
| - | Geen actieve uitzonderingen | - | - | - |

## Audit Trail

| Datum | Actie | Door | Opmerkingen |
|-------|-------|------|-------------|
| 2026-01-27 | Aangemaakt | @architect | Initiële implementatie documentatie |

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-01-27 | Initiële versie | @architect |
