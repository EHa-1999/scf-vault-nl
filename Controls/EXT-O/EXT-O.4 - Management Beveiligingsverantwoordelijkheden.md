---
id: "EXT-O.4"
type: control
category: "EXT-O1"
category_name: "Security Governance"
control_name: "Management Beveiligingsverantwoordelijkheden"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.4"
nis2: "Art.20"
bio2: "B2.2"
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

# EXT-O.4 - Management Beveiligingsverantwoordelijkheden

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.4 |
| **Categorie** | EXT-O1 - Security Governance |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.4 |
| [[Frameworks/NIS2|NIS2]] | Art.20 |
| [[Frameworks/BIO2|BIO2]] | B2.2 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-1|SR-1]]

## Beschrijving

Zorg ervoor dat management actief verantwoordelijkheid neemt voor informatiebeveiliging en dit uitdraagt naar de organisatie. NIS2 vereist persoonlijke bestuurdersaansprakelijkheid.

## Implementatie Richtlijnen

### Stappen

1. Formaliseer management commitment
2. Neem security op in directie-agenda
3. Alloceer voldoende budget
4. Implementeer management KPIs
5. Organiseer security briefings

### Best Practices

- Kwartaalrapportage aan directie
- Security training voor bestuurders (NIS2)
- Budget review cyclus
- Zichtbaar leiderschap

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
