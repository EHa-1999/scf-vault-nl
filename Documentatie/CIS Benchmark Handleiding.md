---
id: "DOC-Benchmark-Mapping"
type: documentation
name: "CIS Benchmark Handleiding"
created: 2026-01-28
modified: 2026-01-29
tags:
  - documentatie
  - benchmark
  - controls
---

# CIS Benchmark Handleiding

## Doel

Deze handleiding beschrijft hoe CIS Benchmarks worden gebruikt om controls toe te wijzen aan componenten, en wat te doen wanneer er geen benchmark beschikbaar is.

## Wat is een CIS Benchmark?

Een CIS Benchmark is een gedetailleerde hardening guide voor een specifieke technologie (bijv. PostgreSQL, NGINX, Kubernetes). Deze bevat:

- Specifieke configuratie-instellingen
- Audit procedures (hoe te controleren)
- Remediation stappen (hoe te fixen)
- Mapping naar CIS Controls v8

**Relatie met CIS Controls:**

```
CIS Controls v8          CIS Benchmark
(WAT te doen)            (HOE te doen)
─────────────            ────────────
CIS-3.11: Encrypt        PostgreSQL Benchmark 4.2:
Data at Rest      ──────▶ "Ensure TDE is enabled"
                         - Audit: SELECT name FROM pg_settings...
                         - Remediation: ALTER SYSTEM SET...
```

---

## Beschikbare CIS Benchmarks

### Overzicht per Categorie

| Categorie | Technologieën met Benchmark |
|-----------|----------------------------|
| **Databases** | PostgreSQL, MySQL, MariaDB, MongoDB, Oracle, SQL Server, Redis |
| **Operating Systems** | Ubuntu, Debian, RHEL, CentOS, Windows Server, macOS |
| **Cloud Platforms** | AWS (per service), Azure, GCP, Oracle Cloud |
| **Containers** | Docker, Kubernetes, OpenShift |
| **Web Servers** | Apache HTTP, NGINX, IIS |
| **Application Servers** | Apache Tomcat, JBoss/WildFly |
| **Virtualization** | VMware ESXi, Hyper-V |
| **Network** | Cisco IOS, Palo Alto, Juniper |
| **Desktop** | Windows 10/11, macOS, Chrome |
| **Productivity** | Microsoft 365, Google Workspace |

### Download Locatie

- **CIS Website:** https://www.cisecurity.org/cis-benchmarks
- **CIS WorkBench:** https://workbench.cisecurity.org/ (gratis account vereist)

---

## Benchmark Mapping Proces

![[Assets/diagrams/LISA-Benchmark-Mapping-Flow.svg]]

### Stap 1: Identificeer de Benchmark

Zoek de juiste benchmark voor je component:

| Component Type | Zoekterm | Voorbeeld Benchmark |
|----------------|----------|---------------------|
| PostgreSQL 15 | "postgresql" | CIS PostgreSQL 15 Benchmark v1.0.0 |
| Ubuntu 22.04 | "ubuntu" | CIS Ubuntu Linux 22.04 LTS Benchmark |
| Kubernetes 1.27 | "kubernetes" | CIS Kubernetes V1.27 Benchmark |

### Stap 2: Analyseer de Benchmark Structuur

Een typische CIS Benchmark bevat:

```
1. Overview
2. Recommendations
   2.1 Installation and Patches
   2.2 Directory and File Permissions
   2.3 Logging
   2.4 User Accounts
   2.5 Network
   2.6 Cryptography
   ...
3. Appendix - CIS Controls Mapping
```

### Stap 3: Gebruik de CIS Controls Mapping

Elke recommendation in de benchmark is gemapt naar CIS Controls:

**Voorbeeld uit PostgreSQL Benchmark:**

| # | Recommendation | CIS Control |
|---|----------------|-------------|
| 2.1 | Ensure the latest patches are installed | 7.4 |
| 3.1 | Ensure the log destination is configured | 8.2 |
| 4.2 | Ensure TDE is enabled | 3.11 |
| 6.1 | Ensure the default admin account is disabled | 4.7 |
| 6.8 | Ensure excessive privileges are not granted | 6.8 |

### Stap 4: Maak Implementation Documents

Voor elke relevante recommendation:

1. **Creëer Implementation:** `IMPL-{System}-{Component}-{CIS Control}`
2. **Kopieer de DoD** uit de benchmark:
   - Audit procedure → Verificatie criteria
   - Remediation → Implementatie stappen
3. **Link naar Control:** `[[Controls/CIS/CIS-{x.y}]]`

**Voorbeeld Implementation DoD:**

```markdown
## Definition of Done

Gebaseerd op CIS PostgreSQL Benchmark 4.2:

- [ ] TDE is ingeschakeld voor alle databases
- [ ] Audit: `SELECT name, setting FROM pg_settings WHERE name = 'ssl';` 
      toont 'on'
- [ ] Encryptie algoritme is minimaal AES-256
- [ ] Key rotation is geconfigureerd
```

---

## Geen Benchmark Beschikbaar

### Situaties zonder Benchmark

Niet alle technologieën hebben een CIS Benchmark:

| Categorie | Voorbeelden zonder Benchmark |
|-----------|------------------------------|
| **Middleware** | Apache NiFi, Apache Kafka |
| **IAM** | KeyCloak, Okta, Auth0 |
| **Secret Management** | HashiCorp Vault, OpenBAO |
| **Object Storage** | MinIO, SeaweedFS |
| **Custom Applications** | Alle zelfgebouwde applicaties |

### Extended Benchmark Ontwikkelen

Wanneer er geen CIS Benchmark is, ontwikkel je een "Extended Benchmark":

#### Bronnen voor Extended Benchmarks

| Bron | Gebruik voor |
|------|--------------|
| **Vendor Security Guide** | Primaire bron voor configuratie |
| **OWASP Guidelines** | Web applicaties |
| **NIST 800-53** | Mapping naar controls |
| **STIGs (DoD)** | Uitgebreide hardening guides |
| **Vendor CVEs** | Bekende kwetsbaarheden |

#### Extended Benchmark Template

Maak een document in `Documentatie/Benchmarks/EXT-{Component}.md`:

```markdown
# Extended Benchmark: {Component}

## 1. Overzicht

| Veld | Waarde |
|------|--------|
| Component | {naam} |
| Versie | {versie} |
| Laatste update | {datum} |
| Bronnen | Vendor Guide, OWASP, etc. |

## 2. Recommendations

### 2.1 {Categorie}

#### EXT-{n}: {Recommendation naam}

**Beschrijving:** 
{Wat moet worden geconfigureerd}

**Rationale:**
{Waarom is dit belangrijk}

**Audit:**
{Hoe te controleren}

**Remediation:**
{Hoe te implementeren}

**CIS Control Mapping:** CIS-{x.y}

**Bronnen:**
- {link naar vendor documentatie}
```

#### Voorbeeld: Extended Benchmark KeyCloak

```markdown
# Extended Benchmark: KeyCloak

## 2. Recommendations

### 2.1 Authentication

#### EXT-1: Enforce MFA for Admin Console

**Beschrijving:** 
MFA moet verplicht zijn voor toegang tot de admin console.

**Audit:**
1. Login op admin console
2. Ga naar Authentication → Required Actions
3. Controleer of "Configure OTP" is enabled en default

**Remediation:**
1. Ga naar Authentication → Required Actions
2. Selecteer "Configure OTP"  
3. Enable en set as default

**CIS Control Mapping:** CIS-6.5

**Bronnen:**
- https://www.keycloak.org/docs/latest/server_admin/#otp-policies
```

---

## Control-Component Matrix Invullen

### Welke Controls zijn van toepassing?

Gebruik dit decision framework:

| Vraag | Ja → Controls |
|-------|---------------|
| Slaat het component data op? | CIS 3 (Gegevensbescherming), CIS 11 (Recovery) |
| Heeft het component user accounts? | CIS 5 (Account Mgmt), CIS 6 (Access Control) |
| Draait het software die gepatched moet worden? | CIS 7 (Vulnerability Mgmt) |
| Genereert het security-relevante events? | CIS 8 (Audit Logging) |
| Is het een custom applicatie? | CIS 16 (Application Security) |
| Is het extern bereikbaar? | CIS 12 (Network), CIS 13 (Monitoring) |
| Is het een SaaS/externe service? | CIS 15 (Service Provider Mgmt) |

### Voorbeeld Matrix

| Component | 3 | 4 | 5 | 6 | 7 | 8 | 11 | 12 | 13 | 16 |
|-----------|---|---|---|---|---|---|----|----|----|----|
| PostgreSQL | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | | ✓ | |
| MinIO | ✓ | ✓ | | | ✓ | ✓ | ✓ | | ✓ | |
| KeyCloak | | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | | | |
| Custom API | | ✓ | | ✓ | ✓ | ✓ | | | ✓ | ✓ |

---

## Best Practices

### Do's

- ✅ Download altijd de meest recente benchmark versie
- ✅ Controleer de benchmark versie tegen je component versie
- ✅ Gebruik de benchmark audit procedures letterlijk in je DoD
- ✅ Documenteer afwijkingen met onderbouwing
- ✅ Review benchmarks bij major version upgrades

### Don'ts

- ❌ Negeer recommendations zonder gedocumenteerde reden
- ❌ Gebruik verouderde benchmark versies
- ❌ Kopieer recommendations zonder te begrijpen wat ze doen
- ❌ Vergeet de benchmark te herevalueren bij upgrades

---

## Referenties

### CIS Resources
- [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks)
- [CIS Controls v8](https://www.cisecurity.org/controls)
- [CIS WorkBench](https://workbench.cisecurity.org/)

### Vendor Security Guides
- [PostgreSQL Security](https://www.postgresql.org/docs/current/security.html)
- [MinIO Security](https://min.io/docs/minio/linux/operations/security.html)
- [KeyCloak Security](https://www.keycloak.org/docs/latest/server_admin/#security)
- [NGINX Security](https://docs.nginx.com/nginx/admin-guide/security-controls/)

### Gerelateerde SCF Documenten
- [[Documentatie/Systeem Onboarding Procedure|Systeem Onboarding Procedure]]
- [[Frameworks/LISA/4-LISA-Controls|LISA Controls]]
