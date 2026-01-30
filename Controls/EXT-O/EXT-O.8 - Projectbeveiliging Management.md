---
id: "EXT-O.8"
type: control
category: "EXT-O2"
category_name: "External Relations"
control_name: "Projectbeveiliging Management"
priority: 4
priority_label: "High"
baseline: true
control_type: "Organizational"
iso27001: "A.5.8"
nis2: "-"
bio2: "B10.1"
security_requirement:
  - "SR-5"
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

# EXT-O.8 - Projectbeveiliging Management

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.8 |
| **Categorie** | EXT-O2 - External Relations |
| **Prioriteit** | 4 (High) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.8 |
| [[Frameworks/NIS2|NIS2]] | - |
| [[Frameworks/BIO2|BIO2]] | B10.1 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-5|SR-5]]

## Beschrijving

Integreer informatiebeveiligingseisen in projectmanagement methodologie en processen (security by design).

## Implementatie Richtlijnen

### Stappen

1. Definieer security gates
2. Integreer in projectmethodologie
3. Maak assessment templates
4. Train projectmanagers
5. Review projecten periodiek

### Best Practices

- Security review bij intake
- DPIA waar vereist
- Architecture review
- Pentest voor go-live

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
