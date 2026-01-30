---
id: "EXT-P5.1"
type: control
category: "EXT-P5"
category_name: "Gegevensbescherming (VERBERG)"
control_name: "Implementeer Pseudonimisering"
priority: 4
priority_label: "High"
baseline: true
control_type: "Organizational"
iso27001: "A.8.24"
nis2: "Art.21(2)(h)"
bio2: "8.24"
avg: "Art.4(5)"
core_requirement: "CR-13: Privacy Requirements"
security_requirement:
  - "SR-13"
status: draft
created: 2026-01-28
modified: 2026-01-28
tags:
  - control
  - privacy
  - ext-p
  - ext-p5

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

# EXT-P5.1 - Implementeer Pseudonimisering

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-P5.1 |
| **Categorie** | EXT-P5 - Gegevensbescherming (VERBERG) |
| **Prioriteit** | 4 (High) |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.8.24 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(h) |
| [[Frameworks/BIO2|BIO2]] | 8.24 |
| [[Frameworks/AVG-GDPR|AVG/GDPR]] | Art.4(5) |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-13 - Privacy|SR-13 - Privacy]]

## Beschrijving

Pas pseudonimisering toe waar mogelijk om directe identificatie te voorkomen.

## Implementatie Richtlijnen

### Stappen

1. Beoordeel huidige situatie en gap-analyse
2. Ontwikkel implementatieplan
3. Implementeer technische en organisatorische maatregelen
4. Test en valideer implementatie
5. Documenteer en train medewerkers

### Best Practices

- Integreer met bestaande privacyprocessen
- Betrek de Functionaris Gegevensbescherming
- Documenteer alle beslissingen en uitzonderingen
- Review periodiek de effectiviteit

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

- Zie andere controls in categorie [[Controls/EXT-P|EXT-P]]
