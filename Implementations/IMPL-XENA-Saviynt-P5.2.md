---
id: "IMPL-XENA-Saviynt-P5.2"
type: implementation
control: "[[Controls/EXT-P/EXT-P5.2 - Beperk Toegang (Need-to-Know)|EXT-P5.2]]"
component: "[[Components/Saviynt]]"
system: "[[Systems/XENA]]"
impl_status: "Partial"
dod_status: "In Progress"
risk_if_missing: "[[Risks/RSK-004]]"
owner: "@identity-team"
last_review: 2026-01-27
next_review: 2026-07-26
created: 2026-01-27
modified: 2026-01-27
tags:
  - implementation
  - xena
  - saviynt
---

# EXT-P5.2 → Saviynt

> **Beperk Toegang (Need-to-Know)** geïmplementeerd op **Saviynt** binnen **XENA**

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Control** | [[Controls/EXT-P/EXT-P5.2 - Beperk Toegang (Need-to-Know)|EXT-P5.2]] |
| **Component** | [[Components/Saviynt]] |
| **Systeem** | [[Systems/XENA]] |
| **Status** | Partial |
| **DoD Status** | In Progress |
| **Eigenaar** | @identity-team |
| **Laatste Review** | 2026-01-27 |
| **Volgende Review** | 2026-07-26 |

## Risico bij Ontbreken

> [!warning] Gekoppeld Risico
> [[Risks/RSK-004]]
> 
> Zonder implementatie van deze control op dit component bestaat het risico dat gevoelige gegevens onbeschermd zijn of ongeautoriseerd toegankelijk.

## Implementatie Specificatie

### Hoe wordt deze control toegepast?

### Configuratie

Saviynt Role-Based Access Control met just-in-time provisioning voor BSN toegang.

```json
{
  "role": "XENA_BSN_VIEWER",
  "type": "privileged",
  "jit_enabled": true,
  "max_duration": "4h",
  "approval_required": true
}
```

### Technische Maatregelen

1. **RBAC**: Role-based access control
2. **JIT-PAM**: Just-in-time provisioning voor sensitive data
3. **Approval Workflow**: Manager approval voor BSN toegang

## Definition of Done (DoD)

De control is volledig geïmplementeerd wanneer aan alle volgende criteria is voldaan:

- [ ] **DoD-1**: RBAC rollen zijn gedefinieerd per functiegroep
- [ ] **DoD-2**: JIT-PAM is actief voor BSN toegang
- [ ] **DoD-3**: Approval workflow is geconfigureerd
- [ ] **DoD-4**: Access reviews worden kwartaal uitgevoerd
- [ ] **DoD-5**: Segregation of duties is afgedwongen

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
| E-1 | Export | Saviynt role definitions | Jaarlijks |
| E-2 | Screenshot | JIT-PAM configuratie | Bij wijziging |
| E-3 | Rapport | Quarterly access review | Kwartaal |
| E-4 | Audit log | Privileged access requests | Maandelijks |

### Verzameld Bewijsmateriaal

| Datum | Type | Beschrijving | Link |
|-------|------|--------------|------|
|  |  |  | [[Evidence/XENA/Saviynt/...]] |

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
