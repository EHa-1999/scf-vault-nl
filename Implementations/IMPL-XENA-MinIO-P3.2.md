---
id: "IMPL-XENA-MinIO-P3.2"
type: implementation
control: "[[Controls/EXT-P/EXT-P3.2 - Implementeer Bewaartermijnen en Verwijdering|EXT-P3.2]]"
component: "[[Components/MinIO]]"
system: "[[Systems/XENA]]"
impl_status: "Planned"
dod_status: "Not Started"
risk_if_missing: "[[Risks/RSK-005]]"
owner: "@storage-team"
last_review: 2026-01-27
next_review: 2026-07-26
created: 2026-01-27
modified: 2026-01-27
tags:
  - implementation
  - xena
  - minio
---

# EXT-P3.2 → MinIO

> **Bewaartermijnen en Verwijdering** geïmplementeerd op **MinIO** binnen **XENA**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Control** | [[Controls/EXT-P/EXT-P3.2 - Implementeer Bewaartermijnen en Verwijdering|EXT-P3.2]] |
| **Component** | [[Components/MinIO]] |
| **Systeem** | [[Systems/XENA]] |
| **Status** | Planned |
| **DoD Status** | Not Started |
| **Eigenaar** | @storage-team |
| **Laatste Review** | 2026-01-27 |
| **Volgende Review** | 2026-07-26 |

## Risico bij Ontbreken

> [!warning] Gekoppeld Risico
> [[Risks/RSK-005]]
> 
> Zonder implementatie van deze control op dit component bestaat het risico dat gevoelige gegevens onbeschermd zijn of ongeautoriseerd toegankelijk.

## Implementatie Specificatie

### Hoe wordt deze control toegepast?

### Configuratie

MinIO Object Lifecycle Management voor automatische verwijdering.

```json
{
  "Rules": [
    {
      "ID": "retention-7y",
      "Status": "Enabled",
      "Filter": {"Tag": {"Key": "retention", "Value": "7y"}},
      "Expiration": {"Days": 2555}
    }
  ]
}
```

### Technische Maatregelen

1. **Lifecycle Policies**: Per bucket/object tag
2. **Legal Hold**: Override voor juridische bewaarplicht
3. **NiFi Integration**: Automatische tagging bij upload

## Definition of Done (DoD)

De control is volledig geïmplementeerd wanneer aan alle volgende criteria is voldaan:

- [ ] **DoD-1**: Lifecycle policies zijn geconfigureerd per documenttype
- [ ] **DoD-2**: Retentie tags worden automatisch toegevoegd
- [ ] **DoD-3**: Legal hold mechanisme is geïmplementeerd
- [ ] **DoD-4**: Verwijdering wordt gelogd in audit trail
- [ ] **DoD-5**: Jaarlijkse review van bewaartermijnen

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
| E-1 | Export | MinIO lifecycle configuration | Jaarlijks |
| E-2 | Rapport | Retention policy compliance scan | Kwartaal |
| E-3 | Audit log | Object deletion events | Maandelijks |
| E-4 | Test rapport | Lifecycle execution verification | Jaarlijks |

### Verzameld Bewijsmateriaal

| Datum | Type | Beschrijving | Link |
|-------|------|--------------|------|
|  |  |  | [[Evidence/XENA/MinIO/...]] |

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
