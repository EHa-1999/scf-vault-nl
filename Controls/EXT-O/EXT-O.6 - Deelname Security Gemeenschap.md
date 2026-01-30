---
id: "EXT-O.6"
type: control
category: "EXT-O2"
category_name: "External Relations"
control_name: "Deelname Security Gemeenschap"
priority: 3
priority_label: "Medium"
baseline: false
control_type: "Organizational"
iso27001: "A.5.6"
nis2: "-"
bio2: "-"
security_requirement:
  - "SR-1"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-o

# ─────────────────────────────────────────────────────────────────────
# Implementatie Tracking
# ─────────────────────────────────────────────────────────────────────
impl_status: "gepland"
impl_percentage: 0
impl_validated: false
impl_date: null
impl_owner: ""
impl_system: ""

# ─────────────────────────────────────────────────────────────────────
# Compliance Tracking
# ─────────────────────────────────────────────────────────────────────
compliance_status: "niet_beoordeeld"
compliance_score: null
compliance_assessed: null
compliance_assessor: ""
compliance_evidence: []
---

# EXT-O.6 - Deelname Security Gemeenschap

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.6 |
| **Categorie** | EXT-O2 - External Relations |
| **Prioriteit** | 3 (Medium) |
| **Baseline** | Nee - Optioneel |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.6 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | - |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-1|SR-1]]

## Beschrijving

Onderhoud lidmaatschappen en contacten met relevante security fora, vakgroepen en informatiedeling initiatieven.

## Implementatie Richtlijnen

### Stappen

1. Identificeer relevante communities
2. Activeer lidmaatschappen
3. Deel in bijeenkomsten
4. Verwerk ontvangen informatie
5. Evalueer best practices

### Best Practices

- IBD lidmaatschap actief
- VNG werkgroep deelname
- NCSC partnerprogramma
- Vendor communities

## Component Implementaties

```dataview
TABLE 
  component as "Component",
  system as "Systeem", 
  impl_status as "Status",
  next_review as "Review"
FROM "Implementations"
WHERE contains(string(control), this.id)
SORT system ASC
```

## Gerelateerde Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico"
FROM "Risks"
WHERE contains(string(controls), this.id)
```

## Gerelateerde Controls

- Zie andere controls in categorie [[Controls/EXT-O|EXT-O]]
