---
id: "EXT-KeyCloak-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - KeyCloak"
technology: "KeyCloak"
technology_version: "24.0+"
benchmark_version: "1.0"
status: Active
last_review: 2026-01-30
next_review: 2027-01-30
owner: "Security Officer"
applies_to:
  - "[[Components/KeyCloak]]"
sources:
  - "KeyCloak Server Administration Guide"
  - "OWASP Authentication Cheat Sheet"
  - "CIS Controls v8"
recommendations_count: 15
created: 2026-01-30
modified: 2026-01-30
tags:
  - benchmark
  - extended
  - keycloak
  - iam
  - authentication
---

# Extended Benchmark: KeyCloak v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | KeyCloak |
| **Technologie Versie** | 24.0+ |
| **Benchmark Versie** | v1.0 |
| **Status** | Active |
| **Eigenaar** | Security Officer |
| **Laatste Review** | 2026-01-30 |
| **Volgende Review** | 2027-01-30 |
| **Aantal Recommendations** | 15 |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/KeyCloak]] |

---

## 1. Overzicht

### 1.1 Scope

Deze Extended Benchmark is van toepassing op:
- KeyCloak Server (standalone en clustered)
- KeyCloak Admin Console
- Realm configuratie
- Client (applicatie) configuratie
- User Federation (LDAP/AD)

### 1.2 Waarom een Extended Benchmark?

Er is geen officiële CIS Benchmark beschikbaar voor KeyCloak. Deze benchmark is ontwikkeld op basis van:

| Bron | Gebruik |
|------|---------|
| [KeyCloak Server Admin Guide](https://www.keycloak.org/docs/latest/server_admin/) | Primaire configuratie referentie |
| [OWASP Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html) | Authentication best practices |
| [OWASP Session Management](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html) | Session security |
| CIS Controls v8 | Control framework mapping |

### 1.3 Profiel Definities

| Profiel | Beschrijving | Implementation Group |
|---------|--------------|---------------------|
| **Basis** | Minimale security configuratie | IG1 |
| **Uitgebreid** | Defense-in-depth | IG2 |

---

## 2. Recommendations

### 2.1 Authenticatie

#### EXT-KC-2.1.1: Verplicht MFA voor Admin Console

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-6.5 - Eis MFA voor Beheerderstoegang\|CIS-6.5]] |
| **Bron** | KeyCloak Security Guide |

**Beschrijving:**
Multi-Factor Authentication moet verplicht zijn voor alle toegang tot de Admin Console.

**Rationale:**
De Admin Console geeft volledige controle over identity management. Compromittering heeft catastrophale gevolgen.

**Audit:**
1. Login op KeyCloak Admin Console
2. Ga naar **Realm Settings** → **Authentication**
3. Selecteer **Required Actions** tab
4. Controleer of "Configure OTP" is **enabled** en **default**

```bash
# Of via API
curl -X GET "https://keycloak.example.com/admin/realms/master/authentication/required-actions" \
  -H "Authorization: Bearer $TOKEN" | jq '.[] | select(.alias=="CONFIGURE_TOTP")'
```

**Remediation:**
1. Ga naar **Authentication** → **Required Actions**
2. Enable **Configure OTP**
3. Set als **Default Action**
4. Ga naar **Authentication** → **Flows** → **Browser**
5. Voeg **OTP Form** toe als required step

---

#### EXT-KC-2.1.2: Configureer sterke wachtwoord policies

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-5.2 - Gebruik Unieke Wachtwoorden\|CIS-5.2]] |
| **Bron** | OWASP Authentication Cheat Sheet |

**Beschrijving:**
Wachtwoord policies moeten voldoen aan moderne security standaarden.

**Rationale:**
Zwakke wachtwoorden zijn de meest voorkomende oorzaak van credential compromise.

**Audit:**
1. Ga naar **Realm Settings** → **Authentication** → **Policies** → **Password Policy**
2. Controleer minimale eisen:
   - Minimum Length: ≥12
   - Special Characters: ≥1
   - Uppercase: ≥1
   - Digits: ≥1
   - Not Username
   - Password History: ≥5

**Remediation:**
```
Password Policy configuratie:
- length(12)
- specialChars(1)
- upperCase(1)
- digits(1)
- notUsername
- passwordHistory(5)
- hashIterations(27500)
```

---

#### EXT-KC-2.1.3: Implementeer brute-force bescherming

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4.1]] |
| **Bron** | KeyCloak Security Guide |

**Beschrijving:**
Brute-force detection moet zijn ingeschakeld om wachtwoord guessing aanvallen te blokkeren.

**Audit:**
1. Ga naar **Realm Settings** → **Security Defenses** → **Brute Force Detection**
2. Controleer of **Enabled** is aangevinkt
3. Controleer settings:
   - Max Login Failures: ≤5
   - Wait Increment: ≥60 seconds
   - Max Wait: ≥15 minutes

**Remediation:**
```
Brute Force Detection Settings:
- Enabled: ON
- Permanent Lockout: OFF
- Max Login Failures: 5
- Wait Increment Seconds: 60
- Quick Login Check Milliseconds: 1000
- Minimum Quick Login Wait Seconds: 60
- Max Failure Wait Seconds: 900
- Failure Reset Time Seconds: 43200
```

---

### 2.2 Sessie Management

#### EXT-KC-2.2.1: Configureer session timeouts

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-4.3 - Configureer Automatische Sessievergrendeling\|CIS-4.3]] |
| **Bron** | OWASP Session Management |

**Beschrijving:**
SSO sessions en access tokens moeten redelijke timeouts hebben.

**Audit:**
1. Ga naar **Realm Settings** → **Sessions**
2. Controleer:
   - SSO Session Idle: ≤30 minutes
   - SSO Session Max: ≤10 hours
   - Access Token Lifespan: ≤5 minutes
   - Refresh Token Lifespan: ≤30 minutes

**Remediation:**
```
Session Settings:
- SSO Session Idle: 30 minutes
- SSO Session Max: 10 hours
- SSO Session Idle Remember Me: 30 days (indien nodig)
- SSO Session Max Remember Me: 30 days (indien nodig)

Token Settings:
- Access Token Lifespan: 5 minutes
- Access Token Lifespan For Implicit Flow: 15 minutes
- Client Session Idle: 30 minutes
- Client Session Max: 10 hours
```

---

#### EXT-KC-2.2.2: Activeer session revocation

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Uitgebreid |
| **CIS Control** | [[Controls/CIS/CIS-6.2 - Stel Toegangsintrekkingsproces Op\|CIS-6.2]] |
| **Bron** | KeyCloak Security Guide |

**Beschrijving:**
Admins moeten actieve sessions kunnen beëindigen bij security incidents.

**Audit:**
1. Ga naar **Users** → selecteer een user → **Sessions**
2. Controleer of "Sign Out" optie beschikbaar is
3. Test revocation via API:
```bash
curl -X POST "https://keycloak.example.com/admin/realms/{realm}/users/{userId}/logout" \
  -H "Authorization: Bearer $TOKEN"
```

**Remediation:**
Standaard beschikbaar in KeyCloak. Documenteer procedure voor:
- Individuele user logout
- Realm-wide session revocation
- Client-specific session revocation

---

### 2.3 Client Configuratie

#### EXT-KC-2.3.1: Gebruik PKCE voor public clients

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-16.10 - Pas Secure Design Toe\|CIS-16.10]] |
| **Bron** | OAuth 2.0 Security Best Practices |

**Beschrijving:**
Public clients (SPAs, mobile apps) moeten PKCE gebruiken voor authorization code flow.

**Audit:**
1. Ga naar **Clients** → selecteer client
2. Controleer **Access Type**: public
3. Controleer **Proof Key for Code Exchange Code Challenge Method**: S256

**Remediation:**
Voor elke public client:
1. Set **Access Type** to **public**
2. Enable **Standard Flow**
3. Set **Proof Key for Code Exchange Code Challenge Method** to **S256**
4. Disable **Direct Access Grants** (resource owner password)

---

#### EXT-KC-2.3.2: Beperk redirect URIs

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-16.10 - Pas Secure Design Toe\|CIS-16.10]] |
| **Bron** | OWASP OAuth Security |

**Beschrijving:**
Redirect URIs moeten exact gespecificeerd zijn, geen wildcards.

**Rationale:**
Open redirect vulnerabilities kunnen leiden tot token theft.

**Audit:**
1. Ga naar **Clients** → selecteer client → **Settings**
2. Controleer **Valid Redirect URIs**:
   - Geen wildcards (`*`)
   - Volledige URLs (incl. path)
   - HTTPS only (geen HTTP)

**Remediation:**
```
Valid Redirect URIs (voorbeeld):
✓ https://app.example.com/callback
✓ https://app.example.com/auth/callback

✗ https://app.example.com/*
✗ http://app.example.com/callback
✗ *
```

---

### 2.4 Encryptie

#### EXT-KC-2.4.1: Gebruik HTTPS voor alle endpoints

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |
| **Bron** | KeyCloak Installation Guide |

**Beschrijving:**
Alle KeyCloak endpoints moeten via HTTPS bereikbaar zijn.

**Audit:**
```bash
# Test HTTPS
curl -v https://keycloak.example.com/realms/master/.well-known/openid-configuration

# Controleer dat HTTP redirect naar HTTPS
curl -v http://keycloak.example.com 2>&1 | grep -i "location"
```

**Remediation:**
```bash
# In keycloak.conf
hostname-strict-https=true
http-enabled=false

# Of met proxy
proxy=edge
hostname-strict=false
```

---

#### EXT-KC-2.4.2: Configureer sterke signing algorithms

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |
| **Bron** | OIDC Security Best Practices |

**Beschrijving:**
JWT tokens moeten worden gesigned met sterke algorithms (RS256 of ES256).

**Audit:**
1. Ga naar **Realm Settings** → **Keys**
2. Controleer actieve signing keys:
   - Algorithm: RS256, RS384, RS512, ES256, ES384, ES512
   - NIET: HS256 (symmetric), none

**Remediation:**
1. Genereer nieuwe RSA of EC key pair
2. Set als active signing key
3. Disable legacy algorithms

---

### 2.5 Logging en Auditing

#### EXT-KC-2.5.1: Activeer event logging

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] |
| **Bron** | KeyCloak Admin Guide |

**Beschrijving:**
Login events en admin events moeten worden gelogd.

**Audit:**
1. Ga naar **Realm Settings** → **Events**
2. **Login Events Settings**:
   - Save Events: ON
   - Saved Types: LOGIN, LOGIN_ERROR, LOGOUT, etc.
3. **Admin Events Settings**:
   - Save Events: ON
   - Include Representation: ON

**Remediation:**
```
Login Events:
- Save Events: ON
- Expiration: 30 days
- Saved Types: LOGIN, LOGIN_ERROR, LOGOUT, REGISTER, 
  CODE_TO_TOKEN, CODE_TO_TOKEN_ERROR, CLIENT_LOGIN,
  CLIENT_LOGIN_ERROR, REFRESH_TOKEN, REFRESH_TOKEN_ERROR,
  LOGOUT_ERROR, IDENTITY_PROVIDER_LOGIN, etc.

Admin Events:
- Save Events: ON
- Include Representation: ON
- Expiration: 90 days
```

---

#### EXT-KC-2.5.2: Forward logs naar SIEM

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Uitgebreid |
| **CIS Control** | [[Controls/CIS/CIS-8.9 - Centraliseer Auditlogs\|CIS-8.9]] |
| **Bron** | Security Operations Best Practices |

**Beschrijving:**
KeyCloak logs moeten worden geforward naar centrale SIEM voor monitoring.

**Audit:**
```bash
# Controleer log configuratie
cat /opt/keycloak/conf/keycloak.conf | grep -i log

# Controleer externe log target
```

**Remediation:**
```bash
# In keycloak.conf - JSON logging voor parsing
log-console-format=json
log-console-level=INFO

# Forward via Filebeat/Fluentd naar Elasticsearch
```

---

### 2.6 Configuratie Hardening

#### EXT-KC-2.6.1: Disable ongebruikte features

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-4.8 - Verwijder Onnodige Services\|CIS-4.8]] |
| **Bron** | KeyCloak Security Guide |

**Beschrijving:**
Niet-gebruikte features en providers moeten worden uitgeschakeld.

**Audit:**
1. Controleer enabled providers:
```bash
/opt/keycloak/bin/kc.sh show-config | grep -i provider
```

2. Review realm features:
   - User Registration: alleen indien nodig
   - Forgot Password: alleen indien nodig
   - Remember Me: risk-based beslissing

**Remediation:**
```bash
# Disable unused features in keycloak.conf
features-disabled=account2,admin2,docker

# In Realm Settings
- User Registration: OFF (unless needed)
- Edit Username: OFF
- Login with Email: evaluate risk
```

---

#### EXT-KC-2.6.2: Beveilig Admin Console toegang

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Uitgebreid |
| **CIS Control** | [[Controls/CIS/CIS-12.2 - Stel Veilige Netwerkarchitectuur Op\|CIS-12.2]] |
| **Bron** | KeyCloak Deployment Guide |

**Beschrijving:**
Admin Console moet alleen toegankelijk zijn vanaf beheer netwerk.

**Audit:**
```bash
# Test toegang vanaf extern netwerk
curl -v https://keycloak.example.com/admin/

# Verwacht: 403 of geen route
```

**Remediation:**
```nginx
# NGINX reverse proxy - restrict admin
location /admin/ {
    allow 10.0.0.0/8;    # Management network
    deny all;
    proxy_pass http://keycloak:8080;
}

location /realms/ {
    # Public access for authentication
    proxy_pass http://keycloak:8080;
}
```

---

## 3. CIS Controls Mapping

### Mapping Matrix

| CIS Control | Recommendations | Profiel |
|-------------|-----------------|---------|
| [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] | 2.4.1, 2.4.2 | Basis |
| [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4.1]] | 2.1.3 | Basis |
| [[Controls/CIS/CIS-4.3 - Configureer Automatische Sessievergrendeling\|CIS-4.3]] | 2.2.1 | Basis |
| [[Controls/CIS/CIS-4.8 - Verwijder Onnodige Services\|CIS-4.8]] | 2.6.1 | Basis |
| [[Controls/CIS/CIS-5.2 - Gebruik Unieke Wachtwoorden\|CIS-5.2]] | 2.1.2 | Basis |
| [[Controls/CIS/CIS-6.2 - Stel Toegangsintrekkingsproces Op\|CIS-6.2]] | 2.2.2 | Uitgebreid |
| [[Controls/CIS/CIS-6.5 - Eis MFA voor Beheerderstoegang\|CIS-6.5]] | 2.1.1 | Basis |
| [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] | 2.5.1 | Basis |
| [[Controls/CIS/CIS-8.9 - Centraliseer Auditlogs\|CIS-8.9]] | 2.5.2 | Uitgebreid |
| [[Controls/CIS/CIS-12.2 - Stel Veilige Netwerkarchitectuur Op\|CIS-12.2]] | 2.6.2 | Uitgebreid |
| [[Controls/CIS/CIS-16.10 - Pas Secure Design Toe\|CIS-16.10]] | 2.3.1, 2.3.2 | Basis |

---

## 4. Implementatie Checklist

| # | Recommendation | Profiel | Status |
|---|----------------|---------|--------|
| 2.1.1 | MFA voor Admin Console | Basis | ☐ |
| 2.1.2 | Wachtwoord Policies | Basis | ☐ |
| 2.1.3 | Brute-force Bescherming | Basis | ☐ |
| 2.2.1 | Session Timeouts | Basis | ☐ |
| 2.2.2 | Session Revocation | Uitgebreid | ☐ |
| 2.3.1 | PKCE voor Public Clients | Basis | ☐ |
| 2.3.2 | Beperk Redirect URIs | Basis | ☐ |
| 2.4.1 | HTTPS Everywhere | Basis | ☐ |
| 2.4.2 | Strong Signing Algorithms | Basis | ☐ |
| 2.5.1 | Event Logging | Basis | ☐ |
| 2.5.2 | SIEM Integration | Uitgebreid | ☐ |
| 2.6.1 | Disable Unused Features | Basis | ☐ |
| 2.6.2 | Restrict Admin Access | Uitgebreid | ☐ |

---

## 5. Review Historie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-01-30 | Security Team | Initiële versie |

---

## 6. Bronnen

### Primaire Bronnen

- [KeyCloak Server Administration Guide](https://www.keycloak.org/docs/latest/server_admin/)
- [KeyCloak Security Guide](https://www.keycloak.org/docs/latest/server_admin/#security)
- [KeyCloak Threat Model](https://www.keycloak.org/docs/latest/server_admin/#threat-model-mitigation)

### Aanvullende Bronnen

- [OWASP Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)
- [OWASP Session Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html)
- [OAuth 2.0 Security Best Current Practice](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics)

---

## Gerelateerde Documenten

- [[Components/KeyCloak|KeyCloak Component]]
- [[Benchmarks/CIS/_index|CIS Benchmarks]] — Vergelijkbare officiële benchmarks
- [[Documentatie/CIS Benchmark Handleiding|Benchmark Handleiding]]
- [[Components/Saviynt|Saviynt]] — IGA integratie
