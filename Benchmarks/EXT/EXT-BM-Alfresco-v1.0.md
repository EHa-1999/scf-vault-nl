---
id: "EXT-BM-Alfresco-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - Alfresco Content Services"
technology: "Alfresco"
version_range: "7.x"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "Team Informatiebeheer"
sources:
  - "Alfresco Security Best Practices Guide"
  - "Alfresco Content Services Documentation"
  - "OWASP Web Application Security"
recommendations_count: 26
level_1_count: 20
level_2_count: 6
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - alfresco
  - dms
  - ecm
---

# Extended Benchmark: Alfresco Content Services v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | Alfresco Content Services |
| **Versie Range** | 7.x |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 26 (20 L1, 6 L2) |
| **Bron** | [Alfresco Security Docs](https://docs.alfresco.com/content-services/latest/admin/securing-install/) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/Alfresco\|Alfresco]] |

---

## 1. Network & Transport Security

### ALF-1.1: HTTPS voor alle endpoints

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Alle Alfresco endpoints (Share, Repository, WebDAV, API) zijn alleen toegankelijk via HTTPS.

**Audit Procedure:**
```bash
# Check alfresco-global.properties
grep -i "protocol" alfresco-global.properties

# Check for HTTP redirect in proxy
curl -I http://alfresco.example.com
```

**Remediation (alfresco-global.properties):**
```
alfresco.protocol=https
alfresco.port=443
share.protocol=https
share.port=443
```

**Bron:** [Configure SSL](https://docs.alfresco.com/content-services/latest/config/repository/#configure-ssl-for-a-production-environment)

---

### ALF-1.2: Reverse proxy voor frontend

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Een reverse proxy (NGINX, HAProxy) staat voor Alfresco voor SSL termination en security headers.

**Audit Procedure:**
```bash
# Verify proxy headers
curl -I https://alfresco.example.com

# Check for security headers
curl -s -D - https://alfresco.example.com -o /dev/null | grep -i "strict\|x-frame\|x-content"
```

**Verwachte Headers:**
```
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Frame-Options: SAMEORIGIN
X-Content-Type-Options: nosniff
```

---

### ALF-1.3: Tomcat AJP uitgeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
AJP connector (poort 8009) is uitgeschakeld tenzij specifiek nodig.

**Audit Procedure:**
```bash
# Check Tomcat server.xml for AJP
grep -i "AJP" tomcat/conf/server.xml
```

**Remediation:** Comment out of verwijder AJP connector in server.xml.

---

## 2. Authentication

### ALF-2.1: Default admin wachtwoord gewijzigd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Het standaard admin wachtwoord is gewijzigd naar een sterk wachtwoord.

**Audit Procedure:**
```bash
# Test default password (should fail)
curl -u admin:admin https://alfresco.example.com/alfresco/api/-default-/public/alfresco/versions/1/people/admin
```

---

### ALF-2.2: Guest access uitgeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Guest user is uitgeschakeld om anonieme toegang te voorkomen.

**Audit Procedure:**
```bash
grep -i "guest" alfresco-global.properties
```

**Remediation:**
```
alfresco.authentication.allowGuestLogin=false
```

---

### ALF-2.3: LDAP/AD integratie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]], [[Controls/CIS/CIS-6\|CIS-6]] |

**Beschrijving:**
Authenticatie is gekoppeld aan LDAP of Active Directory voor centraal gebruikersbeheer.

**Audit Procedure:**
```bash
grep -i "ldap\|authentication" alfresco-global.properties
```

**Remediation:**
```
authentication.chain=alfrescoNtlm1:alfrescoNtlm,ldap1:ldap
```

---

### ALF-2.4: Session timeout geconfigureerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Session timeout is ingesteld (aanbevolen: 30 minuten of minder).

**Audit Procedure:**
```bash
grep -i "ticket.expire" alfresco-global.properties
```

**Remediation:**
```
authentication.ticket.ticketsExpire=true
authentication.ticket.expiryMode=AFTER_INACTIVITY
authentication.ticket.validDuration=PT30M
```

---

## 3. Authorization

### ALF-3.1: Permissies correct toegepast

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
ACL's zijn correct toegepast met minimale privileges. Geen onnodige "Everyone" permissions.

**Audit Procedure:**
Via Share Admin Console of API:
```bash
curl -u admin:password https://alfresco.example.com/alfresco/api/-default-/public/alfresco/versions/1/nodes/{nodeId}/permissions
```

---

### ALF-3.2: Site-gebaseerde toegangscontrole

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Gevoelige content is georganiseerd in private Sites met specifieke membership.

---

## 4. Solr Security

### ALF-4.1: Solr communicatie beveiligd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Communicatie tussen Alfresco Repository en Solr gebruikt mTLS met custom certificaten.

**Audit Procedure:**
```bash
# Check Solr security mode
grep -i "solr.secureComms" alfresco-global.properties
```

**Remediation:**
```
solr.secureComms=https
```

**Bron:** [Search Services Security](https://docs.alfresco.com/search-services/latest/admin/security/)

---

### ALF-4.2: Solr certificaten gegenereerd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Default Alfresco-gegenereerde certificaten zijn vervangen door custom certificaten.

**Audit Procedure:**
```bash
# Check certificate expiry and issuer
openssl s_client -connect localhost:8983 </dev/null 2>/dev/null | openssl x509 -noout -issuer -dates
```

---

### ALF-4.3: Solr port niet extern toegankelijk

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-13\|CIS-13]] Network Monitoring |

**Beschrijving:**
Solr poort (8983) is alleen toegankelijk vanaf Alfresco server(s).

**Audit Procedure:**
```bash
# Check firewall rules
iptables -L -n | grep 8983
```

---

## 5. Content Security

### ALF-5.1: Content encryption at rest

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Gevoelige properties zijn versleuteld in de database via Alfresco keystore.

**Audit Procedure:**
```bash
# Check for encrypted properties
grep -i "encryption" alfresco-global.properties

# Verify keystore
ls -la keystore/
```

**Bron:** [Managing Keystores](https://docs.alfresco.com/content-services/latest/admin/security/#managing-alfresco-keystores)

---

### ALF-5.2: Virus scanning enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-10\|CIS-10]] Malware Defenses |

**Beschrijving:**
Content wordt gescand op malware bij upload (via AMP of externe scanner).

**Audit Procedure:**
```bash
# Check for antivirus module
ls -la amps/ | grep -i virus
```

---

## 6. API Security

### ALF-6.1: API authenticatie verplicht

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Alle API endpoints vereisen authenticatie. Geen anonymous access.

**Audit Procedure:**
```bash
# Test unauthenticated access (should fail 401)
curl -I https://alfresco.example.com/alfresco/api/-default-/public/alfresco/versions/1/nodes
```

---

### ALF-6.2: WebScript access beperkt

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Directe toegang tot webscripts is beperkt via proxy configuratie.

**Remediation (NGINX):**
```nginx
# Block direct webscript access from outside
location /alfresco/service/ {
    allow 127.0.0.1;
    deny all;
}
```

---

## 7. Share Security

### ALF-7.1: CSRF protection enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
CSRF filters zijn ingeschakeld in Share.

**Audit Procedure:**
```bash
grep -i "csrf" share-config-custom.xml
```

---

### ALF-7.2: Clickjacking protection

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
X-Frame-Options header is geconfigureerd om clickjacking te voorkomen.

---

### ALF-7.3: Secure cookies

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Session cookies hebben Secure en HttpOnly flags.

**Audit Procedure:**
```bash
curl -c - https://alfresco.example.com/share/ | grep -i "JSESSIONID"
```

---

## 8. Audit & Logging

### ALF-8.1: Audit logging enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Audit service is ingeschakeld voor het loggen van gebruikersacties.

**Audit Procedure:**
```bash
grep -i "audit" alfresco-global.properties
```

**Remediation:**
```
audit.enabled=true
audit.alfresco-access.enabled=true
```

---

### ALF-8.2: Log forwarding

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Logs worden doorgestuurd naar centraal logging systeem.

---

## Complete Checklist

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| ALF-1.1 | HTTPS voor alle endpoints | L1 | ☐ |
| ALF-1.2 | Reverse proxy voor frontend | L1 | ☐ |
| ALF-1.3 | Tomcat AJP uitgeschakeld | L1 | ☐ |
| ALF-2.1 | Default admin wachtwoord gewijzigd | L1 | ☐ |
| ALF-2.2 | Guest access uitgeschakeld | L1 | ☐ |
| ALF-2.3 | LDAP/AD integratie | L1 | ☐ |
| ALF-2.4 | Session timeout geconfigureerd | L1 | ☐ |
| ALF-3.1 | Permissies correct toegepast | L1 | ☐ |
| ALF-3.2 | Site-gebaseerde toegangscontrole | L1 | ☐ |
| ALF-4.1 | Solr communicatie beveiligd | L1 | ☐ |
| ALF-4.2 | Solr certificaten gegenereerd | L1 | ☐ |
| ALF-4.3 | Solr port niet extern toegankelijk | L1 | ☐ |
| ALF-5.1 | Content encryption at rest | L2 | ☐ |
| ALF-5.2 | Virus scanning enabled | L1 | ☐ |
| ALF-6.1 | API authenticatie verplicht | L1 | ☐ |
| ALF-6.2 | WebScript access beperkt | L1 | ☐ |
| ALF-7.1 | CSRF protection enabled | L1 | ☐ |
| ALF-7.2 | Clickjacking protection | L1 | ☐ |
| ALF-7.3 | Secure cookies | L1 | ☐ |
| ALF-8.1 | Audit logging enabled | L1 | ☐ |
| ALF-8.2 | Log forwarding | L1 | ☐ |

---

## Bronnen

- [Alfresco Security Documentation](https://docs.alfresco.com/content-services/latest/admin/securing-install/)
- [Alfresco Security Best Practices](https://docs.alfresco.com/content-services/latest/admin/security/)
- [Search Services Security](https://docs.alfresco.com/search-services/latest/admin/security/)

---

## Wijzigingshistorie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-02-10 | CISO | Initiële versie |
