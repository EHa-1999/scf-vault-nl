---
id: "XENA-ZGW"
type: system
name: "XENA-ZGW"
full_name: "XENA Zaakgericht Werken"
description: "XENA Zaakgericht Werken platform - Centrale zaakafhandeling conform GEMMA en VNG API-standaarden."
owner: "Team Dienstverlening"
classification: "BBN2"
status: "Production"
created: 2026-01-27
modified: 2026-02-10
tags:
  - system
  - production
  - xena
  - zgw
  - zaakgericht
  - common-ground
---

# XENA-ZGW

> **XENA Zaakgericht Werken** — Centrale zaakafhandeling conform VNG API-standaarden

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Systeem ID** | XENA-ZGW |
| **Volledige Naam** | XENA Zaakgericht Werken |
| **Eigenaar** | Team Dienstverlening |
| **Classificatie** | BBN2 |
| **Status** | Production |

## Beschrijving

XENA-ZGW is het centrale platform voor Zaakgericht Werken binnen de gemeente. Het systeem implementeert de VNG API-standaarden voor Zaakgericht Werken en volgt het Common Ground architectuurmodel met gescheiden data- en applicatielagen.

**Kenmerken:**
- VNG API's voor Zaakgericht Werken (ZGW)
- BPMN-gebaseerde procesautomatisering
- Integratie met basisregistraties
- Documentbeheer via Alfresco/DRC
- Taakafhandeling en workflow

## Gerelateerd Systeem

| Systeem | Relatie |
|---------|---------|
| [[Systems/XENA-NZGW\|XENA-NZGW]] | Zuster-systeem voor niet-zaakgerichte processen |

## Componenten

| Component | Type | Functie | Benchmark |
|-----------|------|---------|-----------|
| [[Components/Tezza\|Tezza]] | Frontend | Zaakafhandelcomponent (Contezza) | EXT-BM-Tezza |
| [[Components/Alfresco\|Alfresco]] | DMS | Document Repository Component | EXT-BM-Alfresco |
| [[Components/PostgreSQL\|PostgreSQL]] | Database | Dataopslag alle componenten | CIS PostgreSQL 16 |
| [[Components/OpenZaak\|OpenZaak]] | API | VNG ZGW API implementatie | EXT-BM-OpenZaak |
| [[Components/GZAC\|GZAC]] | Process | Generieke Zaakafhandelcomponent | EXT-BM-GZAC |
| [[Components/ActiveMQ\|ActiveMQ]] | Messaging | Message broker (async) | EXT-BM-ActiveMQ |
| [[Components/RabbitMQ\|RabbitMQ]] | Messaging | Message broker (AMQP) | EXT-BM-RabbitMQ |

```dataview
TABLE 
  component_type as "Type",
  version as "Versie",
  status as "Status"
FROM "Components"
WHERE contains(systems, "XENA-ZGW") OR contains(systems, "ZGW")
SORT component_type ASC
```

## Architectuur

```
┌─────────────────────────────────────────────────────────────┐
│                        XENA-ZGW                             │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────┐    ┌─────────┐    ┌─────────┐                 │
│  │  Tezza  │───▶│  GZAC   │───▶│OpenZaak │                 │
│  │(Frontend)    │(Process)│    │ (API)   │                 │
│  └─────────┘    └────┬────┘    └────┬────┘                 │
│                      │              │                       │
│       ┌──────────────┼──────────────┘                       │
│       │              │                                      │
│  ┌────▼────┐    ┌────▼────┐    ┌─────────┐                 │
│  │Alfresco │    │ActiveMQ │    │RabbitMQ │                 │
│  │  (DMS)  │    │  (JMS)  │    │ (AMQP)  │                 │
│  └────┬────┘    └────┬────┘    └────┬────┘                 │
│       │              │              │                       │
│       └──────────────┼──────────────┘                       │
│                      │                                      │
│              ┌───────▼───────┐                              │
│              │  PostgreSQL   │                              │
│              │  (Database)   │                              │
│              └───────────────┘                              │
└─────────────────────────────────────────────────────────────┘
```

## Compliance Status

### Per Prioriteit

```dataview
TABLE WITHOUT ID
  rows.control[0].priority_label as "Prioriteit",
  length(filter(rows, (r) => r.impl_status = "Implemented")) as "Geïmpl.",
  length(filter(rows, (r) => r.impl_status = "Partial")) as "Deels",
  length(filter(rows, (r) => r.impl_status = "Planned")) as "Gepland",
  length(filter(rows, (r) => r.impl_status = "Not Started")) as "Open"
FROM "Implementations"
WHERE system = "XENA-ZGW" OR system = "ZGW"
FLATTEN control
GROUP BY control.priority_label
```

## Open Risico's

```dataview
TABLE 
  risk_level as "Niveau",
  name as "Risico",
  status as "Status"
FROM "Risks"
WHERE (contains(systems, "XENA-ZGW") OR contains(systems, "ZGW")) AND status != "Closed"
SORT risk_level DESC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-02-10 | Hernoemd van ZGW naar XENA-ZGW; componenten toegevoegd | @ciso |
| 2026-01-27 | Initiële versie | @architect |
