---
id: "GZAC"
type: component
name: "GZAC (Valtimo)"
component_type: "Process/BPM"
vendor: "Ritense"
version: "latest"
technology: "Java/Kotlin/Camunda"
systems:
  - "XENA-ZGW"
status: "Production"
benchmark: "EXT-BM-GZAC"
benchmark_status: "Planned"
classification: "BBN2"
owner: "Team Dienstverlening"
license: "EUPL 1.2"
created: 2026-02-10
modified: 2026-02-10
tags:
  - component
  - bpm
  - process
  - zgw
  - common-ground
  - valtimo
  - camunda
---

# GZAC (Valtimo)

> Generieke Zaakafhandelcomponent voor procesautomatisering

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | GZAC |
| **Volledige Naam** | Generieke Zaakafhandelcomponent |
| **Type** | Process/BPM Engine |
| **Ontwikkelaar** | Ritense |
| **Product** | Valtimo (GZAC-editie) |
| **Licentie** | EUPL 1.2 (Open Source) |
| **Technologie** | Java, Kotlin, Camunda BPMN |
| **Systeem** | [[Systems/XENA-ZGW\|XENA-ZGW]] |
| **Status** | Production |

## Beschrijving

GZAC (Generieke Zaakafhandelcomponent) is de procesautomatiseringslaag binnen Common Ground voor Zaakgericht Werken. Het is gebaseerd op Valtimo, een open-source BPM-platform dat gebruik maakt van Camunda voor BPMN-procesexecutie.

**Functionaliteit:**
- BPMN-gebaseerde procesmodellering
- Taakbeheer en workflow
- Integratie met VNG ZGW API's
- Formulierenbouwer
- Plugin-architectuur voor uitbreidingen
- Procesmonitoring en rapportage

**Common Ground principes:**
- Component-gebaseerde architectuur
- Scheiding data- en applicatielaag
- Integratie via standaard API's

## Benchmark Status

| Benchmark | Status | Opmerking |
|-----------|--------|-----------|
| CIS Benchmark | ❌ Niet beschikbaar | Geen CIS Benchmark voor GZAC/Valtimo |
| Camunda Security | ✅ Beschikbaar | Camunda security documentation |
| GZAC Docs | ✅ Beschikbaar | [docs.gzac.nl](https://docs.gzac.nl/) |
| EXT-BM-GZAC | 📋 Gepland | Te baseren op docs + Camunda security |

## Security Overwegingen

### GZAC Security Features

1. **Authentication**
   - KeyCloak integratie (standaard)
   - OIDC/OAuth2 support
   - Multi-tenant capable

2. **Authorization**
   - Rolgebaseerde toegangscontrole
   - Proces-niveau permissies
   - Taak-assignatie regels

3. **Process Security**
   - Audit trail van procesacties
   - Versioning van procesmodellen
   - Rollback mogelijkheden

4. **Integration Security**
   - Secure API communicatie
   - Plugin sandboxing
   - Secrets management

### Security Hardening Aandachtspunten

| Categorie | Maatregel | Status |
|-----------|-----------|--------|
| KeyCloak | Correcte realm configuratie | ☐ |
| API Security | JWT token validatie | ☐ |
| HTTPS | TLS voor alle endpoints | ☐ |
| Secrets | Externe secrets manager | ☐ |
| Audit | Audit logging enabled | ☐ |
| Access | Minimale privileges per rol | ☐ |

## Afhankelijkheden

| Component | Relatie | Opmerking |
|-----------|---------|-----------|
| PostgreSQL | Database | Proces- en taakdata |
| KeyCloak | Identity | Authenticatie & autorisatie |
| OpenZaak | API | VNG ZGW API's |
| RabbitMQ | Messaging | Async taken |

## Community & Support

| Resource | Link |
|----------|------|
| Documentatie | [docs.gzac.nl](https://docs.gzac.nl/) |
| GitHub | [github.com/valtimo-platform](https://github.com/valtimo-platform) |
| Ontwikkelaar | [ritense.com](https://ritense.com/) |

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-02-10 | Initiële versie | @ciso |
