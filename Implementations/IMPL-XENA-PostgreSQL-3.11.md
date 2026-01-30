---
id: "IMPL-XENA-PostgreSQL-3.11"
type: implementation
control: "[[Controls/CIS/CIS-3.11 - Encrypt Sensitive Data at Rest|CIS-3.11]]"
component: "[[Components/PostgreSQL]]"
system: "[[Systems/XENA]]"
impl_status: "Implemented"
dod_status: "Verified"
risk_if_missing: "[[Risks/RSK-001]]"
owner: "@database-team"
last_review: 2026-01-27
next_review: 2026-07-26
created: 2026-01-27
modified: 2026-01-27
tags:
  - implementation
  - xena
  - postgresql
---

# CIS-3.11 → PostgreSQL

> **Encrypt Sensitive Data At Rest** geïmplementeerd op **PostgreSQL** binnen **XENA**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Control** | [[Controls/CIS/CIS-3.11 - Encrypt Sensitive Data at Rest|CIS-3.11]] |
| **Component** | [[Components/PostgreSQL]] |
| **Systeem** | [[Systems/XENA]] |
| **Status** | Implemented |
| **DoD Status** | Verified |
| **Eigenaar** | @database-team |
| **Laatste Review** | 2026-01-27 |
| **Volgende Review** | 2026-07-26 |

## Risico bij Ontbreken

> [!warning] Gekoppeld Risico
> [[Risks/RSK-001]]
> 
> Zonder implementatie van deze control op dit component bestaat het risico dat gevoelige gegevens onbeschermd zijn of ongeautoriseerd toegankelijk.

## Implementatie Specificatie

### Hoe wordt deze control toegepast?

### Configuratie

PostgreSQL Transparent Data Encryption (TDE) via pgcrypto en storage-level encryption.

```sql
-- pgcrypto extensie
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Encrypted columns voor BSN
ALTER TABLE citizens ADD COLUMN bsn_encrypted BYTEA;
UPDATE citizens SET bsn_encrypted = pgp_sym_encrypt(bsn, 'encryption_key');
```

### Technische Maatregelen

1. **Storage Encryption**: Underlying filesystem encryption
2. **Column Encryption**: pgcrypto voor BSN en bijzondere categorieën
3. **Connection Encryption**: SSL/TLS verplicht

## Definition of Done (DoD)

De control is volledig geïmplementeerd wanneer aan alle volgende criteria is voldaan:

- [ ] **DoD-1**: TDE is ingeschakeld op database level
- [ ] **DoD-2**: BSN kolommen zijn versleuteld met pgcrypto
- [ ] **DoD-3**: SSL verbindingen zijn verplicht (reject_unencrypted)
- [ ] **DoD-4**: Encryptiesleutels zijn opgeslagen in OpenBAO
- [ ] **DoD-5**: Backup files zijn versleuteld

### DoD Status

| Criterium | Status | Datum | Bewijs |
|-----------|--------|-------|--------|
| DoD-1 | ✅ Verified | 2026-01-27 | |
| DoD-2 | ✅ Verified | 2026-01-27 | |
| DoD-3 | ✅ Verified | 2026-01-27 | |
| DoD-4 | ✅ Verified | 2026-01-27 | |
| DoD-5 | ✅ Verified | 2026-01-27 | |

**Legenda**: ✅ Verified | ⏳ Pending | ❌ Failed | 🔄 Retest

## Bewijsmateriaal (Evidence)

### Vereist Bewijsmateriaal

| # | Type Bewijs | Beschrijving | Frequentie |
|---|-------------|--------------|------------|
| E-1 | Configuratie | postgresql.conf SSL settings | Jaarlijks |
| E-2 | Query output | SELECT * FROM pg_stat_ssl | Maandelijks |
| E-3 | Schema export | Encrypted column definitions | Bij wijziging |
| E-4 | Test rapport | Encryption verification test | Kwartaal |

### Verzameld Bewijsmateriaal

| Datum | Type | Beschrijving | Link |
|-------|------|--------------|------|
| 2026-01-27 | Configuratie | postgresql.conf SSL settings | [[Evidence/XENA/PostgreSQL/...]] |

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
