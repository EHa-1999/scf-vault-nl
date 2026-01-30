---
id: "{{id}}"
type: control
category: "{{category}}"
category_name: "{{category_name}}"
control_name: "{{control_name}}"
priority: {{priority}}
priority_label: "{{priority_label}}"
extended_baseline: {{extended_baseline}}
control_type: "{{control_type}}"
iso27001: "{{iso27001}}"
nis2: "{{nis2}}"
bio2: "{{bio2}}"
core_requirement: "{{core_requirement}}"
status: draft
created: {{date}}
modified: {{date}}
tags:
  - control
  - {{category}}
---

# {{id}} - {{control_name}}

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Categorie** | {{category_name}} |
| **Prioriteit** | {{priority}} - {{priority_label}} |
| **Type** | {{control_type}} |
| **Extended Baseline** | {{extended_baseline}} |

## Framework Mappings

| Framework | Referentie |
|-----------|------------|
| **ISO 27001:2022** | {{iso27001}} |
| **NIS2** | {{nis2}} |
| **BIO2** | {{bio2}} |
| **Core Requirement** | {{core_requirement}} |

## Beschrijving

{{description}}

## Doel

Waarom is deze control belangrijk? Welk risico wordt gemitigeerd?

## Implementatie Richtlijnen

Algemene richtlijnen voor implementatie van deze control, onafhankelijk van specifieke systemen.

## Gerelateerde Controls

- 

## Component Implementaties

```dataview
TABLE 
  component as "Component",
  system as "Systeem", 
  impl_status as "Status",
  next_review as "Review"
FROM "Implementations"
WHERE contains(control, this.file.name)
SORT system ASC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| {{date}} | Initiële versie | @architect |
