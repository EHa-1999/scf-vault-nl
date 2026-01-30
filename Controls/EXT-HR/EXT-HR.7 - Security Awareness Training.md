---
id: "EXT-HR.7"
type: control
category: "EXT-HR3"
category_name: "Awareness & Training"
control_name: "Security Awareness Training"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "People"
iso27001: "A.6.3"
nis2: "Art.21(2)(g)"
bio2: "B3.3"
security_requirement:
  - "SR-11"
status: draft
created: 2026-01-29
modified: 2026-01-29
tags:
  - control
  - extended
  - ext-hr

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

# EXT-HR.7 - Security Awareness Training

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-HR.7 |
| **Categorie** | EXT-HR3 - Awareness & Training |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | People |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.6.3 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(g) |
| [[Frameworks/BIO2|BIO2]] | B3.3 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-11|SR-11]]

## Beschrijving

Zorg voor regelmatige security awareness training voor alle medewerkers. Verwijst naar CIS 14 voor details.

## Implementatie Richtlijnen

### Stappen

1. Definieer training curriculum
2. Implementeer onboarding training
3. Voer jaarlijkse herhalingstraining uit
4. Meet effectiviteit
5. Rapporteer deelname

### Best Practices

- Verplichte onboarding
- Phishing simulaties
- Rol-specifieke training
- Zie CIS 14 voor details

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

- Zie andere controls in categorie [[Controls/EXT-HR|EXT-HR]]
