---
id: "SCB-XENA"
type: scb
name: "System Component Breakdown - XENA"
system: "[[Systems/XENA]]"
version: "1.0"
status: Active
architect: "Enterprise Architect"
created: 2026-01-28
modified: 2026-01-28
tags:
  - scb
  - architecture
  - xena
---

# System Component Breakdown: XENA

## Document Informatie

| Veld | Waarde |
|------|--------|
| **Systeem** | [[Systems/XENA]] |
| **Versie** | 1.0 |
| **Status** | Active |
| **Architect** | Enterprise Architect |
| **Laatst bijgewerkt** | 2026-01-28 |

## 1. Systeem Overzicht

### 1.1 Beschrijving

XENA is een Document Management System (DMS) gebouwd op Common Ground principes voor Nederlandse gemeenten. Het systeem biedt WebDAV-compatibele documentopslag, metadata beheer, en integratie met zaaksystemen via ZGW API's.

**Primaire functies:**
- Document opslag en retrieval via WebDAV protocol
- Metadata beheer en zoekfunctionaliteit
- Versiebeheer en audit trail
- Integratie met zaaksystemen (OpenZaak, GZAC)
- Delen en samenwerking

### 1.2 Classificatie

| Aspect | Classificatie | Toelichting |
|--------|---------------|-------------|
| **Beschikbaarheid** | Midden | Uitval < 8 uur acceptabel, workaround via lokale opslag |
| **Integriteit** | Hoog | Documenten moeten betrouwbaar en authentiek zijn |
| **Vertrouwelijkheid** | Hoog | Bevat vertrouwelijke gemeentelijke documenten en persoonsgegevens |
| **BIV Totaal** | **BBN2** | Baseline Beveiligingsniveau 2 |

### 1.3 Data Classificatie

| Data Type | Classificatie | Volume | Retentie |
|-----------|---------------|--------|----------|
| Zaakdocumenten | Vertrouwelijk | ~500GB | 7-20 jaar |
| Metadata | Intern | ~10GB | Levensduur document |
| Audit logs | Intern | ~50GB/jaar | 7 jaar |
| Gebruikersgegevens | Persoonsgegevens | ~1GB | Actief dienstverband |
| Sessie data | Tijdelijk | ~100MB | 24 uur |

## 2. Architectuur Diagram

### 2.1 Component Overzicht

![[Assets/diagrams/LISA-SCB-Structure.svg]]

### 2.2 Gedetailleerde Architectuur

![[Assets/diagrams/XENA-Architecture.svg]]

## 3. Component Inventaris

### 3.1 Component Overzicht

| # | Component | Type | Vendor | Versie | CIS Benchmark |
|---|-----------|------|--------|--------|---------------|
| 1 | NGINX | Reverse Proxy | NGINX Inc. | 1.24.x | ☑ Ja |
| 2 | Apache NiFi | Orchestration | Apache | 1.23.x | ☐ Nee |
| 3 | PostgreSQL | RDBMS | PostgreSQL | 15.x | ☑ Ja |
| 4 | MinIO | Object Storage | MinIO Inc. | 2024.x | ☐ Nee |
| 5 | Elasticsearch | Search Engine | Elastic | 8.x | ☑ Ja |
| 6 | KeyCloak | Identity Provider | Red Hat | 22.x | ☐ Nee |
| 7 | Saviynt | Identity Governance | Saviynt | SaaS | ☐ Nee |
| 8 | OpenBAO | Secret Management | OpenBAO | 2.x | ☐ Nee |

### 3.2 Component Details

#### Component 1: NGINX

| Eigenschap | Waarde |
|------------|--------|
| **Type** | Reverse Proxy / Load Balancer |
| **Vendor** | NGINX Inc. |
| **Versie** | 1.24.x |
| **Hostname** | xena-proxy.gemeente.local |
| **Poort(en)** | 443 (HTTPS), 80 (redirect) |
| **Protocol** | HTTPS/TLS 1.3 |
| **Authenticatie** | Certificate + Header forwarding |
| **SCF Document** | [[Components/NGINX]] |

**Functie:**
- TLS terminatie voor alle inkomend verkeer
- WebDAV protocol handling
- Load balancing naar backend services
- Rate limiting en DDoS bescherming
- Access logging

**Security Relevantie:**
- [x] Extern bereikbaar (DMZ)
- [x] TLS certificaat beheer
- [x] WAF functionaliteit
- [ ] Slaat geen gevoelige data op

**CIS Benchmark:** CIS NGINX Benchmark v2.0.0

---

#### Component 2: Apache NiFi

| Eigenschap | Waarde |
|------------|--------|
| **Type** | Data Orchestration / ETL |
| **Vendor** | Apache Foundation |
| **Versie** | 1.23.x |
| **Hostname** | xena-nifi.gemeente.local |
| **Poort(en)** | 8443 (HTTPS UI), 10443 (S2S) |
| **Protocol** | HTTPS |
| **Authenticatie** | OIDC via KeyCloak |
| **SCF Document** | [[Components/Apache-NiFi]] |

**Functie:**
- WebDAV request processing
- Document routing en transformatie
- Integratie met externe systemen
- Workflow orchestratie
- Audit event generatie

**Security Relevantie:**
- [x] Verwerkt alle documenten
- [x] Privileged access tot alle backends
- [x] Bevat credentials voor integraties
- [ ] Extern bereikbaar (alleen via NGINX)

**CIS Benchmark:** Niet beschikbaar - Extended Benchmark vereist

---

#### Component 3: PostgreSQL

| Eigenschap | Waarde |
|------------|--------|
| **Type** | Relational Database |
| **Vendor** | PostgreSQL Global Dev. Group |
| **Versie** | 15.x |
| **Hostname** | xena-db.gemeente.local |
| **Poort(en)** | 5432 |
| **Protocol** | PostgreSQL + TLS |
| **Authenticatie** | Certificate + Password |
| **SCF Document** | [[Components/PostgreSQL]] |

**Functie:**
- Document metadata opslag
- Gebruikers en rechten administratie
- Audit trail opslag
- Transactie logging

**Security Relevantie:**
- [x] Slaat gevoelige metadata op
- [x] Bevat persoonsgegevens
- [x] Audit trail bron
- [ ] Niet extern bereikbaar

**CIS Benchmark:** CIS PostgreSQL 15 Benchmark v1.0.0

---

#### Component 4: MinIO

| Eigenschap | Waarde |
|------------|--------|
| **Type** | Object Storage (S3-compatible) |
| **Vendor** | MinIO Inc. |
| **Versie** | 2024.x |
| **Hostname** | xena-storage.gemeente.local |
| **Poort(en)** | 9000 (API), 9001 (Console) |
| **Protocol** | HTTPS (S3 API) |
| **Authenticatie** | Access Key + Secret Key |
| **SCF Document** | [[Components/MinIO]] |

**Functie:**
- Document blob opslag
- Versioning van documenten
- Server-side encryption
- Bucket policies

**Security Relevantie:**
- [x] Slaat alle documenten op
- [x] Bevat vertrouwelijke content
- [x] Encryptie at-rest vereist
- [ ] Niet extern bereikbaar

**CIS Benchmark:** Niet beschikbaar - Extended Benchmark vereist (zie [[Documentatie/Benchmarks/EXT-MinIO]])

---

#### Component 5: Elasticsearch

| Eigenschap | Waarde |
|------------|--------|
| **Type** | Search Engine |
| **Vendor** | Elastic NV |
| **Versie** | 8.x |
| **Hostname** | xena-search.gemeente.local |
| **Poort(en)** | 9200 (API), 9300 (Cluster) |
| **Protocol** | HTTPS |
| **Authenticatie** | API Key + TLS |
| **SCF Document** | [[Components/Elasticsearch]] |

**Functie:**
- Full-text search op document metadata
- Document content indexering
- Faceted search
- Analytics

**Security Relevantie:**
- [x] Bevat geïndexeerde document content
- [x] Kan gevoelige data bevatten in index
- [ ] Niet extern bereikbaar
- [ ] Geen primaire data opslag

**CIS Benchmark:** CIS Elasticsearch Benchmark (beperkt beschikbaar)

---

#### Component 6: KeyCloak

| Eigenschap | Waarde |
|------------|--------|
| **Type** | Identity Provider / SSO |
| **Vendor** | Red Hat |
| **Versie** | 22.x |
| **Hostname** | auth.gemeente.local |
| **Poort(en)** | 443 |
| **Protocol** | HTTPS, OIDC, SAML |
| **Authenticatie** | Federated via EntraID |
| **SCF Document** | [[Components/KeyCloak]] |

**Functie:**
- Single Sign-On voor XENA
- OIDC token uitgifte
- Role-based access control
- MFA enforcement
- Federation met EntraID

**Security Relevantie:**
- [x] Kritiek voor authenticatie
- [x] MFA configuratie
- [x] Session management
- [x] Extern bereikbaar (authenticatie endpoint)

**CIS Benchmark:** Niet beschikbaar - Extended Benchmark vereist

---

#### Component 7: Saviynt

| Eigenschap | Waarde |
|------------|--------|
| **Type** | Identity Governance & Administration |
| **Vendor** | Saviynt |
| **Versie** | SaaS (current) |
| **Hostname** | gemeente.saviyntcloud.com |
| **Poort(en)** | 443 |
| **Protocol** | HTTPS, SCIM |
| **Authenticatie** | SAML SSO |
| **SCF Document** | [[Components/Saviynt]] |

**Functie:**
- Gebruikers lifecycle management
- Access request en approval workflows
- Periodic access reviews
- Compliance reporting
- Role mining en management

**Security Relevantie:**
- [x] Beheert alle gebruikerstoegang
- [x] Source of truth voor identiteiten
- [x] Audit trail voor access changes
- [x] SaaS - vendor managed security

**CIS Benchmark:** Niet beschikbaar (SaaS)

---

#### Component 8: OpenBAO

| Eigenschap | Waarde |
|------------|--------|
| **Type** | Secret Management |
| **Vendor** | OpenBAO (fork HashiCorp Vault) |
| **Versie** | 2.x |
| **Hostname** | xena-vault.gemeente.local |
| **Poort(en)** | 8200 |
| **Protocol** | HTTPS |
| **Authenticatie** | AppRole, Kubernetes Auth |
| **SCF Document** | [[Components/OpenBAO]] |

**Functie:**
- Credential management voor alle componenten
- Database credential rotation
- API key beheer
- Encryption key management voor MinIO
- PKI / Certificate management

**Security Relevantie:**
- [x] Kritiek - bevat alle secrets
- [x] Single point of failure voor credentials
- [x] Seal/unseal procedure
- [ ] Niet extern bereikbaar

**CIS Benchmark:** Niet beschikbaar - Extended Benchmark vereist

---

## 4. Data Flows

### 4.1 Interne Data Flows

| # | Van | Naar | Data Type | Protocol | Encryptie |
|---|-----|------|-----------|----------|-----------|
| 1 | NGINX | Apache NiFi | WebDAV requests | HTTPS | ☑ TLS 1.3 |
| 2 | Apache NiFi | PostgreSQL | Metadata CRUD | PostgreSQL | ☑ TLS |
| 3 | Apache NiFi | MinIO | Document CRUD | S3 API | ☑ TLS |
| 4 | Apache NiFi | Elasticsearch | Index updates | HTTPS | ☑ TLS |
| 5 | Apache NiFi | KeyCloak | Token validation | OIDC | ☑ TLS |
| 6 | All components | OpenBAO | Credential retrieval | HTTPS | ☑ TLS |
| 7 | KeyCloak | Saviynt | User sync | SCIM | ☑ TLS |

### 4.2 Externe Integraties

| Externe Partij | Richting | Data Type | Protocol | Authenticatie |
|----------------|----------|-----------|----------|---------------|
| EntraID | Inbound | SAML assertions | SAML 2.0 | Federation trust |
| OpenZaak | Bidirectional | Zaak/Document refs | ZGW API | mTLS + API key |
| GZAC | Bidirectional | Workflow events | REST | OAuth2 |
| SMTP Server | Outbound | Notificaties | SMTP/TLS | SASL |

### 4.3 Data Flow Diagram

*Zie het architectuurdiagram in sectie 2.2 voor een visuele weergave van de data flows tussen zones.*

## 5. Security Boundaries

### 5.1 Trust Zones

| Zone | Componenten | Trust Level | Controls |
|------|-------------|-------------|----------|
| **Internet** | End users | Untrusted | Firewall, WAF |
| **DMZ** | NGINX | Semi-trusted | TLS, Rate limiting |
| **Applicatie** | NiFi, KeyCloak, OpenBAO, ES, PG | Internal | Network policies, AuthN |
| **Data** | MinIO | Restricted | Encryption, Access logging |
| **Management** | Admin interfaces | Privileged | MFA, Bastion |

### 5.2 Network Segmentatie

| Segment | VLAN | Subnet | Firewall Rules |
|---------|------|--------|----------------|
| DMZ | 100 | 10.0.100.0/24 | Allow 443 inbound, restrict outbound |
| Application | 200 | 10.0.200.0/24 | Allow from DMZ, deny direct internet |
| Data | 300 | 10.0.300.0/24 | Allow from Application only |
| Management | 400 | 10.0.400.0/24 | Allow from VPN/bastion only |

## 6. Control Mapping per Component

### 6.1 CIS Benchmark Beschikbaarheid

| Component | CIS Benchmark | Versie | Status |
|-----------|---------------|--------|--------|
| NGINX | CIS NGINX Benchmark | 2.0.0 | ☑ Beschikbaar |
| Apache NiFi | - | - | ☐ Extended Benchmark nodig |
| PostgreSQL | CIS PostgreSQL Benchmark | 1.0.0 | ☑ Beschikbaar |
| MinIO | - | - | ☐ Extended Benchmark nodig |
| Elasticsearch | CIS Elasticsearch | 1.0.0 | ☑ Beschikbaar |
| KeyCloak | - | - | ☐ Extended Benchmark nodig |
| Saviynt | - | - | ☐ SaaS - Vendor controls |
| OpenBAO | - | - | ☐ Extended Benchmark nodig |

### 6.2 Control Toewijzing Matrix

| CIS Cat | Control Beschrijving | NGINX | NiFi | PG | MinIO | ES | KC | Sav | BAO |
|---------|---------------------|-------|------|-----|-------|-----|-----|-----|-----|
| **3** | Gegevensbescherming | | | | | | | | |
| 3.6 | Encrypt Data on Devices | ☐ | ☐ | ☐ | ☑ | ☐ | ☐ | ☐ | ☐ |
| 3.10 | Encrypt Data in Transit | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ |
| 3.11 | Encrypt Data at Rest | ☐ | ☐ | ☑ | ☑ | ☑ | ☐ | ☐ | ☑ |
| **4** | Secure Configuration | | | | | | | | |
| 4.1 | Secure Config Process | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ |
| 4.7 | Manage Default Accounts | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ |
| 4.8 | Disable Unnecessary Services | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☐ | ☑ |
| **5** | Accountbeheer | | | | | | | | |
| 5.1 | Account Inventory | ☐ | ☐ | ☑ | ☐ | ☐ | ☑ | ☑ | ☑ |
| 5.3 | Disable Dormant Accounts | ☐ | ☐ | ☑ | ☐ | ☐ | ☑ | ☑ | ☐ |
| 5.4 | Restrict Admin Privileges | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ |
| **6** | Access Control | | | | | | | | |
| 6.1 | Access Granting Process | ☐ | ☐ | ☐ | ☐ | ☐ | ☑ | ☑ | ☐ |
| 6.3 | MFA for External Apps | ☐ | ☐ | ☐ | ☐ | ☐ | ☑ | ☑ | ☐ |
| 6.5 | MFA for Admin Access | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ |
| **8** | Audit Logging | | | | | | | | |
| 8.2 | Collect Audit Logs | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ |
| 8.5 | Detailed Command Logs | ☐ | ☑ | ☑ | ☐ | ☐ | ☐ | ☐ | ☑ |
| 8.9 | Centralize Audit Logs | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ | ☑ |
| **11** | Gegevensherstel | | | | | | | | |
| 11.2 | Automated Backups | ☐ | ☑ | ☑ | ☑ | ☑ | ☑ | ☐ | ☑ |
| 11.3 | Protect Recovery Data | ☐ | ☑ | ☑ | ☑ | ☑ | ☑ | ☐ | ☑ |
| **16** | Application Security | | | | | | | | |
| 16.1 | Secure SDLC | ☐ | ☑ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |

**Legenda:** ☑ = Van toepassing, ☐ = Niet van toepassing

### 6.3 Bestaande Implementations

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  impl_status as "Status"
FROM "Implementations"
WHERE contains(file.name, "XENA")
SORT id ASC
```

### 6.4 Te Maken Implementations

Op basis van de control matrix zijn de volgende implementations nog nodig:

| Implementation ID | Component | Control | Prioriteit |
|-------------------|-----------|---------|------------|
| IMPL-XENA-NGINX-3.10 | NGINX | CIS-3.10 | IG1 |
| IMPL-XENA-NGINX-4.1 | NGINX | CIS-4.1 | IG1 |
| IMPL-XENA-NGINX-8.2 | NGINX | CIS-8.2 | IG1 |
| IMPL-XENA-Elasticsearch-3.11 | Elasticsearch | CIS-3.11 | IG1 |
| IMPL-XENA-Elasticsearch-8.2 | Elasticsearch | CIS-8.2 | IG1 |
| IMPL-XENA-OpenBAO-3.11 | OpenBAO | CIS-3.11 | IG1 |
| IMPL-XENA-OpenBAO-5.4 | OpenBAO | CIS-5.4 | IG1 |

## 7. Risico's

### 7.1 Geïdentificeerde Risico's

| ID | Risico | Component(en) | Impact | Likelihood | Mitigerende Controls |
|----|--------|---------------|--------|------------|---------------------|
| [[Risks/RSK-001]] | Data breach onversleutelde opslag | MinIO, PostgreSQL | Hoog | Medium | CIS-3.6, CIS-3.11 |
| [[Risks/RSK-002]] | Ongeautoriseerde toegang | KeyCloak, Saviynt | Hoog | Medium | CIS-6.3, CIS-6.5 |
| [[Risks/RSK-003]] | Credential compromise | OpenBAO | Kritiek | Laag | CIS-5.4, Rotation |
| [[Risks/RSK-004]] | Audit trail manipulation | PostgreSQL, NiFi | Medium | Laag | CIS-8.9, WORM |
| [[Risks/RSK-005]] | Service interruption | NGINX, NiFi | Medium | Medium | CIS-11.2, HA |

### 7.2 Privacy Risico's

| Risico | Data Type | Impact | DPIA Vereist |
|--------|-----------|--------|--------------|
| Ongeautoriseerde inzage documenten | Persoonsgegevens | Hoog | ☑ Ja |
| Logging van gebruikersgedrag | Gedragsgegevens | Medium | ☑ Ja |
| Data retention overschrijding | Persoonsgegevens | Medium | ☑ Ja |

**DPIA Status:** Uitgevoerd op 2025-06-15, review gepland Q2 2026

## 8. Implementatie Checklist

### 8.1 Onboarding Compleet

- [x] Systeem document aangemaakt
- [x] Alle componenten gedocumenteerd
- [x] SCB document compleet
- [x] Control mapping uitgevoerd
- [x] Basis implementations aangemaakt (6 stuks)
- [x] Risico's geïdentificeerd (5 stuks)
- [x] Privacy controls geadresseerd
- [x] Security Officer review
- [x] CISO goedkeuring

### 8.2 Operationeel

- [x] Baseline Self-Assessment uitgevoerd (Q1 2026)
- [x] Monitoring actief
- [x] Incident response procedures bekend
- [x] Vulnerability scan uitgevoerd

## 9. Bijlagen

### 9.1 Referenties

| Document | Locatie |
|----------|---------|
| Architectuur Diagram (Draw.io) | SharePoint/XENA/Architecture |
| CIS PostgreSQL Benchmark | /Benchmarks/CIS-PostgreSQL-15.pdf |
| CIS NGINX Benchmark | /Benchmarks/CIS-NGINX-2.0.pdf |
| MinIO Security Guide | https://min.io/docs/security |
| KeyCloak Security Guide | https://keycloak.org/security |

### 9.2 Gerelateerde SCF Documenten

- [[Systems/XENA|XENA System Document]]
- [[Audits/2026/IA-2026-001-XENA/_IA-2026-001-XENA|Interne Audit XENA]]

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 1.0 | 2026-01-28 | Enterprise Architect | Initiële versie |
