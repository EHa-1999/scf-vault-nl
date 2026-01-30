---
id: "{{impl_id}}"
type: implementation
control: "[[{{control}}]]"
component: "[[{{component}}]]"
system: "[[{{system}}]]"
impl_status: "{{status}}"
dod_status: "{{dod_status}}"
risk_if_missing: "[[{{risk}}]]"
owner: "{{owner}}"
last_review: {{last_review}}
next_review: {{next_review}}
created: {{date}}
modified: {{date}}
tags:
  - implementation
  - {{system}}
  - {{component}}
---

# {{control}} → {{component}}

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Control** | [[{{control}}]] |
| **Component** | [[{{component}}]] |
| **Systeem** | [[{{system}}]] |
| **Status** | {{status}} |
| **DoD Status** | {{dod_status}} |
| **Eigenaar** | {{owner}} |
| **Laatste Review** | {{last_review}} |
| **Volgende Review** | {{next_review}} |

## Risico bij Ontbreken

> [!warning] Gekoppeld Risico
> [[{{risk}}]]
> 
> Zonder implementatie van deze control op dit component bestaat het risico dat...

## Implementatie Specificatie

### Hoe moet deze control worden toegepast?

Beschrijf hier de specifieke manier waarop de control moet worden geïmplementeerd op dit component:

1. **Configuratie**: 
2. **Technische maatregelen**: 
3. **Procedurele maatregelen**: 

### Configuratie Details

```yaml
# Specifieke configuratie voor dit component
```

## Definition of Done (DoD)

De control is volledig geïmplementeerd wanneer aan alle volgende criteria is voldaan:

- [ ] **DoD-1**: [Criterium 1]
- [ ] **DoD-2**: [Criterium 2]
- [ ] **DoD-3**: [Criterium 3]
- [ ] **DoD-4**: [Criterium 4]
- [ ] **DoD-5**: [Criterium 5]

### DoD Status

| Criterium | Status | Datum | Bewijs |
|-----------|--------|-------|--------|
| DoD-1 | ⏳ Pending | | |
| DoD-2 | ⏳ Pending | | |
| DoD-3 | ⏳ Pending | | |
| DoD-4 | ⏳ Pending | | |
| DoD-5 | ⏳ Pending | | |

**Legenda**: ✅ Voldaan | ⏳ Pending | ❌ Niet voldaan | 🔄 Hertest nodig

## Bewijsmateriaal (Evidence)

### Vereist Bewijsmateriaal

Voor compliance moet het volgende bewijsmateriaal worden aangetoond:

| # | Type Bewijs | Beschrijving | Frequentie |
|---|-------------|--------------|------------|
| E-1 | Screenshot | [Beschrijving] | Jaarlijks |
| E-2 | Configuratie export | [Beschrijving] | Bij wijziging |
| E-3 | Audit log | [Beschrijving] | Maandelijks |
| E-4 | Test rapport | [Beschrijving] | Kwartaal |

### Verzameld Bewijsmateriaal

| Datum | Type | Beschrijving | Link |
|-------|------|--------------|------|
| | | | [[Evidence/...]] |

## Uitzonderingen

### Actieve Uitzonderingen

| ID | Reden | Goedgekeurd door | Verloopdatum | Compenserende Control |
|----|-------|------------------|--------------|----------------------|
| | | | | |

## Audit Trail

| Datum | Actie | Door | Opmerkingen |
|-------|-------|------|-------------|
| {{date}} | Aangemaakt | @architect | Initiële versie |

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| {{date}} | Initiële versie | @architect |
