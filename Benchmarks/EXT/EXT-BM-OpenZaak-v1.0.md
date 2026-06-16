---
id: "EXT-BM-OpenZaak-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - OpenZaak"
technology: "OpenZaak"
version_range: "1.x"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "Team Dienstverlening"
sources:
  - "OpenZaak Documentation"
  - "Django Security Best Practices"
  - "VNG API Security Standards"
  - "OWASP Web Application Security"
recommendations_count: 22
level_1_count: 17
level_2_count: 5
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - openzaak
  - zgw
  - django
  - common-ground
---

# Extended Benchmark: OpenZaak v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | OpenZaak |
| **Versie Range** | 1.x |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 22 (17 L1, 5 L2) |
| **Bron** | [OpenZaak Docs](https://open-zaak.readthedocs.io/) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/OpenZaak\|OpenZaak]] |

---

## 1. Django Security Settings

### OZ-1.1: DEBUG uitgeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Django DEBUG mode is uitgeschakeld in productie.

**Audit Procedure:**
```bash
# Check environment variable
echo $DJANGO_DEBUG

# Or check settings
grep -i "DEBUG" /app/src/openzaak/conf/production.py
```

**Remediation:**
```bash
export DEBUG=False
# of in docker-compose:
DEBUG: "False"
```

---

### OZ-1.2: SECRET_KEY uniek en geheim

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Django SECRET_KEY is een unieke, cryptografisch sterke waarde, niet de default.

**Audit Procedure:**
```bash
# Verify SECRET_KEY is set
echo $SECRET_KEY | wc -c  # Should be > 50 characters

# Verify it's not a known default
echo $SECRET_KEY | grep -i "change\|secret\|default"
```

**Remediation:**
```bash
# Generate new secret key
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

---

### OZ-1.3: ALLOWED_HOSTS correct geconfigureerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
ALLOWED_HOSTS bevat alleen de toegestane hostnames, niet `*`.

**Audit Procedure:**
```bash
echo $ALLOWED_HOSTS
```

**Remediation:**
```bash
ALLOWED_HOSTS=openzaak.gemeente.nl,api.gemeente.nl
```

---

### OZ-1.4: HTTPS afgedwongen

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Django forceert HTTPS en zet security-gerelateerde cookies correct.

**Audit Procedure:**
```bash
# Check environment variables
echo $SECURE_SSL_REDIRECT
echo $SESSION_COOKIE_SECURE
echo $CSRF_COOKIE_SECURE
```

**Remediation:**
```bash
SECURE_SSL_REDIRECT=True
SESSION_COOKIE_SECURE=True
CSRF_COOKIE_SECURE=True
SECURE_HSTS_SECONDS=31536000
SECURE_HSTS_INCLUDE_SUBDOMAINS=True
```

---

### OZ-1.5: Security headers geconfigureerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Security headers zijn correct geconfigureerd (X-Frame-Options, X-Content-Type-Options, CSP).

**Audit Procedure:**
```bash
curl -I https://openzaak.example.com/
```

**Verwacht:**
```
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
Strict-Transport-Security: max-age=31536000
```

---

## 2. Authentication & Authorization

### OZ-2.1: API authenticatie verplicht

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Alle API endpoints vereisen authenticatie via JWT of API token.

**Audit Procedure:**
```bash
# Test without auth (should fail)
curl -I https://openzaak.example.com/zaken/api/v1/zaken
# Should return 401/403
```

---

### OZ-2.2: Autorisaties correct geconfigureerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
API autorisaties zijn geconfigureerd per applicatie en zaaktype. Geen wildcard permissions.

**Audit Procedure:**
Via OpenZaak admin: check Autorisaties per Applicatie.

---

### OZ-2.3: JWT token validatie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
JWT tokens worden correct gevalideerd (signature, expiry, issuer).

**Audit Procedure:**
```bash
# Test with expired token (should fail)
curl -H "Authorization: Bearer <expired_token>" https://openzaak.example.com/zaken/api/v1/zaken
```

---

### OZ-2.4: Admin interface beveiligd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Django admin interface is alleen toegankelijk via HTTPS en (optioneel) IP-restricted.

**Audit Procedure:**
```bash
# Check admin URL accessibility
curl -I https://openzaak.example.com/admin/
```

---

### OZ-2.5: Two-factor authentication voor admin

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Admin accounts hebben two-factor authentication ingeschakeld.

---

## 3. Database Security

### OZ-3.1: Database credentials in secrets

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Database credentials worden niet in plaintext opgeslagen maar via environment variables of secrets manager.

**Audit Procedure:**
```bash
# Check for hardcoded credentials
grep -r "PASSWORD" /app/src/ --include="*.py"
```

---

### OZ-3.2: Database connectie via TLS

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Verbinding met PostgreSQL database gebruikt TLS.

**Audit Procedure:**
```bash
# Check DATABASE_URL
echo $DATABASE_URL | grep "sslmode=require"
```

**Remediation:**
```bash
DATABASE_URL=postgresql://user:pass@host:5432/db?sslmode=require
```

---

## 4. API Security

### OZ-4.1: Rate limiting

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
API endpoints hebben rate limiting om abuse te voorkomen.

**Audit Procedure:**
```bash
# Test rate limiting (should get 429 after many requests)
for i in {1..100}; do curl -s -o /dev/null -w "%{http_code}" https://openzaak.example.com/api/; done
```

---

### OZ-4.2: Input validatie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
API input wordt gevalideerd conform VNG API specificaties.

---

### OZ-4.3: CORS correct geconfigureerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
CORS is restrictief geconfigureerd, niet `*`.

**Audit Procedure:**
```bash
curl -H "Origin: https://evil.com" -I https://openzaak.example.com/api/
# Should NOT have Access-Control-Allow-Origin: *
```

---

## 5. Logging & Monitoring

### OZ-5.1: Audit logging enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Audit logging is ingeschakeld voor API calls en admin acties.

**Audit Procedure:**
```bash
# Check logging configuration
echo $LOG_LEVEL
echo $LOG_REQUESTS
```

**Remediation:**
```bash
LOG_LEVEL=INFO
LOG_REQUESTS=True
```

---

### OZ-5.2: Sensitive data niet in logs

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Logs bevatten geen gevoelige data (BSN, wachtwoorden, tokens).

---

### OZ-5.3: Centralized logging

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Logs worden naar een centraal logging systeem gestuurd.

---

## 6. Container Security

### OZ-6.1: Non-root user

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Container draait als non-root user.

**Audit Procedure:**
```bash
docker exec openzaak whoami
# Should NOT be root
```

---

### OZ-6.2: Read-only filesystem

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Container heeft een read-only root filesystem (behalve noodzakelijke volumes).

---

### OZ-6.3: Resource limits

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Container heeft CPU en memory limits geconfigureerd.

---

## Complete Checklist

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| OZ-1.1 | DEBUG uitgeschakeld | L1 | ☐ |
| OZ-1.2 | SECRET_KEY uniek en geheim | L1 | ☐ |
| OZ-1.3 | ALLOWED_HOSTS correct | L1 | ☐ |
| OZ-1.4 | HTTPS afgedwongen | L1 | ☐ |
| OZ-1.5 | Security headers | L1 | ☐ |
| OZ-2.1 | API authenticatie verplicht | L1 | ☐ |
| OZ-2.2 | Autorisaties correct | L1 | ☐ |
| OZ-2.3 | JWT token validatie | L1 | ☐ |
| OZ-2.4 | Admin interface beveiligd | L1 | ☐ |
| OZ-2.5 | 2FA voor admin | L2 | ☐ |
| OZ-3.1 | Database credentials in secrets | L1 | ☐ |
| OZ-3.2 | Database connectie via TLS | L1 | ☐ |
| OZ-4.1 | Rate limiting | L1 | ☐ |
| OZ-4.2 | Input validatie | L1 | ☐ |
| OZ-4.3 | CORS correct | L1 | ☐ |
| OZ-5.1 | Audit logging enabled | L1 | ☐ |
| OZ-5.2 | Sensitive data niet in logs | L1 | ☐ |
| OZ-5.3 | Centralized logging | L1 | ☐ |
| OZ-6.1 | Non-root user | L1 | ☐ |
| OZ-6.2 | Read-only filesystem | L2 | ☐ |
| OZ-6.3 | Resource limits | L1 | ☐ |

---

## Bronnen

- [OpenZaak Documentation](https://open-zaak.readthedocs.io/)
- [Django Security](https://docs.djangoproject.com/en/4.2/topics/security/)
- [VNG API Security](https://vng-realisatie.github.io/gemma-zaken/)

---

## Wijzigingshistorie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-02-10 | CISO | Initiële versie |
