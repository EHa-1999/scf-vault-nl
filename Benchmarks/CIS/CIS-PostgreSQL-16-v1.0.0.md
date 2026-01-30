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

## Gerelateerde Documenten

- [[Components/PostgreSQL|PostgreSQL Component]]
- [[Documentatie/CIS Benchmark Handleiding|CIS Benchmark Handleiding]]
- Originele PDF: [CIS WorkBench](https://workbench.cisecurity.org/)

---

## Conversie Notities

> **Geconverteerd door:** Security Team  
> **Conversie datum:** 2026-01-30  
> **Bron PDF versie:** CIS PostgreSQL 16 Benchmark v1.0.0

**Geconverteerde secties:** 1-6 (kern recommendations)  
**Niet geconverteerd:** Sectie 7-8, Appendices (zie originele PDF voor volledige details)
