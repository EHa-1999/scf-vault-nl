---
id: "Alfresco"
type: component
name: "Alfresco Content Services"
component_type: "DMS"
vendor: "Hyland (Alfresco)"
version: "7.4"
technology: "Java/Spring"
systems:
  - "XENA-ZGW"
status: "Production"
benchmark: "EXT-BM-Alfresco"
benchmark_status: "Planned"
classification: "BBN2"
owner: "Team Informatiebeheer"
created: 2026-02-10
modified: 2026-02-10
tags:
  - component
  - dms
  - ecm
  - zgw
  - alfresco
---

# Alfresco Content Services

> Enterprise Content Management platform voor documentbeheer

## Overzicht

| Eigenschap | Waarde |
|------------|--------|
| **Component ID** | Alfresco |
| **Type** | Document Management System (DMS) |
| **Leverancier** | Hyland (voorheen Alfresco Software) |
| **Versie** | 7.4 |
| **Technologie** | Java, Spring Framework |
| **Systeem** | [[Systems/XENA-ZGW\|XENA-ZGW]] |
| **Status** | Production |

## Beschrijving

Alfresco Content Services is een open-source Enterprise Content Management (ECM) platform dat binnen XENA-ZGW fungeert als Document Repository Component (DRC). Het implementeert de VNG Documenten API en biedt:

**Functionaliteit:**
- Documentopslag en versiebeheer
- Metadata-beheer en classificatie
- Full-text zoeken via Solr/Elasticsearch
- CMIS-compatibiliteit
- Records Management (optioneel)
- Workflow integratie

## Benchmark Status

| Benchmark | Status | Opmerking |
|-----------|--------|-----------|
| CIS Benchmark | ❌ Niet beschikbaar | Geen CIS Benchmark voor Alfresco |
| Alfresco Security Guide | ✅ Beschikbaar | [Alfresco Docs](https://docs.alfresco.com/content-services/latest/admin/securing-install/) |
| EXT-BM-Alfresco | 📋 Gepland | Te baseren op Alfresco Security Guide |

## Security Overwegingen

### Alfresco Security Componenten

Volgens de [Alfresco Security Documentation](https://docs.alfresco.com/content-services/7.4/admin/securing-install/):

1. **Network Security**
   - Firewall configuratie
   - SSL/TLS voor alle communicatie
   - Proxy configuratie (NGINX/HAProxy)

2. **Authentication**
   - LDAP/Active Directory integratie
   - SSO via SAML/OAuth
   - Wachtwoordbeleid

3. **Authorization**
   - ACL-gebaseerde toegangscontrole
   - Rolgebaseerde permissies
   - Inhoudsgebaseerde security

4. **Data Protection**
   - Encryptie at rest (keystore)
   - Encryptie in transit (TLS)
   - Secure cookies

5. **Audit**
   - Uitgebreide audit logging
   - Activiteitsmonitoring

### Hardening Checklist (High-Level)

| Categorie | Maatregel | Status |
|-----------|-----------|--------|
| SSL/TLS | HTTPS voor alle endpoints | ☐ |
| Authentication | LDAP/SSO integratie | ☐ |
| Default accounts | Admin wachtwoord gewijzigd | ☐ |
| Guest access | Guest user uitgeschakeld | ☐ |
| Solr security | Certificaat-authenticatie | ☐ |
| API security | API URL's beveiligd | ☐ |
| Audit | Audit logging ingeschakeld | ☐ |
| Session | Session timeout geconfigureerd | ☐ |

## Afhankelijkheden

| Component | Relatie | Opmerking |
|-----------|---------|-----------|
| PostgreSQL | Database | Alfresco content store metadata |
| ActiveMQ | Messaging | Async processing |
| Solr/Elasticsearch | Search | Full-text indexering |

## Gerelateerde Documenten

- [[Benchmarks/EXT/EXT-BM-Alfresco-v1.0\|EXT-BM-Alfresco]] (gepland)
- [Alfresco Security Documentation](https://docs.alfresco.com/content-services/latest/admin/securing-install/)

## Wijzigingshistorie

| Datum | Wijziging | Door |
|-------|-----------|------|
| 2026-02-10 | Initiële versie | @ciso |
