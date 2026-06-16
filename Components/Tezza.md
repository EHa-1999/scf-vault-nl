---
id: "Tezza"
type: component
name: "Tezza"
component_type: "Frontend/Application"
vendor: "Contezza"
version: "latest"
technology: "Angular/Java"
systems:
  - "XENA-ZGW"
status: "Production"
benchmark: "EXT-BM-Tezza"
benchmark_status: "Planned"
classification: "BBN2"
owner: "Team Dienstverlening"
created: 2026-02-10
modified: 2026-02-10
tags:
  - component
  - frontend
  - zgw
  - contezza
  - vendor
---

# Tezza

> Zaakafhandelcomponent van leverancier Contezza

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | Tezza |
| **Type** | Frontend/Application |
| **Leverancier** | Contezza |
| **Technologie** | Angular (frontend), Java (backend) |
| **Systeem** | [[Systems/XENA-ZGW\|XENA-ZGW]] |
| **Status** | Production |

## Beschrijving

Tezza is een webbased zaakafhandelcomponent ontwikkeld door Contezza. Het biedt een gebruikersinterface voor medewerkers om zaken te behandelen binnen het Zaakgericht Werken platform. De applicatie is gebouwd met Angular voor de frontend en Java voor de backend-services.

**Functionaliteit:**
- Zaakbehandeling interface
- Documentweergave en -bewerking
- Taaklijsten en workflows
- Integratie met OpenZaak API's
- Rapportages en dashboards

## Benchmark Status

| Benchmark | Status | Opmerking |
|-----------|--------|-----------|
| CIS Benchmark | ❌ Niet beschikbaar | Geen CIS Benchmark voor Tezza |
| EXT-BM-Tezza | 📋 Gepland | Vendor-specifieke benchmark nodig |

> [!note] Vendor-afhankelijkheid
> Tezza is een closed-source product van Contezza. Security hardening is afhankelijk van leveranciersdocumentatie en configuratie-opties.

## Security Overwegingen

### Aandachtspunten

1. **Authenticatie** — Integratie met KeyCloak/EntraID
2. **Autorisatie** — Rolgebaseerde toegangscontrole
3. **Sessie-beheer** — Timeout en sessie-invalidatie
4. **Input validatie** — XSS en injection preventie
5. **Audit logging** — Gebruikersacties loggen
6. **Versleuteling** — HTTPS verplicht

### Leverancier Security

| Aspect | Beschikbaar |
|--------|-------------|
| Security hardening guide | ❓ Te verifiëren |
| Penetratietest rapport | ❓ Opvragen bij Contezza |
| SOC 2 / ISO 27001 | ❓ Opvragen bij Contezza |
| Vulnerability disclosure | ❓ Te verifiëren |

## Gerelateerde Componenten

```dataview
TABLE 
  component_type as "Type",
  status as "Status"
FROM "Components"
WHERE contains(systems, "XENA-ZGW") AND file.name != "Tezza"
SORT component_type ASC
```

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-02-10 | Initiële versie | @ciso |
