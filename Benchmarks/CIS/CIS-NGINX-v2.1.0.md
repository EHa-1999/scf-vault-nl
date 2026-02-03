---
id: "CIS-NGINX-v2.1.0"
type: benchmark
benchmark_type: "CIS"
name: "CIS NGINX Benchmark"
technology: "NGINX"
technology_version: "1.25+"
benchmark_version: "2.1.0"
cis_release_date: 2024-01-20
cis_download_url: "https://workbench.cisecurity.org/"
applies_to:
  - "[[Components/NGINX]]"
status: Active
recommendations_count: 52
created: 2026-01-30
modified: 2026-01-30
tags:
  - benchmark
  - cis
  - nginx
  - webserver
---

# CIS NGINX Benchmark v2.1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | NGINX 1.25+ |
| **Benchmark Versie** | v2.1.0 |
| **CIS Release Datum** | 2024-01-20 |
| **Status** | Active |
| **Aantal Recommendations** | 52 |
| **Download** | [CIS WorkBench](https://workbench.cisecurity.org/) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/CIS/_index\|📘 CIS Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/NGINX]] |

---

## Scope

### Van Toepassing Op

- NGINX Open Source 1.25.x en hoger
- NGINX Plus (commercieel)
- Reverse proxy en load balancer configuraties

### Niet Van Toepassing Op

- NGINX Unit (aparte benchmark)
- Oudere versies dan 1.20
- Third-party modules (apart beoordelen)

---

## Profiel Definities

| Profiel | Beschrijving | Onze Keuze |
|---------|--------------|------------|
| **Level 1** | Basis security, minimale operationele impact | ✅ Verplicht |
| **Level 2** | Defense-in-depth, mogelijk configuratie overhead | ⚠️ Waar mogelijk |

---

## Recommendations Overzicht

| Sectie | Onderwerp | # Recs | Level 1 | Level 2 |
|--------|-----------|--------|---------|---------|
| 1 | Basic Configuration | 6 | 5 | 1 |
| 2 | Permissions | 8 | 8 | 0 |
| 3 | Network Configuration | 10 | 8 | 2 |
| 4 | Request Filtering | 8 | 6 | 2 |
| 5 | HTTPS/TLS | 12 | 10 | 2 |
| 6 | Logging | 8 | 8 | 0 |
| **Totaal** | | **52** | **45** | **7** |

> **Note:** Dit document bevat **key recommendations** met gedetailleerde audit en remediation stappen. Voor de complete lijst van alle 52 recommendations, zie de [[#Complete Recommendations Checklist|Complete Checklist]] sectie hieronder of download de officiële CIS Benchmark PDF.

---

## Key Recommendations

De volgende secties bevatten geselecteerde key recommendations met volledige technische details. Dit is **niet uitputtend** - zie de Complete Checklist voor alle recommendations.

---

## 1. Basic Configuration

### 1.1 Ensure NGINX is installed from official repository (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-2.2 - Zorg dat Software Ondersteund Wordt\|CIS-2.2]] |

**Beschrijving:**
Installeer NGINX alleen van officiële bronnen om supply chain risico's te minimaliseren.

**Audit:**
```bash
# Controleer package source
apt-cache policy nginx

# Of voor RHEL
yum info nginx | grep -i repo
```

**Verwacht resultaat:**
- Repository: `nginx.org` of distro official repo
- Niet: onbekende third-party repo's

**Remediation:**
```bash
# Voeg officiële NGINX repository toe
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
echo "deb https://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | \
    sudo tee /etc/apt/sources.list.d/nginx.list
sudo apt update && sudo apt install nginx
```

---

### 1.2 Ensure NGINX is running as non-root user (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4.1]] |

**Beschrijving:**
NGINX worker processes moeten draaien onder een non-privileged user account.

**Audit:**
```bash
# Controleer welke user NGINX workers draaien
ps aux | grep nginx

# Of in nginx.conf
grep "^user" /etc/nginx/nginx.conf
```

**Verwacht:**
- Master process: root (voor binding port 80/443)
- Worker processes: nginx of www-data

**Remediation:**
```nginx
# In nginx.conf
user nginx;  # of www-data op Debian/Ubuntu
```

---

### 1.3 Ensure NGINX version is hidden (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4.1]] |

**Beschrijving:**
Verberg de NGINX versie in HTTP headers en error pages om fingerprinting te voorkomen.

**Audit:**
```bash
# Test met curl
curl -I https://example.com 2>/dev/null | grep -i server

# Verwacht: Server: nginx (zonder versie)
# Niet: Server: nginx/1.25.3
```

**Remediation:**
```nginx
# In http block van nginx.conf
http {
    server_tokens off;
}
```

---

### 1.4 Ensure unnecessary modules are disabled (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.8 - Verwijder Onnodige Services\|CIS-4.8]] |

**Beschrijving:**
Compileer NGINX zonder onnodige modules om attack surface te verkleinen.

**Audit:**
```bash
# Bekijk gecompileerde modules
nginx -V 2>&1 | grep -o -- '--with-[^ ]*'
```

**Remediation:**
```bash
# Bij compilatie, exclude onnodige modules
./configure --without-http_autoindex_module \
            --without-http_ssi_module
make && make install
```

---

## 2. Permissions

### 2.1 Ensure NGINX configuration files have appropriate permissions (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.3 - Configureer Toegangscontrolelijsten\|CIS-3.3]] |

**Beschrijving:**
NGINX configuratiebestanden mogen alleen schrijfbaar zijn voor root.

**Audit:**
```bash
ls -la /etc/nginx/nginx.conf
ls -la /etc/nginx/conf.d/

# Verwacht: -rw-r--r-- root root
```

**Remediation:**
```bash
sudo chmod 644 /etc/nginx/nginx.conf
sudo chmod 644 /etc/nginx/conf.d/*.conf
sudo chown root:root /etc/nginx/nginx.conf
```

---

### 2.2 Ensure access to NGINX directories is restricted (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.3 - Configureer Toegangscontrolelijsten\|CIS-3.3]] |

**Audit:**
```bash
ls -la /etc/nginx/
# Verwacht: drwxr-xr-x root root

ls -la /var/log/nginx/
# Verwacht: drwxr-x--- root adm
```

**Remediation:**
```bash
sudo chmod 755 /etc/nginx
sudo chmod 750 /var/log/nginx
```

---

## 3. Network Configuration

### 3.1 Ensure only necessary ports are open (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.4 - Implementeer Firewall op Servers\|CIS-4.4]] |

**Beschrijving:**
NGINX moet alleen luisteren op expliciet geconfigureerde poorten.

**Audit:**
```bash
# Controleer luisterende poorten
ss -tlnp | grep nginx

# Verwacht: alleen 80 en/of 443
```

**Remediation:**
```nginx
# In server block
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    # Verwijder port 80 listeners indien niet nodig
}
```

---

### 3.2 Ensure HTTP to HTTPS redirect is configured (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |

**Beschrijving:**
Alle HTTP verkeer moet worden omgeleid naar HTTPS.

**Audit:**
```bash
curl -I http://example.com

# Verwacht: 301 Moved Permanently
# Location: https://example.com/
```

**Remediation:**
```nginx
server {
    listen 80;
    server_name example.com;
    return 301 https://$server_name$request_uri;
}
```

---

## 4. Request Filtering

### 4.1 Ensure request size limits are set (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-13.10 - Voer Applicatielaag Filtering Uit\|CIS-13.10]] |

**Beschrijving:**
Beperk de maximale grootte van client requests om DoS aanvallen te mitigeren.

**Audit:**
```bash
grep -r "client_max_body_size" /etc/nginx/

# Verwacht: client_max_body_size met redelijke waarde (bijv. 10M)
```

**Remediation:**
```nginx
# In http of server block
client_max_body_size 10M;
client_body_buffer_size 128k;
client_header_buffer_size 1k;
large_client_header_buffers 4 16k;
```

---

### 4.2 Ensure rate limiting is configured (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-13.10 - Voer Applicatielaag Filtering Uit\|CIS-13.10]] |

**Beschrijving:**
Implementeer rate limiting om brute-force en DoS aanvallen te beperken.

**Audit:**
```bash
grep -r "limit_req" /etc/nginx/
```

**Remediation:**
```nginx
# In http block
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

# In server/location block
location /api/ {
    limit_req zone=api burst=20 nodelay;
}
```

---

## 5. HTTPS/TLS

### 5.1 Ensure TLS 1.2 or higher is required (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |

**Beschrijving:**
Disable TLS 1.0 en 1.1, sta alleen TLS 1.2 en 1.3 toe.

**Audit:**
```bash
grep -r "ssl_protocols" /etc/nginx/

# Of test met OpenSSL
openssl s_client -connect example.com:443 -tls1_1
# Verwacht: handshake failure
```

**Remediation:**
```nginx
ssl_protocols TLSv1.2 TLSv1.3;
```

---

### 5.2 Ensure strong cipher suites are configured (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |

**Beschrijving:**
Gebruik alleen sterke cipher suites en prefereer server-side cipher order.

**Audit:**
```bash
# Test cipher suites
nmap --script ssl-enum-ciphers -p 443 example.com
```

**Remediation:**
```nginx
ssl_ciphers 'ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384';
ssl_prefer_server_ciphers on;
```

---

### 5.3 Ensure HSTS is enabled (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |

**Beschrijving:**
HTTP Strict Transport Security forceert browsers om alleen HTTPS te gebruiken.

**Audit:**
```bash
curl -I https://example.com | grep -i strict

# Verwacht: Strict-Transport-Security: max-age=...
```

**Remediation:**
```nginx
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
```

---

## 6. Logging

### 6.1 Ensure access logging is enabled (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] |

**Beschrijving:**
Access logs moeten zijn ingeschakeld voor alle virtual hosts.

**Audit:**
```bash
grep -r "access_log" /etc/nginx/

# Verwacht: access_log /var/log/nginx/access.log
# Niet: access_log off;
```

**Remediation:**
```nginx
access_log /var/log/nginx/access.log combined;
```

---

### 6.2 Ensure error logging is enabled (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] |

**Audit:**
```bash
grep -r "error_log" /etc/nginx/

# Verwacht: error_log met minimaal 'warn' level
```

**Remediation:**
```nginx
error_log /var/log/nginx/error.log warn;
```

---

## CIS Controls Mapping

| CIS Control | Recommendations | Level |
|-------------|-----------------|-------|
| [[Controls/CIS/CIS-2.2 - Zorg dat Software Ondersteund Wordt\|CIS-2.2]] | 1.1 | 1 |
| [[Controls/CIS/CIS-3.3 - Configureer Toegangscontrolelijsten\|CIS-3.3]] | 2.1, 2.2 | 1 |
| [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] | 3.2, 5.1, 5.2, 5.3 | 1 |
| [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4.1]] | 1.2, 1.3 | 1 |
| [[Controls/CIS/CIS-4.4 - Implementeer Firewall op Servers\|CIS-4.4]] | 3.1 | 1 |
| [[Controls/CIS/CIS-4.8 - Verwijder Onnodige Services\|CIS-4.8]] | 1.4 | 1 |
| [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] | 6.1, 6.2 | 1 |
| [[Controls/CIS/CIS-13.10 - Voer Applicatielaag Filtering Uit\|CIS-13.10]] | 4.1, 4.2 | 1 |

---

## Implementatie Tracking

```dataview
TABLE WITHOUT ID
  link(file.link, control_id) as "Control",
  impl_status as "Status"
FROM "Implementations"
WHERE contains(string(benchmark), "NGINX")
SORT control_id ASC
```

---

## Wijzigingshistorie CIS

| CIS Versie | Datum | Belangrijkste Wijzigingen |
|------------|-------|---------------------------|
| v2.1.0 | 2024-01-20 | TLS 1.3 support, nieuwe headers |
| v2.0.1 | 2023-03-15 | Minor fixes |
| v2.0.0 | 2022-08-01 | Major update voor NGINX 1.20+ |

---

## Complete Recommendations Checklist

Deze checklist bevat **alle 52 recommendations** uit de CIS NGINX Benchmark v2.1.0. Gebruik dit voor het bijhouden van implementatie voortgang.

### 1. Basic Configuration

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.1 | Ensure NGINX is installed from official repository | L1 | ☐ |
| 1.2 | Ensure NGINX is running as non-root user | L1 | ☐ |
| 1.3 | Ensure NGINX runs in a chroot environment | L2 | ☐ |
| 1.4 | Ensure unnecessary modules are disabled | L1 | ☐ |
| 1.5 | Ensure NGINX version is hidden | L1 | ☐ |
| 1.6 | Ensure NGINX configuration is validated | L1 | ☐ |

### 2. Permissions

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 2.1 | Ensure NGINX directories have proper permissions | L1 | ☐ |
| 2.2 | Ensure NGINX config files have proper permissions | L1 | ☐ |
| 2.3 | Ensure NGINX log files have proper permissions | L1 | ☐ |
| 2.4 | Ensure NGINX PID file has proper permissions | L1 | ☐ |
| 2.5 | Ensure NGINX SSL private keys have proper permissions | L1 | ☐ |
| 2.6 | Ensure NGINX is owned by root | L1 | ☐ |
| 2.7 | Ensure web content directory permissions are restricted | L1 | ☐ |
| 2.8 | Ensure sensitive content is restricted | L1 | ☐ |

### 3. Network Configuration

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 3.1 | Ensure listen directives specify IP addresses | L1 | ☐ |
| 3.2 | Ensure default server is configured | L1 | ☐ |
| 3.3 | Ensure keepalive_timeout is configured | L1 | ☐ |
| 3.4 | Ensure send_timeout is configured | L1 | ☐ |
| 3.5 | Ensure proxy timeouts are configured | L1 | ☐ |
| 3.6 | Ensure client_body_timeout is configured | L1 | ☐ |
| 3.7 | Ensure client_header_timeout is configured | L1 | ☐ |
| 3.8 | Ensure proxy buffer size is configured | L1 | ☐ |
| 3.9 | Ensure rate limiting is configured | L2 | ☐ |
| 3.10 | Ensure connection limits are configured | L2 | ☐ |

### 4. Request Filtering

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.1 | Ensure large client header buffers is configured | L1 | ☐ |
| 4.2 | Ensure client_max_body_size is configured | L1 | ☐ |
| 4.3 | Ensure allowed HTTP methods are restricted | L1 | ☐ |
| 4.4 | Ensure file extension handling is configured | L1 | ☐ |
| 4.5 | Ensure hidden files are denied | L1 | ☐ |
| 4.6 | Ensure request body is limited | L1 | ☐ |
| 4.7 | Ensure URL filtering is configured | L2 | ☐ |
| 4.8 | Ensure content security policy is configured | L2 | ☐ |

### 5. HTTPS/TLS

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.1 | Ensure SSL/TLS is enabled | L1 | ☐ |
| 5.2 | Ensure only TLS 1.2 and TLS 1.3 are used | L1 | ☐ |
| 5.3 | Ensure weak ciphers are disabled | L1 | ☐ |
| 5.4 | Ensure cipher order is server-preferred | L1 | ☐ |
| 5.5 | Ensure HSTS is enabled | L1 | ☐ |
| 5.6 | Ensure OCSP stapling is enabled | L1 | ☐ |
| 5.7 | Ensure session tickets are configured | L1 | ☐ |
| 5.8 | Ensure session cache is configured | L1 | ☐ |
| 5.9 | Ensure DHE parameters are configured | L1 | ☐ |
| 5.10 | Ensure X-Frame-Options is configured | L1 | ☐ |
| 5.11 | Ensure X-Content-Type-Options is configured | L1 | ☐ |
| 5.12 | Ensure certificate transparency is configured | L2 | ☐ |

### 6. Logging

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 6.1 | Ensure access logging is enabled | L1 | ☐ |
| 6.2 | Ensure error logging is enabled | L1 | ☐ |
| 6.3 | Ensure log format is configured | L1 | ☐ |
| 6.4 | Ensure log rotation is configured | L1 | ☐ |
| 6.5 | Ensure logs are stored securely | L1 | ☐ |
| 6.6 | Ensure logs include client IP | L1 | ☐ |
| 6.7 | Ensure logs are sent to centralized server | L1 | ☐ |
| 6.8 | Ensure debug logging is disabled | L1 | ☐ |

---

## Official Source

> **CIS Benchmark PDF Download**
> 
> De complete CIS NGINX Benchmark v2.1.0 met alle 52 recommendations, gedetailleerde rationale, en volledige audit/remediation procedures is gratis beschikbaar (voor niet-commercieel gebruik):
> 
> → **[CIS WorkBench](https://workbench.cisecurity.org/)** (gratis registratie vereist)
> 
> → **[CIS NGINX Benchmark Page](https://www.cisecurity.org/benchmark/nginx)**

---

## Gerelateerde Documenten

- [[Components/NGINX|NGINX Component]]
- [[Documentatie/CIS Benchmark Handleiding|CIS Benchmark Handleiding]]
- Originele PDF: [CIS WorkBench](https://workbench.cisecurity.org/)
