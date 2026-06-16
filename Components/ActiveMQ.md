---
id: "ActiveMQ"
type: component
name: "Apache ActiveMQ"
component_type: "Message Broker"
vendor: "Apache Software Foundation"
version: "5.18"
technology: "Java"
systems:
  - "XENA-ZGW"
status: "Production"
benchmark: "EXT-BM-ActiveMQ"
benchmark_status: "Planned"
classification: "BBN2"
owner: "Team Infrastructuur"
license: "Apache 2.0"
created: 2026-02-10
modified: 2026-02-10
tags:
  - component
  - messaging
  - jms
  - broker
  - apache
---

# Apache ActiveMQ

> Enterprise-grade message broker voor JMS messaging

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | ActiveMQ |
| **Type** | Message Broker |
| **Leverancier** | Apache Software Foundation |
| **Versie** | 5.18 (Classic) |
| **Technologie** | Java |
| **Licentie** | Apache 2.0 |
| **Systeem** | [[Systems/XENA-ZGW\|XENA-ZGW]] |
| **Status** | Production |

## Beschrijving

Apache ActiveMQ is een open-source message broker die JMS (Java Message Service) implementeert. Binnen XENA-ZGW wordt ActiveMQ gebruikt voor asynchrone messaging tussen componenten, met name voor Alfresco en andere Java-gebaseerde services.

**Ondersteunde Protocollen:**
- JMS 2.0
- AMQP 1.0
- STOMP
- MQTT
- OpenWire

**Functionaliteit:**
- Persistent messaging
- Message queues en topics
- Pub/sub en point-to-point
- Transactional messaging
- Clustering en high availability

## Benchmark Status

| Benchmark | Status | Opmerking |
|-----------|--------|-----------|
| CIS Benchmark | ❌ Niet beschikbaar | Geen CIS Benchmark voor ActiveMQ |
| Apache Docs | ✅ Beschikbaar | [activemq.apache.org/security](https://activemq.apache.org/security) |
| EXT-BM-ActiveMQ | 📋 Gepland | Te baseren op Apache security docs |

## Security Overwegingen

### ActiveMQ Security Features

1. **Authentication**
   - JAAS-gebaseerde authenticatie
   - LDAP integratie
   - SSL client certificaten

2. **Authorization**
   - Fine-grained destination-niveau ACL's
   - Per-queue/topic permissies
   - Plugin-based authorization

3. **Transport Security**
   - SSL/TLS voor alle connecties
   - Certificate-based mutual auth

4. **Management Security**
   - JMX security
   - Web console authenticatie
   - REST API beveiliging

### Security Hardening Checklist

| Categorie | Maatregel | Status |
|-----------|-----------|--------|
| Authentication | JAAS authenticatie enabled | ☐ |
| Authorization | Authorization plugin configured | ☐ |
| TLS | SSL/TLS voor OpenWire transport | ☐ |
| Web Console | Console authenticatie + HTTPS | ☐ |
| JMX | JMX authenticatie enabled | ☐ |
| Default Users | Default credentials gewijzigd | ☐ |
| Network | Firewalled, alleen noodzakelijke poorten | ☐ |
| Audit | Audit logging enabled | ☐ |

### Standaard Poorten

| Poort | Protocol | Gebruik |
|-------|----------|---------|
| 61616 | OpenWire | Default broker |
| 5672 | AMQP | AMQP clients |
| 61613 | STOMP | STOMP clients |
| 1883 | MQTT | MQTT clients |
| 8161 | HTTP | Web Console |

## Afhankelijkheden

| Component | Relatie | Opmerking |
|-----------|---------|-----------|
| Java Runtime | Runtime | JDK 11+ vereist |
| Alfresco | Consumer | Async document processing |

## Referenties

- [ActiveMQ Security](https://activemq.apache.org/security)
- [ActiveMQ SSL Configuration](https://activemq.apache.org/how-do-i-use-ssl)
- [ActiveMQ JAAS](https://activemq.apache.org/jaas)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-02-10 | Initiële versie | @ciso |
