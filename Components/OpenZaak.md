---
id: "OpenZaak"
type: component
name: "OpenZaak"
component_type: "API Platform"
vendor: "Maykin Media (Open Source)"
version: "1.26"
technology: "Python/Django"
systems:
  - "XENA-ZGW"
status: "Production"
benchmark: "EXT-BM-OpenZaak"
benchmark_status: "Planned"
classification: "BBN2"
owner: "Team Dienstverlening"
license: "EUPL 1.2"
created: 2026-02-10
modified: 2026-02-10
tags:
  - component
  - api
  - zgw
  - common-ground
  - open-source
  - vng
---

# OpenZaak

> Open-source implementatie van de VNG API's voor Zaakgericht Werken

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | OpenZaak |
| **Type** | API Platform |
| **Ontwikkelaar** | Maykin Media B.V. |
| **Licentie** | EUPL 1.2 (Open Source) |
| **Versie** | 1.26 |
| **Technologie** | Python, Django |
| **Systeem** | [[Systems/XENA-ZGW\|XENA-ZGW]] |
| **Status** | Production |

## Beschrijving

OpenZaak is een moderne, open-source data- en servicelaag voor Zaakgericht Werken. Het implementeert de VNG-standaarden voor "API's voor Zaakgericht Werken" conform het Common Ground architectuurmodel.

**VNG API's geïmplementeerd:**
- Zaken API (ZRC)
- Documenten API (DRC)
- Catalogi API (ZTC)
- Besluiten API (BRC)
- Autorisaties API
- Notificaties API

**Kenmerken:**
- 100% VNG API-standaard compliant
- Container-native (Docker/Kubernetes)
- Horizontaal schaalbaar
- Uitgebreide admin interface

## Benchmark Status

| Benchmark | Status | Opmerking |
|-----------|--------|-----------|
| CIS Benchmark | ❌ Niet beschikbaar | Geen CIS Benchmark voor OpenZaak |
| OpenZaak Docs | ✅ Beschikbaar | [open-zaak.readthedocs.io](https://open-zaak.readthedocs.io/) |
| EXT-BM-OpenZaak | 📋 Gepland | Te baseren op docs + Django security |

## Security Overwegingen

### OpenZaak Security Features

1. **Authentication**
   - API token-based authenticatie
   - JWT support
   - Client credentials flow

2. **Authorization**
   - Fine-grained API autorisaties
   - Component-niveau permissies
   - Zaaktype-specifieke rechten

3. **Data Protection**
   - HTTPS verplicht voor productie
   - Database encryptie (PostgreSQL)

4. **Audit**
   - Uitgebreide audit logging
   - Notificaties bij wijzigingen

### Django Security Baseline

OpenZaak is gebouwd op Django, waardoor standaard Django security best practices van toepassing zijn:

| Categorie | Maatregel | Status |
|-----------|-----------|--------|
| HTTPS | `SECURE_SSL_REDIRECT=True` | ☐ |
| CSRF | CSRF protection enabled | ☐ |
| XSS | Content Security Policy | ☐ |
| Cookies | Secure + HttpOnly cookies | ☐ |
| Headers | Security headers (HSTS, etc.) | ☐ |
| DEBUG | `DEBUG=False` in productie | ☐ |
| SECRET_KEY | Unieke, geheime key | ☐ |

## Afhankelijkheden

| Component | Relatie | Opmerking |
|-----------|---------|-----------|
| PostgreSQL | Database | Verplichte database backend |
| Redis | Cache | Optioneel, aanbevolen |
| RabbitMQ | Notificaties | Async notificatie verzending |

## Community & Support

| Resource | Link |
|----------|------|
| Documentatie | [open-zaak.readthedocs.io](https://open-zaak.readthedocs.io/) |
| GitHub | [github.com/open-zaak/open-zaak](https://github.com/open-zaak/open-zaak) |
| Slack | Common Ground #open-zaak |
| Docker Hub | [openzaak/open-zaak](https://hub.docker.com/r/openzaak/open-zaak) |

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-02-10 | Initiële versie | @ciso |
