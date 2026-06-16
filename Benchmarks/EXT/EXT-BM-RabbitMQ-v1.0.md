---
id: "EXT-BM-RabbitMQ-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - RabbitMQ"
technology: "RabbitMQ"
version_range: "3.12+"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "Team Infrastructuur"
sources:
  - "RabbitMQ Security Documentation"
  - "RabbitMQ Production Checklist"
  - "OWASP AMQP Security"
recommendations_count: 24
level_1_count: 18
level_2_count: 6
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - rabbitmq
  - messaging
  - amqp
---

# Extended Benchmark: RabbitMQ v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | RabbitMQ |
| **Versie Range** | 3.12+ |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 24 (18 L1, 6 L2) |
| **Bron** | [RabbitMQ Security](https://www.rabbitmq.com/docs/security) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/RabbitMQ\|RabbitMQ]] |

---

## 1. Authentication

### RMQ-1.1: Default guest account uitgeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
De standaard `guest` account mag alleen lokaal (localhost) inloggen. Voor productie moet guest volledig worden uitgeschakeld of het wachtwoord gewijzigd.

**Audit Procedure:**
```bash
# Check guest account status
rabbitmqctl list_users | grep guest

# Check guest permissions
rabbitmqctl list_user_permissions guest
```

**Remediation:**
```bash
# Optie 1: Verwijder guest account
rabbitmqctl delete_user guest

# Optie 2: Wijzig wachtwoord en beperk permissions
rabbitmqctl change_password guest <strong_password>
rabbitmqctl set_permissions -p / guest "" "" ""
```

**Bron:** [RabbitMQ Access Control](https://www.rabbitmq.com/docs/access-control#default-state)

---

### RMQ-1.2: Sterke wachtwoorden afgedwongen

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Alle gebruikersaccounts hebben sterke wachtwoorden (minimaal 16 tekens, complexiteit).

**Audit Procedure:**
```bash
# List all users
rabbitmqctl list_users

# Verify password policy via management API
curl -u admin:password http://localhost:15672/api/users
```

**Remediation:**
```bash
# Change password to strong value
rabbitmqctl change_password <username> <strong_password>
```

---

### RMQ-1.3: External authentication backend

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]], [[Controls/CIS/CIS-6\|CIS-6]] |

**Beschrijving:**
Voor enterprise omgevingen: gebruik externe authenticatie (LDAP, OAuth 2.0) in plaats van interne database.

**Audit Procedure:**
```bash
# Check auth backends in config
grep -i "auth_backends" /etc/rabbitmq/rabbitmq.conf
```

**Verwacht (LDAP):**
```
auth_backends.1 = rabbit_auth_backend_ldap
auth_backends.2 = rabbit_auth_backend_internal
```

**Bron:** [RabbitMQ LDAP](https://www.rabbitmq.com/docs/ldap)

---

## 2. Authorization

### RMQ-2.1: Virtual hosts voor isolatie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Gebruik aparte virtual hosts per applicatie/omgeving voor isolatie. Gebruik niet alleen de default `/` vhost.

**Audit Procedure:**
```bash
# List virtual hosts
rabbitmqctl list_vhosts

# Check if only default vhost exists
rabbitmqctl list_vhosts | wc -l
```

**Remediation:**
```bash
# Create dedicated vhosts
rabbitmqctl add_vhost /xena-zgw
rabbitmqctl add_vhost /xena-nzgw

# Set permissions per vhost
rabbitmqctl set_permissions -p /xena-zgw app_user ".*" ".*" ".*"
```

---

### RMQ-2.2: Least privilege permissions

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Gebruikers hebben alleen de minimaal benodigde permissions (configure/write/read) per vhost.

**Audit Procedure:**
```bash
# List permissions per user
rabbitmqctl list_user_permissions <username>

# List all permissions
rabbitmqctl list_permissions -p <vhost>
```

**Remediation:**
```bash
# Producer: alleen write
rabbitmqctl set_permissions -p /xena-zgw producer "" "^amq\." ""

# Consumer: alleen read
rabbitmqctl set_permissions -p /xena-zgw consumer "" "" "^queue\."
```

---

### RMQ-2.3: Topic-level authorization

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Voor topic exchanges: configureer topic-level authorization om berichten te filteren per routing key.

**Audit Procedure:**
```bash
# Check topic permissions
rabbitmqctl list_topic_permissions
```

**Bron:** [Topic Authorization](https://www.rabbitmq.com/docs/access-control#topic-authorisation)

---

## 3. Transport Security (TLS)

### RMQ-3.1: TLS enabled voor AMQP

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Alle AMQP connecties gebruiken TLS (poort 5671 in plaats van 5672).

**Audit Procedure:**
```bash
# Check listeners
rabbitmqctl list_listeners

# Verify TLS config
grep -i "ssl" /etc/rabbitmq/rabbitmq.conf
```

**Verwacht:**
```
listeners.ssl.default = 5671
ssl_options.cacertfile = /path/to/ca_certificate.pem
ssl_options.certfile = /path/to/server_certificate.pem
ssl_options.keyfile = /path/to/server_key.pem
ssl_options.verify = verify_peer
ssl_options.fail_if_no_peer_cert = true
```

**Bron:** [RabbitMQ TLS](https://www.rabbitmq.com/docs/ssl)

---

### RMQ-3.2: Disable non-TLS listeners

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Schakel onversleutelde listeners uit (poort 5672) in productie.

**Audit Procedure:**
```bash
# Check if plain AMQP is enabled
rabbitmqctl list_listeners | grep 5672
```

**Remediation (rabbitmq.conf):**
```
listeners.tcp = none
listeners.ssl.default = 5671
```

---

### RMQ-3.3: Strong cipher suites

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Alleen sterke cipher suites zijn toegestaan (TLS 1.2+, geen RC4, DES, MD5).

**Audit Procedure:**
```bash
# Check TLS version
grep -i "versions" /etc/rabbitmq/rabbitmq.conf

# Test with openssl
openssl s_client -connect localhost:5671 -tls1_2
```

**Remediation (rabbitmq.conf):**
```
ssl_options.versions.1 = tlsv1.3
ssl_options.versions.2 = tlsv1.2
ssl_options.ciphers.1 = TLS_AES_256_GCM_SHA384
ssl_options.ciphers.2 = TLS_CHACHA20_POLY1305_SHA256
```

---

### RMQ-3.4: Inter-node TLS (clustering)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Bij clustering: Erlang distribution gebruikt TLS voor inter-node communicatie.

**Audit Procedure:**
```bash
# Check Erlang distribution port
epmd -names

# Check inter-node TLS
grep -i "ssl_dist" /etc/rabbitmq/advanced.config
```

**Bron:** [Inter-node TLS](https://www.rabbitmq.com/docs/clustering-ssl)

---

## 4. Management Interface

### RMQ-4.1: Management UI via HTTPS

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
De management interface (poort 15672) is alleen toegankelijk via HTTPS (15671).

**Audit Procedure:**
```bash
# Check management listeners
rabbitmqctl list_listeners | grep 1567

# Test HTTPS
curl -k https://localhost:15671/api/overview
```

**Remediation (rabbitmq.conf):**
```
management.ssl.port = 15671
management.ssl.cacertfile = /path/to/ca.pem
management.ssl.certfile = /path/to/cert.pem
management.ssl.keyfile = /path/to/key.pem
management.tcp.port = none
```

---

### RMQ-4.2: Management access beperkt

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Alleen administrators hebben toegang tot de management interface. Applicatie-accounts hebben geen management tags.

**Audit Procedure:**
```bash
# List users with tags
rabbitmqctl list_users

# Check for administrator tag
rabbitmqctl list_users | grep administrator
```

**Remediation:**
```bash
# Remove management access from app user
rabbitmqctl set_user_tags app_user

# Set administrator only for admin
rabbitmqctl set_user_tags admin_user administrator
```

---

### RMQ-4.3: Rate limiting op API

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
De management API heeft rate limiting om brute force en DoS te voorkomen.

**Remediation (rabbitmq.conf):**
```
management.rates_mode = basic
```

---

## 5. Network Security

### RMQ-5.1: Bind to specific interface

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
RabbitMQ bindt alleen aan specifieke interfaces, niet aan 0.0.0.0.

**Audit Procedure:**
```bash
# Check listening addresses
ss -tlnp | grep beam

# Check config
grep -i "listeners" /etc/rabbitmq/rabbitmq.conf
```

**Remediation (rabbitmq.conf):**
```
listeners.ssl.1 = 10.0.0.5:5671
management.ssl.ip = 10.0.0.5
```

---

### RMQ-5.2: Firewall rules

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-13\|CIS-13]] Network Monitoring |

**Beschrijving:**
Firewall regels beperken toegang tot RabbitMQ poorten tot alleen geautoriseerde clients.

**Standaard Poorten:**
| Poort | Protocol | Toegang |
|-------|----------|---------|
| 5671 | AMQPS | Applicatie servers |
| 15671 | HTTPS Mgmt | Admin netwerk |
| 25672 | Erlang | Cluster nodes only |
| 4369 | EPMD | Cluster nodes only |

---

## 6. Logging & Monitoring

### RMQ-6.1: Audit logging enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Logging is ingeschakeld voor connections, channels, en authentication events.

**Audit Procedure:**
```bash
# Check log level
grep -i "log" /etc/rabbitmq/rabbitmq.conf

# Check log files
ls -la /var/log/rabbitmq/
```

**Remediation (rabbitmq.conf):**
```
log.file.level = info
log.connection.level = info
log.channel.level = warning
```

---

### RMQ-6.2: Log forwarding

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Logs worden doorgestuurd naar een centraal logging systeem (syslog/SIEM).

**Remediation (rabbitmq.conf):**
```
log.syslog = true
log.syslog.host = 10.0.0.100
log.syslog.port = 514
```

---

### RMQ-6.3: Prometheus metrics enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Prometheus metrics endpoint is ingeschakeld voor monitoring, maar beveiligd.

**Audit Procedure:**
```bash
# Check prometheus plugin
rabbitmq-plugins list | grep prometheus

# Test metrics endpoint
curl -u admin:password http://localhost:15692/metrics
```

---

## 7. Message Security

### RMQ-7.1: Message TTL configured

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Queues hebben een message TTL om te voorkomen dat berichten oneindig blijven staan.

**Audit Procedure:**
```bash
# Check queue arguments
rabbitmqctl list_queues name arguments
```

**Bron:** [Message TTL](https://www.rabbitmq.com/docs/ttl)

---

### RMQ-7.2: Queue length limits

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Queues hebben length limits om resource exhaustion te voorkomen.

**Audit Procedure:**
```bash
# Check queue limits
rabbitmqctl list_queues name messages_ready messages_unacknowledged
```

---

## Complete Checklist

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| RMQ-1.1 | Default guest account uitgeschakeld | L1 | ☐ |
| RMQ-1.2 | Sterke wachtwoorden afgedwongen | L1 | ☐ |
| RMQ-1.3 | External authentication backend | L2 | ☐ |
| RMQ-2.1 | Virtual hosts voor isolatie | L1 | ☐ |
| RMQ-2.2 | Least privilege permissions | L1 | ☐ |
| RMQ-2.3 | Topic-level authorization | L2 | ☐ |
| RMQ-3.1 | TLS enabled voor AMQP | L1 | ☐ |
| RMQ-3.2 | Disable non-TLS listeners | L1 | ☐ |
| RMQ-3.3 | Strong cipher suites | L1 | ☐ |
| RMQ-3.4 | Inter-node TLS (clustering) | L2 | ☐ |
| RMQ-4.1 | Management UI via HTTPS | L1 | ☐ |
| RMQ-4.2 | Management access beperkt | L1 | ☐ |
| RMQ-4.3 | Rate limiting op API | L2 | ☐ |
| RMQ-5.1 | Bind to specific interface | L1 | ☐ |
| RMQ-5.2 | Firewall rules | L1 | ☐ |
| RMQ-6.1 | Audit logging enabled | L1 | ☐ |
| RMQ-6.2 | Log forwarding | L1 | ☐ |
| RMQ-6.3 | Prometheus metrics enabled | L2 | ☐ |
| RMQ-7.1 | Message TTL configured | L1 | ☐ |
| RMQ-7.2 | Queue length limits | L1 | ☐ |

---

## Bronnen

- [RabbitMQ Security](https://www.rabbitmq.com/docs/security)
- [RabbitMQ TLS Support](https://www.rabbitmq.com/docs/ssl)
- [RabbitMQ Production Checklist](https://www.rabbitmq.com/docs/production-checklist)
- [RabbitMQ Access Control](https://www.rabbitmq.com/docs/access-control)

---

## Wijzigingshistorie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-02-10 | CISO | Initiële versie |
