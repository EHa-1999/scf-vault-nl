---
id: "EXT-BM-NGINX-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - NGINX"
technology: "NGINX"
version_range: "1.24+"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-11
next_review: 2027-02-11
owner: "Team Infrastructuur"
sources:
  - "CIS NGINX Benchmark v2.1.0"
  - "NGINX Security Documentation"
  - "OWASP Secure Headers"
recommendations_count: 20
level_1_count: 15
level_2_count: 5
created: 2026-02-11
modified: 2026-02-11
tags:
  - benchmark
  - extended
  - nginx
  - webserver
  - reverse-proxy
---

# Extended Benchmark: NGINX v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | NGINX |
| **Versie Range** | 1.24+ |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 20 (15 L1, 5 L2) |
| **Bron** | [NGINX Security](https://docs.nginx.com/nginx/admin-guide/security-controls/) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/NGINX\|NGINX]] |

---

## 1. Basic Security

### NGX-1.1: NGINX draait als non-root

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
NGINX worker processes moeten draaien onder een dedicated non-root user.

**Audit Procedure:**
```bash
grep "^user" /etc/nginx/nginx.conf
ps aux | grep nginx
```

**Remediation:**
```nginx
# nginx.conf
user nginx nginx;
```

---

### NGX-1.2: Versie informatie verbergen

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
De NGINX versie mag niet zichtbaar zijn in HTTP responses.

**Audit Procedure:**
```bash
curl -I https://example.com | grep Server
```

**Remediation:**
```nginx
# nginx.conf in http block
server_tokens off;
```

---

### NGX-1.3: Directory listing uitgeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Automatische directory listings moeten uitgeschakeld zijn.

**Audit Procedure:**
```bash
grep -r "autoindex" /etc/nginx/
```

**Remediation:**
```nginx
# Verwijder of zet op off
autoindex off;
```

---

### NGX-1.4: Beperkte HTTP methods

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Alleen benodigde HTTP methods (GET, POST, HEAD) moeten toegestaan zijn.

**Audit Procedure:**
```bash
curl -X TRACE https://example.com
curl -X OPTIONS https://example.com
```

**Remediation:**
```nginx
# In server of location block
if ($request_method !~ ^(GET|HEAD|POST)$ ) {
    return 405;
}
```

---

## 2. TLS Configuration

### NGX-2.1: TLS 1.2 minimum

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Alleen TLS 1.2 en hoger mogen ondersteund worden.

**Audit Procedure:**
```bash
grep "ssl_protocols" /etc/nginx/nginx.conf
# Test SSL/TLS
nmap --script ssl-enum-ciphers -p 443 example.com
```

**Remediation:**
```nginx
ssl_protocols TLSv1.2 TLSv1.3;
```

---

### NGX-2.2: Sterke cipher suites

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Alleen sterke cipher suites mogen gebruikt worden.

**Audit Procedure:**
```bash
grep "ssl_ciphers" /etc/nginx/nginx.conf
```

**Remediation:**
```nginx
ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384;
ssl_prefer_server_ciphers on;
```

---

### NGX-2.3: HSTS ingeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
HTTP Strict Transport Security moet ingeschakeld zijn.

**Audit Procedure:**
```bash
curl -I https://example.com | grep -i strict
```

**Remediation:**
```nginx
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
```

---

### NGX-2.4: OCSP Stapling

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
OCSP Stapling moet ingeschakeld zijn voor certificate verificatie.

**Audit Procedure:**
```bash
grep "ssl_stapling" /etc/nginx/nginx.conf
```

**Remediation:**
```nginx
ssl_stapling on;
ssl_stapling_verify on;
ssl_trusted_certificate /path/to/chain.pem;
resolver 8.8.8.8 8.8.4.4 valid=300s;
```

---

## 3. Security Headers

### NGX-3.1: X-Frame-Options

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-16\|CIS-16]] Application Security |

**Beschrijving:**
X-Frame-Options header moet ingesteld zijn om clickjacking te voorkomen.

**Audit Procedure:**
```bash
curl -I https://example.com | grep -i x-frame
```

**Remediation:**
```nginx
add_header X-Frame-Options "SAMEORIGIN" always;
```

---

### NGX-3.2: X-Content-Type-Options

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-16\|CIS-16]] Application Security |

**Beschrijving:**
X-Content-Type-Options moet ingesteld zijn om MIME sniffing te voorkomen.

**Audit Procedure:**
```bash
curl -I https://example.com | grep -i x-content-type
```

**Remediation:**
```nginx
add_header X-Content-Type-Options "nosniff" always;
```

---

### NGX-3.3: Content-Security-Policy

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-16\|CIS-16]] Application Security |

**Beschrijving:**
Content Security Policy header moet geconfigureerd zijn.

**Audit Procedure:**
```bash
curl -I https://example.com | grep -i content-security
```

**Remediation:**
```nginx
add_header Content-Security-Policy "default-src 'self'; script-src 'self'; style-src 'self'" always;
```

---

### NGX-3.4: Referrer-Policy

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-16\|CIS-16]] Application Security |

**Beschrijving:**
Referrer-Policy header moet ingesteld zijn voor privacy.

**Audit Procedure:**
```bash
curl -I https://example.com | grep -i referrer
```

**Remediation:**
```nginx
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
```

---

## 4. Access Control

### NGX-4.1: Rate limiting

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-13\|CIS-13]] Network Monitoring |

**Beschrijving:**
Rate limiting moet geconfigureerd zijn om DoS aanvallen te beperken.

**Audit Procedure:**
```bash
grep -r "limit_req" /etc/nginx/
```

**Remediation:**
```nginx
# In http block
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

# In server/location block
limit_req zone=api burst=20 nodelay;
```

---

### NGX-4.2: Client body size beperkt

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Maximum client request body size moet beperkt zijn.

**Audit Procedure:**
```bash
grep "client_max_body_size" /etc/nginx/nginx.conf
```

**Remediation:**
```nginx
client_max_body_size 10M;  # Pas aan naar behoefte
```

---

### NGX-4.3: IP-based access control

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-12\|CIS-12]] Network Infrastructure |

**Beschrijving:**
Beheer endpoints moeten IP-restricted zijn.

**Audit Procedure:**
```bash
grep -r "allow\|deny" /etc/nginx/
```

**Remediation:**
```nginx
location /admin {
    allow 10.0.0.0/8;
    deny all;
    # ... rest of config
}
```

---

### NGX-4.4: Connection limits

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-13\|CIS-13]] Network Monitoring |

**Beschrijving:**
Connection limits per IP moeten geconfigureerd zijn.

**Audit Procedure:**
```bash
grep -r "limit_conn" /etc/nginx/
```

**Remediation:**
```nginx
# In http block
limit_conn_zone $binary_remote_addr zone=addr:10m;

# In server block
limit_conn addr 10;
```

---

## 5. Logging

### NGX-5.1: Access logging

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Access logging moet ingeschakeld zijn met voldoende detail.

**Audit Procedure:**
```bash
grep "access_log" /etc/nginx/nginx.conf
```

**Remediation:**
```nginx
log_format detailed '$remote_addr - $remote_user [$time_local] '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent" '
                    '$request_time $upstream_response_time';
                    
access_log /var/log/nginx/access.log detailed;
```

---

### NGX-5.2: Error logging

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Error logging moet ingeschakeld zijn met adequate level.

**Audit Procedure:**
```bash
grep "error_log" /etc/nginx/nginx.conf
```

**Remediation:**
```nginx
error_log /var/log/nginx/error.log warn;
```

---

### NGX-5.3: Log rotation

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Log rotation moet geconfigureerd zijn.

**Audit Procedure:**
```bash
cat /etc/logrotate.d/nginx
```

**Remediation:**
```
# /etc/logrotate.d/nginx
/var/log/nginx/*.log {
    daily
    missingok
    rotate 30
    compress
    delaycompress
    notifempty
    sharedscripts
    postrotate
        /bin/kill -USR1 $(cat /run/nginx.pid 2>/dev/null) 2>/dev/null || true
    endscript
}
```

---

## 6. Reverse Proxy Security

### NGX-6.1: Upstream verbinding TLS

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Verbindingen naar upstream servers moeten via TLS verlopen.

**Audit Procedure:**
```bash
grep -r "proxy_pass" /etc/nginx/ | grep -v "https"
```

**Remediation:**
```nginx
location /api {
    proxy_pass https://backend:8443;
    proxy_ssl_verify on;
    proxy_ssl_trusted_certificate /path/to/ca.crt;
}
```

---

### NGX-6.2: Proxy headers doorgeven

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-12\|CIS-12]] Network Infrastructure |

**Beschrijving:**
Juiste proxy headers moeten doorgegeven worden voor logging en security.

**Audit Procedure:**
```bash
grep -r "proxy_set_header" /etc/nginx/
```

**Remediation:**
```nginx
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
```

---

### NGX-6.3: Buffer overflow protection

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Buffer sizes moeten beperkt zijn om overflow attacks te voorkomen.

**Audit Procedure:**
```bash
grep -r "buffer" /etc/nginx/nginx.conf
```

**Remediation:**
```nginx
client_body_buffer_size 1K;
client_header_buffer_size 1k;
large_client_header_buffers 2 1k;
```

---

## Samenvatting per Domein

| Domein | L1 | L2 | Totaal |
|--------|----|----|--------|
| 1. Basic Security | 4 | 0 | 4 |
| 2. TLS Configuration | 3 | 1 | 4 |
| 3. Security Headers | 3 | 1 | 4 |
| 4. Access Control | 3 | 1 | 4 |
| 5. Logging | 3 | 0 | 3 |
| 6. Reverse Proxy | 1 | 2 | 3 |
| **Totaal** | **15** | **5** | **20** |

---

## Referenties

- [CIS NGINX Benchmark](https://www.cisecurity.org/benchmark/nginx)
- [NGINX Admin Guide - Security Controls](https://docs.nginx.com/nginx/admin-guide/security-controls/)
- [OWASP Secure Headers Project](https://owasp.org/www-project-secure-headers/)
- [Mozilla SSL Configuration Generator](https://ssl-config.mozilla.org/)
