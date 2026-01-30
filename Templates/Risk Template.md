---
id: "{{risk_id}}"
type: risk
name: "{{risk_name}}"
risk_level: {{risk_level}}
risk_label: "{{risk_label}}"
likelihood: {{likelihood}}
impact: {{impact}}
inherent_risk: {{inherent_risk}}
residual_risk: {{residual_risk}}
systems:
  - "[[{{system}}]]"
components:
  - "[[{{component}}]]"
controls:
  - "[[{{control}}]]"
status: "{{status}}"
owner: "{{owner}}"
created: {{date}}
modified: {{date}}
tags:
  - risk
  - {{risk_label}}
---

# {{risk_id}} - {{risk_name}}

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Risico ID** | {{risk_id}} |
| **Risico Niveau** | {{risk_level}} - {{risk_label}} |
| **Status** | {{status}} |
| **Eigenaar** | {{owner}} |

## Risico Beoordeling

| Metriek | Waarde | Toelichting |
|---------|--------|-------------|
| **Likelihood** | {{likelihood}} / 5 | |
| **Impact** | {{impact}} / 5 | |
| **Inherent Risk** | {{inherent_risk}} | Zonder controls |
| **Residual Risk** | {{residual_risk}} | Met controls |

## Beschrijving

### Risico Scenario

Beschrijf het risico scenario: wat kan er gebeuren, hoe kan het gebeuren?

### Impact Analyse

Wat zijn de gevolgen als dit risico zich manifesteert?

| Impact Type | Beschrijving |
|-------------|--------------|
| **Operationeel** | |
| **Financieel** | |
| **Reputatie** | |
| **Compliance** | |
| **Veiligheid** | |

## Getroffen Assets

### Systemen

```dataview
LIST
FROM "Systems"
WHERE contains(this.systems, file.link)
```

### Componenten

```dataview
LIST
FROM "Components"
WHERE contains(this.components, file.link)
```

## Mitigerende Controls

De volgende controls mitigeren dit risico:

```dataview
TABLE 
  impl_status as "Status"
FROM "Implementations"
WHERE risk_if_missing = this.file.link
SORT control ASC
```

## Behandelplan

| Strategie | Beschrijving |
|-----------|--------------|
| **Accept** | ☐ Risico wordt geaccepteerd |
| **Mitigate** | ☐ Risico wordt gemitigeerd door controls |
| **Transfer** | ☐ Risico wordt overgedragen (verzekering, outsourcing) |
| **Avoid** | ☐ Risico wordt vermeden |

### Acties

| # | Actie | Eigenaar | Deadline | Status |
|---|-------|----------|----------|--------|
| 1 | | | | |
| 2 | | | | |

## Review Historie

| Datum | Risico Score | Reviewer | Opmerkingen |
|-------|--------------|----------|-------------|
| {{date}} | {{risk_level}} | @security | Initiële beoordeling |

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| {{date}} | Initiële versie | @security |
