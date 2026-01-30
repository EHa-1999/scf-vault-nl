---
id: "EXT-O.14"
type: control
category: "EXT-O3"
category_name: "Asset & Information Management"
control_name: "Informatieoverdracht Beleid"
priority: 5
priority_label: "Critical"
baseline: true
control_type: "Organizational"
iso27001: "A.5.14"
nis2: "Art.21(2)(k)"
bio2: "B9.5"
security_requirement:
  - "SR-4"
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

# EXT-O.14 - Informatieoverdracht Beleid

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **ID** | EXT-O.14 |
| **Categorie** | EXT-O3 - Asset & Information Management |
| **Prioriteit** | 5 (Critical) |
| **Baseline** | Ja - Comply or Explain |
| **Type** | Organizational |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| [[Frameworks/ISO-27001-2022|ISO 27001:2022]] | A.5.14 |
| [[Frameworks/NIS2|NIS2]] | Art.21(2)(k) |
| [[Frameworks/BIO2|BIO2]] | B9.5 |

## Security Requirements

Dit control valt onder de volgende Security Requirements:

- [[Frameworks/Security-Requirements/SR-4|SR-4]]

## Beschrijving

Definieer regels en procedures voor veilige overdracht van informatie binnen en buiten de organisatie.

## Implementatie Richtlijnen

### Stappen

1. Definieer overdrachtsbeleid
2. Specificeer kanalen per classificatie
3. Implementeer encryptie
4. Beveilig externe uitwisseling
5. Monitor dataoverdracht

### Best Practices

- Email encryptie M365
- Zivver voor gevoelige data
- USB verbod voor vertrouwelijk
- API security

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
