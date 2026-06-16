---
id: "RabbitMQ"
type: component
name: "RabbitMQ"
component_type: "Message Broker"
vendor: "VMware (Broadcom)"
version: "3.13"
technology: "Erlang"
systems:
  - "XENA-ZGW"
status: "Production"
benchmark: "EXT-BM-RabbitMQ"
benchmark_status: "Planned"
classification: "BBN2"
owner: "Team Infrastructuur"
license: "Mozilla Public License 2.0"
created: 2026-02-10
modified: 2026-02-10
tags:
  - component
  - messaging
  - amqp
  - broker
  - rabbitmq
---

# RabbitMQ

> AMQP message broker voor betrouwbare messaging

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | RabbitMQ |
| **Type** | Message Broker |
| **Leverancier** | VMware (Broadcom) |
| **Versie** | 3.13 |
| **Technologie** | Erlang/OTP |
| **Licentie** | Mozilla Public License 2.0 |
| **Systeem** | [[Systems/XENA-ZGW\|XENA-ZGW]] |
| **Status** | Production |

## Beschrijving

RabbitMQ is een open-source message broker die AMQP (Advanced Message Queuing Protocol) implementeert. Binnen XENA-ZGW wordt RabbitMQ gebruikt voor asynchrone communicatie tussen microservices, met name voor OpenZaak notificaties en GZAC event handling.

**Ondersteunde Protocollen:**
- AMQP 0-9-1
- AMQP 1.0
- MQTT 3.1.1
- STOMP 1.0-1.2

**Functionaliteit:**
- Reliable message delivery
- Flexible routing (exchanges)
- Message acknowledgements
- Publisher confirms
- Clustering en mirrored queues
- Management UI

## Benchmark Status

| Benchmark | Status | Opmerking |
|-----------|--------|-----------|
| CIS Benchmark | ❌ Niet beschikbaar | Geen CIS Benchmark voor RabbitMQ |
| RabbitMQ Docs | ✅ Beschikbaar | [rabbitmq.com/docs/security](https://www.rabbitmq.com/docs/security) |
| EXT-BM-RabbitMQ | 📋 Gepland | Te baseren op RabbitMQ security docs |

## Security Overwegingen

### RabbitMQ Security Features

1. **Authentication**
   - Internal database
   - LDAP backend
   - OAuth 2.0 / JWT
   - x509 certificates
   - Pluggable auth backends

2. **Authorization**
   - Virtual hosts voor isolatie
   - Fine-grained permissions (configure/write/read)
   - Topic-level authorization
   - Tag-based access control

3. **Transport Security**
   - TLS voor AMQP/HTTP/MQTT
   - Peer verification
   - Cipher suite configuratie

4. **Management Security**
   - Management UI authenticatie
   - API authenticatie
   - Per-user UI access

### Security Hardening Checklist

| Categorie | Maatregel | Status |
|-----------|-----------|--------|
| Authentication | Geen guest toegang van remote | ☐ |
| TLS | TLS enabled voor alle listeners | ☐ |
| Vhosts | Dedicated vhosts per applicatie | ☐ |
| Permissions | Minimale privileges per user | ☐ |
| Management | HTTPS voor management UI | ☐ |
| Network | Firewalled, port binding | ☐ |
| Credentials | Default guest password disabled | ☐ |
| Monitoring | Prometheus metrics secured | ☐ |

### Standaard Poorten

| Poort | Protocol | Gebruik |
|-------|----------|---------|
| 5672 | AMQP | Default AMQP |
| 5671 | AMQPS | AMQP over TLS |
| 15672 | HTTP | Management UI |
| 15671 | HTTPS | Management UI (TLS) |
| 25672 | Erlang | Clustering |

## Afhankelijkheden

| Component | Relatie | Opmerking |
|-----------|---------|-----------|
| Erlang/OTP | Runtime | Erlang 25+ vereist |
| OpenZaak | Publisher | Notificaties |
| GZAC | Consumer | Event handling |

## Referenties

- [RabbitMQ Security](https://www.rabbitmq.com/docs/security)
- [RabbitMQ TLS Support](https://www.rabbitmq.com/docs/ssl)
- [RabbitMQ Access Control](https://www.rabbitmq.com/docs/access-control)
- [RabbitMQ Production Checklist](https://www.rabbitmq.com/docs/production-checklist)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-02-10 | Initiële versie | @ciso |
