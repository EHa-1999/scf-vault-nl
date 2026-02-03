---
id: "CIS-PostgreSQL-16-v1.0.0"
type: benchmark
benchmark_type: "CIS"
name: "CIS PostgreSQL 16 Benchmark"
technology: "PostgreSQL"
technology_version: "16"
benchmark_version: "1.0.0"
cis_release_date: 2024-02-15
cis_download_url: "https://workbench.cisecurity.org/"
applies_to:
  - "[[Components/PostgreSQL]]"
status: Active
recommendations_count: 78
created: 2026-01-30
modified: 2026-01-30
tags:
  - benchmark
  - cis
  - postgresql
  - database
---

# CIS PostgreSQL 16 Benchmark v1.0.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | PostgreSQL 16 |
| **Benchmark Versie** | v1.0.0 |
| **CIS Release Datum** | 2024-02-15 |
| **Status** | Active |
| **Aantal Recommendations** | 78 |
| **Download** | [CIS WorkBench](https://workbench.cisecurity.org/) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/CIS/_index\|📘 CIS Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/PostgreSQL]] |

---

## Scope

### Van Toepassing Op

- PostgreSQL versie 16.x
- Zowel standalone als replication setups
- On-premise en cloud (self-managed) deployments

### Niet Van Toepassing Op

- PostgreSQL versies ouder dan 16
- Managed services (AWS RDS, Azure Database, etc.)
- PostgreSQL forks (bijv. EnterpriseDB)

---

## Profiel Definities

| Profiel | Beschrijving | Onze Keuze |
|---------|--------------|------------|
| **Level 1** | Basis security, minimale impact op functionaliteit | ✅ Verplicht |
| **Level 2** | Uitgebreide security, mogelijk impact op performance | ⚠️ Waar mogelijk |

---

## Recommendations Overzicht

| Sectie | Onderwerp | # Recs | Level 1 | Level 2 |
|--------|-----------|--------|---------|---------|
| 1 | Installation and Patches | 5 | 4 | 1 |
| 2 | Directory and File Permissions | 8 | 8 | 0 |
| 3 | Logging and Auditing | 15 | 12 | 3 |
| 4 | User Access and Authorization | 18 | 15 | 3 |
| 5 | Connection and Login | 12 | 10 | 2 |
| 6 | PostgreSQL Settings | 10 | 8 | 2 |
| 7 | Replication | 5 | 3 | 2 |
| 8 | Special Configuration | 5 | 3 | 2 |
| **Totaal** | | **78** | **63** | **15** |

> **Note:** Dit document bevat **key recommendations** met gedetailleerde audit en remediation stappen. Voor de complete lijst van alle 78 recommendations, zie de [[#Complete Recommendations Checklist|Complete Checklist]] sectie hieronder of download de officiële CIS Benchmark PDF.

---

## Key Recommendations

De volgende secties bevatten geselecteerde key recommendations met volledige technische details. Dit is **niet uitputtend** - zie de Complete Checklist voor alle recommendations.
| 8 | Special Configuration | 5 | 3 | 2 |
| **Totaal** | | **78** | **63** | **15** |

---

## 1. Installation and Patches

### 1.1 Ensure the latest PostgreSQL security patches are installed (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-7.4 - Voer Geautomatiseerd Applicatie Patchbeheer Uit\|CIS-7.4]] |

**Beschrijving:**
Zorg dat de laatste security patches voor PostgreSQL 16 zijn geïnstalleerd.

**Rationale:**
Ongepatchte database software bevat bekende kwetsbaarheden die kunnen leiden tot data breaches of denial of service.

**Audit:**
```sql
-- Controleer de huidige PostgreSQL versie
SELECT version();

-- Voorbeeld output:
-- PostgreSQL 16.2 on x86_64-pc-linux-gnu
```

```bash
# Controleer beschikbare updates (Ubuntu/Debian)
apt list --upgradable 2>/dev/null | grep postgresql

# Of voor RHEL/CentOS
yum check-update postgresql*
```

**Remediation:**
```bash
# Ubuntu/Debian
sudo apt update && sudo apt upgrade postgresql-16

# RHEL/CentOS
sudo yum update postgresql16-server
```

**Referenties:**
- [PostgreSQL Security Releases](https://www.postgresql.org/support/security/)
- [PostgreSQL Versioning Policy](https://www.postgresql.org/support/versioning/)

---

### 1.2 Ensure systemd service file has appropriate permissions (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4.1]] |

**Beschrijving:**
De PostgreSQL systemd service file moet alleen schrijfbaar zijn door root.

**Audit:**
```bash
stat /usr/lib/systemd/system/postgresql*.service

# Verwacht: permissions 644 of restrictiever
# Owner: root:root
```

**Remediation:**
```bash
sudo chmod 644 /usr/lib/systemd/system/postgresql*.service
sudo chown root:root /usr/lib/systemd/system/postgresql*.service
```

---

## 2. Directory and File Permissions

### 2.1 Ensure the data directory has appropriate permissions (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.3 - Configureer Toegangscontrolelijsten\|CIS-3.3]] |

**Beschrijving:**
De PostgreSQL data directory ($PGDATA) moet alleen toegankelijk zijn voor de postgres user.

**Audit:**
```bash
# Toon data directory
sudo -u postgres psql -c "SHOW data_directory;"

# Controleer permissions
ls -la /var/lib/postgresql/16/main/

# Verwacht: drwx------ postgres postgres
```

**Remediation:**
```bash
sudo chmod 700 /var/lib/postgresql/16/main
sudo chown postgres:postgres /var/lib/postgresql/16/main
```

---

### 2.2 Ensure the log directory has appropriate permissions (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.3 - Configureer Toegangscontrolelijsten\|CIS-3.3]] |

**Audit:**
```bash
ls -la /var/log/postgresql/
# Verwacht: drwxr-x--- postgres adm (of restrictiever)
```

**Remediation:**
```bash
sudo chmod 750 /var/log/postgresql
sudo chown postgres:adm /var/log/postgresql
```

---

## 3. Logging and Auditing

### 3.1 Ensure logging is enabled (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] |

**Beschrijving:**
PostgreSQL logging moet zijn ingeschakeld om security events te kunnen traceren.

**Audit:**
```sql
SHOW logging_collector;
-- Verwacht: on

SHOW log_destination;
-- Verwacht: 'stderr' of 'csvlog' of 'syslog'
```

**Remediation:**
```sql
-- In postgresql.conf
ALTER SYSTEM SET logging_collector = 'on';
ALTER SYSTEM SET log_destination = 'csvlog';

-- Herstart vereist
SELECT pg_reload_conf();
```

---

### 3.2 Ensure log_connections is enabled (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-8.5 - Verzamel Command-Line Logs\|CIS-8.5]] |

**Beschrijving:**
Log alle connection attempts om ongeautoriseerde toegangspogingen te detecteren.

**Audit:**
```sql
SHOW log_connections;
-- Verwacht: on
```

**Remediation:**
```sql
ALTER SYSTEM SET log_connections = 'on';
SELECT pg_reload_conf();
```

---

### 3.3 Ensure log_disconnections is enabled (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-8.5 - Verzamel Command-Line Logs\|CIS-8.5]] |

**Audit:**
```sql
SHOW log_disconnections;
-- Verwacht: on
```

**Remediation:**
```sql
ALTER SYSTEM SET log_disconnections = 'on';
SELECT pg_reload_conf();
```

---

### 3.4 Ensure log_statement is set appropriately (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] |

**Beschrijving:**
Log DDL statements om schema wijzigingen te traceren.

**Audit:**
```sql
SHOW log_statement;
-- Aanbevolen: 'ddl' (minimaal) of 'all' (uitgebreid)
```

**Remediation:**
```sql
-- DDL alleen (aanbevolen voor productie)
ALTER SYSTEM SET log_statement = 'ddl';

-- Of alles loggen (meer storage, maar complete audit trail)
ALTER SYSTEM SET log_statement = 'all';

SELECT pg_reload_conf();
```

---

## 4. User Access and Authorization

### 4.1 Ensure default admin account is disabled or renamed (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.7 - Beheer Standaardaccounts\|CIS-4.7]] |

**Beschrijving:**
De standaard 'postgres' superuser account moet worden beveiligd of vervangen.

**Audit:**
```sql
SELECT rolname, rolsuper, rolcanlogin 
FROM pg_roles 
WHERE rolname = 'postgres';
```

**Remediation:**
```sql
-- Optie 1: Maak nieuwe admin en disable postgres
CREATE ROLE db_admin WITH SUPERUSER LOGIN PASSWORD 'StrongPassword123!';
ALTER ROLE postgres WITH NOLOGIN;

-- Optie 2: Hernoem postgres account
-- (Niet aanbevolen vanwege compatibiliteit)
```

---

### 4.2 Ensure unnecessary privileges are revoked from PUBLIC (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-6.8 - Definieer RBAC\|CIS-6.8]] |

**Beschrijving:**
Standaard heeft PUBLIC (alle users) bepaalde privileges. Deze moeten worden ingetrokken.

**Audit:**
```sql
-- Check public privileges op databases
SELECT datname, datacl FROM pg_database;

-- Check public privileges op schema's
SELECT nspname, nspacl FROM pg_namespace WHERE nspname = 'public';
```

**Remediation:**
```sql
-- Revoke connect privilege from public
REVOKE CONNECT ON DATABASE mydb FROM PUBLIC;

-- Revoke create privilege on public schema
REVOKE CREATE ON SCHEMA public FROM PUBLIC;

-- Grant only to specific roles
GRANT CONNECT ON DATABASE mydb TO app_role;
```

---

### 4.3 Ensure password complexity requirements are enforced (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-5.2 - Gebruik Unieke Wachtwoorden\|CIS-5.2]] |

**Beschrijving:**
Gebruik de passwordcheck extension of externe authenticatie voor password complexity.

**Audit:**
```sql
SELECT name, setting FROM pg_settings WHERE name = 'shared_preload_libraries';
-- Verwacht: passwordcheck in de lijst
```

**Remediation:**
```bash
# In postgresql.conf
shared_preload_libraries = 'passwordcheck'

# Herstart PostgreSQL
sudo systemctl restart postgresql
```

---

## 5. Connection and Login

### 5.1 Ensure pg_hba.conf is configured securely (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-6.6 - Stel Toegangscontrolelijsten Op\|CIS-6.6]] |

**Beschrijving:**
De pg_hba.conf file bepaalt wie mag connecten. Vermijd 'trust' en beperk IP ranges.

**Audit:**
```bash
# Controleer pg_hba.conf
sudo cat /etc/postgresql/16/main/pg_hba.conf | grep -v '^#' | grep -v '^$'
```

**Verwacht:**
- Geen regels met `trust` method
- Geen regels met `0.0.0.0/0` tenzij noodzakelijk
- `scram-sha-256` of `md5` als auth method

**Remediation:**
```bash
# In pg_hba.conf - vervang trust door scram-sha-256
# TYPE  DATABASE  USER      ADDRESS        METHOD
local   all       postgres                 peer
host    all       all       127.0.0.1/32   scram-sha-256
host    all       all       10.0.0.0/8     scram-sha-256
```

---

### 5.2 Ensure SSL is enabled (Level 1)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |

**Beschrijving:**
Alle client-server communicatie moet via SSL/TLS verlopen.

**Audit:**
```sql
SHOW ssl;
-- Verwacht: on

SHOW ssl_min_protocol_version;
-- Verwacht: TLSv1.2 of hoger
```

**Remediation:**
```sql
ALTER SYSTEM SET ssl = 'on';
ALTER SYSTEM SET ssl_min_protocol_version = 'TLSv1.2';

-- Zorg voor certificaten
-- ssl_cert_file = '/etc/ssl/certs/server.crt'
-- ssl_key_file = '/etc/ssl/private/server.key'

SELECT pg_reload_conf();
```

---

## 6. PostgreSQL Settings

### 6.1 Ensure data encryption at rest is configured (Level 2)

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 2 |
| **CIS Control** | [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] |

**Beschrijving:**
Data at rest moet worden versleuteld via filesystem encryption of TDE.

**Audit:**
```bash
# Controleer of data directory op encrypted filesystem staat
lsblk -o NAME,FSTYPE,MOUNTPOINT,SIZE,TYPE,ENCRYPTED

# Of controleer TDE extensie (indien beschikbaar)
```

**Remediation:**
```bash
# Optie 1: LUKS filesystem encryption
sudo cryptsetup luksFormat /dev/sdX
sudo cryptsetup luksOpen /dev/sdX pgdata_crypt
sudo mkfs.ext4 /dev/mapper/pgdata_crypt
sudo mount /dev/mapper/pgdata_crypt /var/lib/postgresql/16/main

# Optie 2: Gebruik pg_tde extensie (indien beschikbaar)
```

---

## CIS Controls Mapping

### Mapping Overzicht

| CIS Control | Recommendations | Level |
|-------------|-----------------|-------|
| [[Controls/CIS/CIS-3.3 - Configureer Toegangscontrolelijsten\|CIS-3.3]] | 2.1, 2.2 | 1 |
| [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] | 5.2 | 1 |
| [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] | 6.1 | 2 |
| [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4.1]] | 1.2 | 1 |
| [[Controls/CIS/CIS-4.7 - Beheer Standaardaccounts\|CIS-4.7]] | 4.1 | 1 |
| [[Controls/CIS/CIS-5.2 - Gebruik Unieke Wachtwoorden\|CIS-5.2]] | 4.3 | 1 |
| [[Controls/CIS/CIS-6.6 - Stel Toegangscontrolelijsten Op\|CIS-6.6]] | 5.1 | 1 |
| [[Controls/CIS/CIS-6.8 - Definieer RBAC\|CIS-6.8]] | 4.2 | 1 |
| [[Controls/CIS/CIS-7.4 - Voer Geautomatiseerd Applicatie Patchbeheer Uit\|CIS-7.4]] | 1.1 | 1 |
| [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] | 3.1, 3.4 | 1 |
| [[Controls/CIS/CIS-8.5 - Verzamel Command-Line Logs\|CIS-8.5]] | 3.2, 3.3 | 1 |

---

## Implementatie Tracking

```dataview
TABLE WITHOUT ID
  link(file.link, control_id) as "Control",
  impl_status as "Status",
  impl_percentage + "%" as "Voortgang"
FROM "Implementations"
WHERE contains(string(benchmark), "PostgreSQL")
SORT control_id ASC
```

---

## Wijzigingshistorie CIS

| CIS Versie | Datum | Belangrijkste Wijzigingen |
|------------|-------|---------------------------|
| v1.0.0 | 2024-02-15 | Initiële versie voor PostgreSQL 16 |

---

## Complete Recommendations Checklist

Deze checklist bevat **alle 78 recommendations** uit de CIS PostgreSQL 16 Benchmark v1.0.0. Gebruik dit voor het bijhouden van implementatie voortgang.

### 1. Installation and Patches

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.1 | Ensure the latest PostgreSQL minor version is installed | L1 | ☐ |
| 1.2 | Ensure systemd service file is configured | L1 | ☐ |
| 1.3 | Ensure data cluster is initialized | L1 | ☐ |
| 1.4 | Ensure PostgreSQL is not installed on a shared host | L2 | ☐ |
| 1.5 | Ensure the PostgreSQL configuration file is owned by the database account | L1 | ☐ |

### 2. Directory and File Permissions

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 2.1 | Ensure the file permissions on data cluster are correct | L1 | ☐ |
| 2.2 | Ensure the file permissions on PostgreSQL configuration files are correct | L1 | ☐ |
| 2.3 | Ensure the log file destination directory has appropriate permissions | L1 | ☐ |
| 2.4 | Ensure the Unix socket directory is correct | L1 | ☐ |
| 2.5 | Ensure the file permissions on Unix socket are correct | L1 | ☐ |
| 2.6 | Ensure SSL certificates are owned by postgres | L1 | ☐ |
| 2.7 | Ensure SSL certificate files permissions are correct | L1 | ☐ |
| 2.8 | Ensure pg_hba.conf file permissions are correct | L1 | ☐ |

### 3. Logging and Auditing

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 3.1 | Ensure logging is enabled | L1 | ☐ |
| 3.2 | Ensure log destination is properly configured | L1 | ☐ |
| 3.3 | Ensure log_directory is set correctly | L1 | ☐ |
| 3.4 | Ensure log_filename is set correctly | L1 | ☐ |
| 3.5 | Ensure log_file_mode is set correctly | L1 | ☐ |
| 3.6 | Ensure log_truncate_on_rotation is configured | L1 | ☐ |
| 3.7 | Ensure log_rotation_age is configured | L1 | ☐ |
| 3.8 | Ensure log_rotation_size is configured | L1 | ☐ |
| 3.9 | Ensure syslog_facility is configured | L1 | ☐ |
| 3.10 | Ensure log_min_messages is set to warning or higher | L1 | ☐ |
| 3.11 | Ensure log_min_error_statement is set to error or higher | L1 | ☐ |
| 3.12 | Ensure log_connections is enabled | L1 | ☐ |
| 3.13 | Ensure log_disconnections is enabled | L1 | ☐ |
| 3.14 | Ensure log_line_prefix is set correctly | L2 | ☐ |
| 3.15 | Ensure log_statement is set to 'ddl' or higher | L2 | ☐ |

### 4. User Access and Authorization

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.1 | Ensure sudo is configured correctly | L1 | ☐ |
| 4.2 | Ensure excessive administrative privileges are revoked | L1 | ☐ |
| 4.3 | Ensure excessive function privileges are revoked | L1 | ☐ |
| 4.4 | Ensure excessive DML privileges are revoked | L1 | ☐ |
| 4.5 | Ensure row level security is configured correctly | L2 | ☐ |
| 4.6 | Ensure the PUBLIC schema has appropriate privileges | L1 | ☐ |
| 4.7 | Ensure the set_user extension is installed | L2 | ☐ |
| 4.8 | Ensure PostgreSQL utilizes strong password encryption | L1 | ☐ |
| 4.9 | Ensure only approved extensions are installed | L1 | ☐ |
| 4.10 | Ensure the pgcrypto extension is installed | L1 | ☐ |
| 4.11 | Ensure miscellaneous objects are owned by appropriate users | L1 | ☐ |
| 4.12 | Ensure role memberships are properly maintained | L1 | ☐ |
| 4.13 | Ensure default privileges are properly configured | L1 | ☐ |
| 4.14 | Ensure login accounts have validity dates | L1 | ☐ |
| 4.15 | Ensure LOGIN privilege is restricted | L1 | ☐ |
| 4.16 | Ensure SUPERUSER role is restricted | L1 | ☐ |
| 4.17 | Ensure CREATEDB privilege is restricted | L1 | ☐ |
| 4.18 | Ensure CREATEROLE privilege is restricted | L2 | ☐ |

### 5. Connection and Login

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.1 | Ensure login via local Unix socket is configured correctly | L1 | ☐ |
| 5.2 | Ensure login via hostssl is configured correctly | L1 | ☐ |
| 5.3 | Ensure login via host is disabled | L1 | ☐ |
| 5.4 | Ensure authentication timeout is configured | L1 | ☐ |
| 5.5 | Ensure SSL is enabled | L1 | ☐ |
| 5.6 | Ensure only approved ciphers are used | L1 | ☐ |
| 5.7 | Ensure TLS is enabled | L1 | ☐ |
| 5.8 | Ensure min_protocol_version is set | L1 | ☐ |
| 5.9 | Ensure ssl_passphrase_command is configured | L2 | ☐ |
| 5.10 | Ensure client certificates are verified | L2 | ☐ |
| 5.11 | Ensure connection limits are configured | L1 | ☐ |
| 5.12 | Ensure the maximum number of connections is configured | L1 | ☐ |

### 6. PostgreSQL Settings

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 6.1 | Ensure shared_preload_libraries is configured | L1 | ☐ |
| 6.2 | Ensure the pgaudit extension is enabled | L2 | ☐ |
| 6.3 | Ensure backend runtime parameters are configured | L1 | ☐ |
| 6.4 | Ensure FIPS compliant cryptography is enabled | L2 | ☐ |
| 6.5 | Ensure password_encryption is configured | L1 | ☐ |
| 6.6 | Ensure pg_stat_statements is enabled | L1 | ☐ |
| 6.7 | Ensure auto_explain is configured | L1 | ☐ |
| 6.8 | Ensure server hostname is configured | L1 | ☐ |
| 6.9 | Ensure the log collector is enabled | L1 | ☐ |
| 6.10 | Ensure session preload libraries are configured | L1 | ☐ |

### 7. Replication

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 7.1 | Ensure replication user is configured | L1 | ☐ |
| 7.2 | Ensure base backups are configured correctly | L1 | ☐ |
| 7.3 | Ensure WAL archiving is configured | L1 | ☐ |
| 7.4 | Ensure streaming replication is configured | L2 | ☐ |
| 7.5 | Ensure synchronous replication is configured | L2 | ☐ |

### 8. Special Configuration

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 8.1 | Ensure temporary file limit is configured | L1 | ☐ |
| 8.2 | Ensure memory parameters are configured | L1 | ☐ |
| 8.3 | Ensure vacuum parameters are configured | L1 | ☐ |
| 8.4 | Ensure query planning parameters are configured | L2 | ☐ |
| 8.5 | Ensure error reporting is configured | L2 | ☐ |

---

## Official Source

> **CIS Benchmark PDF Download**
> 
> De complete CIS PostgreSQL 16 Benchmark v1.0.0 met alle 78 recommendations, gedetailleerde rationale, en volledige audit/remediation procedures is gratis beschikbaar (voor niet-commercieel gebruik):
> 
> → **[CIS WorkBench](https://workbench.cisecurity.org/)** (gratis registratie vereist)
> 
> → **[CIS PostgreSQL Benchmark Page](https://www.cisecurity.org/benchmark/postgresql)**

---

## Gerelateerde Documenten

- [[Components/PostgreSQL|PostgreSQL Component]]
- [[Documentatie/CIS Benchmark Handleiding|CIS Benchmark Handleiding]]
- Originele PDF: [CIS WorkBench](https://workbench.cisecurity.org/)
