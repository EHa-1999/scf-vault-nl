---
id: "EXT-BM-PostgreSQL-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - PostgreSQL"
technology: "PostgreSQL"
version_range: "15+"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-11
next_review: 2027-02-11
owner: "Team Infrastructuur"
sources:
  - "CIS PostgreSQL 16 Benchmark v1.0"
  - "PostgreSQL Security Documentation"
  - "OWASP Database Security"
recommendations_count: 21
level_1_count: 16
level_2_count: 5
created: 2026-02-11
modified: 2026-02-11
tags:
  - benchmark
  - extended
  - postgresql
  - database
---

# Extended Benchmark: PostgreSQL v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | PostgreSQL |
| **Versie Range** | 15+ |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 21 (16 L1, 5 L2) |
| **Bron** | [PostgreSQL Security](https://www.postgresql.org/docs/current/security.html) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/PostgreSQL\|PostgreSQL]] |

---

## 1. Authentication

### PG-1.1: Password authentication method

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Gebruik scram-sha-256 als authenticatie methode in plaats van md5 of trust.

**Audit Procedure:**
```bash
# Check pg_hba.conf
grep -v "^#" /var/lib/postgresql/data/pg_hba.conf | grep -v "^$"
```

**Remediation:**
```
# pg_hba.conf - gebruik scram-sha-256
host    all    all    0.0.0.0/0    scram-sha-256
```

---

### PG-1.2: Geen trust authentication

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Trust authentication mag nooit gebruikt worden voor remote connecties.

**Audit Procedure:**
```bash
grep "trust" /var/lib/postgresql/data/pg_hba.conf
```

**Remediation:**
Verwijder alle regels met `trust` behalve eventueel local socket voor postgres user.

---

### PG-1.3: Password complexity

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Wachtwoorden moeten voldoen aan complexiteitseisen.

**Audit Procedure:**
```sql
SHOW password_encryption;
SELECT name, setting FROM pg_settings WHERE name = 'password_encryption';
```

**Remediation:**
```sql
-- postgresql.conf
ALTER SYSTEM SET password_encryption = 'scram-sha-256';
SELECT pg_reload_conf();
```

---

### PG-1.4: Connection limits per user

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Stel connectielimieten in per user om resource exhaustion te voorkomen.

**Audit Procedure:**
```sql
SELECT rolname, rolconnlimit FROM pg_roles WHERE rolconnlimit > 0 OR rolconnlimit = -1;
```

**Remediation:**
```sql
ALTER ROLE application_user CONNECTION LIMIT 50;
```

---

## 2. Authorization

### PG-2.1: Principle of least privilege

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Gebruikers moeten alleen de minimaal benodigde rechten hebben.

**Audit Procedure:**
```sql
-- Check user privileges
SELECT grantee, table_schema, table_name, privilege_type 
FROM information_schema.table_privileges 
WHERE grantee NOT IN ('postgres', 'PUBLIC')
ORDER BY grantee, table_schema, table_name;
```

**Remediation:**
```sql
-- Revoke excessive permissions
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM PUBLIC;
GRANT SELECT ON specific_table TO read_only_user;
```

---

### PG-2.2: Geen superuser voor applicaties

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Applicaties mogen geen superuser accounts gebruiken.

**Audit Procedure:**
```sql
SELECT rolname, rolsuper FROM pg_roles WHERE rolsuper = true;
```

**Remediation:**
Maak dedicated applicatie users zonder superuser rechten.

---

### PG-2.3: Row Level Security waar nodig

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Gebruik Row Level Security voor multi-tenant data isolatie.

**Audit Procedure:**
```sql
SELECT schemaname, tablename, rowsecurity FROM pg_tables WHERE rowsecurity = true;
```

**Remediation:**
```sql
ALTER TABLE sensitive_data ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON sensitive_data
  USING (tenant_id = current_setting('app.tenant_id')::int);
```

---

### PG-2.4: Public schema rechten beperkt

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
De public schema moet geen default CREATE rechten hebben.

**Audit Procedure:**
```sql
SELECT nspname, nspacl FROM pg_namespace WHERE nspname = 'public';
```

**Remediation:**
```sql
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON DATABASE production FROM PUBLIC;
```

---

## 3. Encryption

### PG-3.1: SSL/TLS verplicht

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Alle database connecties moeten via SSL/TLS verlopen.

**Audit Procedure:**
```sql
SHOW ssl;
SELECT name, setting FROM pg_settings WHERE name LIKE '%ssl%';
```

**Remediation:**
```
# postgresql.conf
ssl = on
ssl_cert_file = '/path/to/server.crt'
ssl_key_file = '/path/to/server.key'

# pg_hba.conf - forceer SSL
hostssl all all 0.0.0.0/0 scram-sha-256
```

---

### PG-3.2: TLS 1.2 minimum

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Minimaal TLS 1.2 moet afgedwongen worden.

**Audit Procedure:**
```sql
SHOW ssl_min_protocol_version;
```

**Remediation:**
```
# postgresql.conf
ssl_min_protocol_version = 'TLSv1.2'
```

---

### PG-3.3: Data-at-rest encryptie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Database files moeten versleuteld zijn op disk niveau.

**Audit Procedure:**
```bash
# Check filesystem/volume encryption
lsblk -f
dmsetup status
```

**Remediation:**
Gebruik LUKS encrypted volumes of cloud provider encryption (zoals AWS EBS encryption).

---

### PG-3.4: pgcrypto voor gevoelige data

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Gebruik pgcrypto voor applicatie-niveau encryptie van gevoelige kolommen.

**Audit Procedure:**
```sql
SELECT * FROM pg_extension WHERE extname = 'pgcrypto';
```

**Remediation:**
```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;
-- Encrypt sensitive data
UPDATE users SET ssn = pgp_sym_encrypt(ssn, 'encryption_key');
```

---

## 4. Logging & Auditing

### PG-4.1: Connection logging

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Log alle connecties en disconnecties.

**Audit Procedure:**
```sql
SHOW log_connections;
SHOW log_disconnections;
```

**Remediation:**
```
# postgresql.conf
log_connections = on
log_disconnections = on
```

---

### PG-4.2: Statement logging

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Log DDL statements en optioneel DML voor gevoelige tabellen.

**Audit Procedure:**
```sql
SHOW log_statement;
```

**Remediation:**
```
# postgresql.conf
log_statement = 'ddl'  # of 'all' voor volledige logging
log_min_duration_statement = 1000  # log queries > 1s
```

---

### PG-4.3: Log file permissions

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Log bestanden moeten beperkte permissions hebben.

**Audit Procedure:**
```bash
ls -la /var/log/postgresql/
```

**Remediation:**
```
# postgresql.conf
log_file_mode = 0600
```

---

### PG-4.4: pgAudit extension

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Gebruik pgAudit voor gedetailleerde audit logging conform compliance eisen.

**Audit Procedure:**
```sql
SELECT * FROM pg_extension WHERE extname = 'pgaudit';
```

**Remediation:**
```sql
CREATE EXTENSION pgaudit;
-- postgresql.conf
shared_preload_libraries = 'pgaudit'
pgaudit.log = 'all'
```

---

## 5. Network Security

### PG-5.1: Bind to specific interface

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-12\|CIS-12]] Network Infrastructure |

**Beschrijving:**
PostgreSQL moet alleen luisteren op specifieke interfaces.

**Audit Procedure:**
```sql
SHOW listen_addresses;
```

**Remediation:**
```
# postgresql.conf
listen_addresses = '10.0.0.5'  # specifiek IP, niet '*'
```

---

### PG-5.2: Firewall regels

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-13\|CIS-13]] Network Monitoring |

**Beschrijving:**
Toegang tot port 5432 moet beperkt zijn via firewall.

**Audit Procedure:**
```bash
iptables -L -n | grep 5432
ss -tlnp | grep 5432
```

**Remediation:**
```bash
iptables -A INPUT -p tcp --dport 5432 -s 10.0.0.0/8 -j ACCEPT
iptables -A INPUT -p tcp --dport 5432 -j DROP
```

---

### PG-5.3: pg_hba.conf source IP restricties

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-12\|CIS-12]] Network Infrastructure |

**Beschrijving:**
Beperk database toegang tot specifieke source IPs.

**Audit Procedure:**
```bash
grep -v "^#" /var/lib/postgresql/data/pg_hba.conf | grep -v "^$"
```

**Remediation:**
```
# pg_hba.conf - specifieke subnets
hostssl all application 10.0.1.0/24 scram-sha-256
hostssl all admin 10.0.2.5/32 scram-sha-256
```

---

## 6. Backup & Recovery

### PG-6.1: Automated backups

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-11\|CIS-11]] Data Recovery |

**Beschrijving:**
Automatische backups moeten geconfigureerd zijn.

**Audit Procedure:**
```bash
# Check WAL archiving
psql -c "SHOW archive_mode;"
# Check backup cron
crontab -l | grep pg_dump
```

**Remediation:**
```
# postgresql.conf
archive_mode = on
archive_command = 'cp %p /backup/wal/%f'
```

---

### PG-6.2: Backup encryptie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-11\|CIS-11]] Data Recovery |

**Beschrijving:**
Backups moeten versleuteld worden opgeslagen.

**Audit Procedure:**
```bash
# Check backup encryption
file /backup/latest/*.backup
```

**Remediation:**
```bash
# Encrypt backup
pg_dump dbname | gpg --symmetric --cipher-algo AES256 > backup.sql.gpg
```

---

### PG-6.3: Backup restore test

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-11\|CIS-11]] Data Recovery |

**Beschrijving:**
Backup restores moeten periodiek getest worden.

**Audit Procedure:**
Controleer documentatie voor laatste restore test datum.

**Remediation:**
Plan maandelijkse restore tests naar een test omgeving.

---

## Samenvatting per Domein

| Domein | L1 | L2 | Totaal |
|--------|----|----|--------|
| 1. Authentication | 4 | 0 | 4 |
| 2. Authorization | 3 | 1 | 4 |
| 3. Encryption | 2 | 2 | 4 |
| 4. Logging & Auditing | 3 | 1 | 4 |
| 5. Network Security | 3 | 0 | 3 |
| 6. Backup & Recovery | 2 | 1 | 3 |
| **Totaal** | **16** | **5** | **21** |

---

## Referenties

- [CIS PostgreSQL 16 Benchmark](https://www.cisecurity.org/benchmark/postgresql)
- [PostgreSQL Security Documentation](https://www.postgresql.org/docs/current/security.html)
- [PostgreSQL Server Administration](https://www.postgresql.org/docs/current/admin.html)
