---
id: "EXT-BM-GZAC-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - GZAC/Valtimo"
technology: "GZAC/Valtimo"
version_range: "11.x+"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "Team Dienstverlening"
sources:
  - "Valtimo Documentation"
  - "Camunda Security Guide"
  - "Spring Security Best Practices"
  - "OWASP Web Application Security"
recommendations_count: 20
level_1_count: 15
level_2_count: 5
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - gzac
  - valtimo
  - camunda
  - bpm
  - common-ground
---

# Extended Benchmark: GZAC/Valtimo v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | GZAC (Valtimo) |
| **Versie Range** | 11.x+ |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 20 (15 L1, 5 L2) |
| **Bron** | [GZAC Docs](https://docs.gzac.nl/) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/GZAC\|GZAC]] |

---

## 1. Authentication (KeyCloak)

### GZ-1.1: KeyCloak integratie actief

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
GZAC is geconfigureerd met KeyCloak als identity provider via OIDC.

**Audit Procedure:**
```bash
# Check application.yml for KeyCloak config
grep -A 10 "keycloak:" application.yml

# Verify OIDC endpoints
curl https://gzac.example.com/.well-known/openid-configuration
```

**Remediation (application.yml):**
```yaml
spring:
  security:
    oauth2:
      resourceserver:
        jwt:
          issuer-uri: https://keycloak.example.com/realms/gzac
```

---

### GZ-1.2: JWT token validatie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
JWT tokens worden correct gevalideerd op signature, expiry en issuer.

**Audit Procedure:**
```bash
# Test with invalid token (should fail)
curl -H "Authorization: Bearer invalid" https://gzac.example.com/api/
```

---

### GZ-1.3: Token expiry geconfigureerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Access tokens hebben een korte levensduur (aanbevolen: 5-15 minuten).

**Audit Procedure:**
In KeyCloak admin console: Realm Settings → Tokens → Access Token Lifespan

---

### GZ-1.4: Refresh token rotation

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Refresh token rotation is ingeschakeld voor extra beveiliging.

---

## 2. Authorization

### GZ-2.1: Role-based access control

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
RBAC is geconfigureerd met specifieke rollen voor verschillende functies (behandelaar, beheerder, etc.).

**Audit Procedure:**
In KeyCloak: check Realm Roles en Client Roles voor GZAC.

---

### GZ-2.2: Case-level permissions

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Toegang tot zaken is beperkt op basis van zaaktype en rol.

---

### GZ-2.3: Task assignment security

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Taken kunnen alleen worden geclaimd en afgerond door geautoriseerde gebruikers.

---

## 3. Process Security (Camunda)

### GZ-3.1: Process definition deployment beperkt

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Alleen beheerders kunnen processdefinities deployen.

**Audit Procedure:**
Check deployment permissions in applicatie configuratie.

---

### GZ-3.2: Script task security

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Script tasks (Groovy/JavaScript) zijn beperkt of uitgeschakeld, of draaien in sandbox.

---

### GZ-3.3: External task handler authentication

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
External task handlers authenticeren zich bij het claimen van taken.

---

## 4. API Security

### GZ-4.1: API authenticatie verplicht

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Alle API endpoints vereisen authenticatie.

**Audit Procedure:**
```bash
# Test without auth (should fail)
curl -I https://gzac.example.com/api/v1/case
```

---

### GZ-4.2: HTTPS verplicht

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Alleen HTTPS is toegestaan, HTTP wordt geredirect of geblokkeerd.

---

### GZ-4.3: CORS restrictief

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
CORS is restrictief geconfigureerd voor alleen toegestane origins.

**Remediation (application.yml):**
```yaml
valtimo:
  cors:
    allowed-origins:
      - https://gzac.example.com
```

---

## 5. Integration Security

### GZ-5.1: OpenZaak integratie beveiligd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Communicatie met OpenZaak gebruikt JWT tokens en HTTPS.

---

### GZ-5.2: Secrets management

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
API keys en credentials worden opgeslagen in secrets (Kubernetes secrets, vault), niet in config files.

**Audit Procedure:**
```bash
# Check for hardcoded credentials
grep -r "password\|secret\|apiKey" application*.yml
```

---

### GZ-5.3: Plugin security review

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Custom plugins zijn gereviewd op security risico's voordat ze worden gedeployed.

---

## 6. Logging & Audit

### GZ-6.1: Audit logging enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Audit logging is ingeschakeld voor alle zaak- en taakacties.

---

### GZ-6.2: Process history retention

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Process history wordt bewaard voor audit doeleinden (conform archiefwet).

---

### GZ-6.3: Security event logging

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Security events (login failures, permission denied) worden gelogd.

---

## Complete Checklist

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| GZ-1.1 | KeyCloak integratie actief | L1 | ☐ |
| GZ-1.2 | JWT token validatie | L1 | ☐ |
| GZ-1.3 | Token expiry geconfigureerd | L1 | ☐ |
| GZ-1.4 | Refresh token rotation | L2 | ☐ |
| GZ-2.1 | Role-based access control | L1 | ☐ |
| GZ-2.2 | Case-level permissions | L1 | ☐ |
| GZ-2.3 | Task assignment security | L1 | ☐ |
| GZ-3.1 | Process deployment beperkt | L1 | ☐ |
| GZ-3.2 | Script task security | L1 | ☐ |
| GZ-3.3 | External task auth | L1 | ☐ |
| GZ-4.1 | API authenticatie verplicht | L1 | ☐ |
| GZ-4.2 | HTTPS verplicht | L1 | ☐ |
| GZ-4.3 | CORS restrictief | L1 | ☐ |
| GZ-5.1 | OpenZaak integratie beveiligd | L1 | ☐ |
| GZ-5.2 | Secrets management | L1 | ☐ |
| GZ-5.3 | Plugin security review | L2 | ☐ |
| GZ-6.1 | Audit logging enabled | L1 | ☐ |
| GZ-6.2 | Process history retention | L1 | ☐ |
| GZ-6.3 | Security event logging | L1 | ☐ |

---

## Bronnen

- [GZAC Documentation](https://docs.gzac.nl/)
- [Valtimo Documentation](https://docs.valtimo.nl/)
- [Camunda Security Guide](https://docs.camunda.org/manual/latest/user-guide/security/)
- [Spring Security](https://spring.io/projects/spring-security)

---

## Wijzigingshistorie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-02-10 | CISO | Initiële versie |
