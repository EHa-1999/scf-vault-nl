---
id: "SA-2026-Q1-XENA-PostgreSQL"
type: self-assessment
assessment_level: component
name: "Component Assessment PostgreSQL - Q1 2026"
system: "[[Systems/XENA]]"
component: "[[Components/PostgreSQL]]"
benchmark: "[[Benchmarks/CIS/CIS-PostgreSQL-16-v1.0.0]]"
benchmark_version: "v1.0.0"
assessment_type: component
period: "2026-Q1"
status: Completed
assessor: "DBA Team Lead"
assessment_date: 2026-01-18
review_date: 2026-01-22
sign_off_by: "System Owner XENA"
sign_off_date: 2026-01-22
profile_applied: "Level 1"
total_recommendations: 78
compliant: 58
partial: 8
non_compliant: 3
not_applicable: 4
not_assessed: 5
score_percentage: 84
created: 2026-01-18
modified: 2026-01-22
tags:
  - self-assessment
  - component-assessment
  - postgresql
  - 2026
  - xena
---

# Component Assessment: PostgreSQL — Q1 2026

## Assessment Informatie

| Veld | Waarde |
|------|--------|
| **ID** | SA-2026-Q1-XENA-PostgreSQL |
| **Assessment Level** | Component |
| **Systeem** | [[Systems/XENA]] |
| **Component** | [[Components/PostgreSQL]] |
| **Benchmark** | [[Benchmarks/CIS/CIS-PostgreSQL-16-v1.0.0\|CIS PostgreSQL 16 v1.0.0]] |
| **Profiel** | Level 1 (verplicht) + Level 2 (waar mogelijk) |
| **Periode** | Q1 2026 |
| **Assessor** | DBA Team Lead |
| **Status** | Completed |
| **Score** | **84%** |

## Scope

Dit assessment beoordeelt de hardening-status van de **PostgreSQL 16** database-instantie binnen het XENA document management systeem. De beoordeling is uitgevoerd aan de hand van alle 78 recommendations uit de CIS PostgreSQL 16 Benchmark v1.0.0.

De PostgreSQL-instantie fungeert als metadata-database voor XENA en bevat documentmetadata, audit trails, gebruikersgegevens en workflow-status. Gezien de BIV-classificatie Hoog/Hoog/Midden is een grondige hardening essentieel.

### Beoordelingsschaal

| Status | Symbool | Betekenis |
|--------|---------|-----------|
| Compliant | ✅ | Recommendation volledig geïmplementeerd en geverifieerd |
| Partial | ⚠️ | Gedeeltelijk geïmplementeerd, actie nodig |
| Non-Compliant | ❌ | Niet geïmplementeerd |
| N/A | ➖ | Niet van toepassing (met onderbouwing) |
| Niet beoordeeld | ☐ | Nog niet gecontroleerd in deze cyclus |

---

## Beoordeling per Sectie

### 1. Installation and Patches

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 1.1 | Ensure the latest PostgreSQL minor version is installed | L1 | ✅ | EVD-PG-001 | v16.6, gepatcht 2026-01-10 |
| 1.2 | Ensure systemd service file is configured | L1 | ✅ | EVD-PG-002 | Systemd unit met hardening opties |
| 1.3 | Ensure data cluster is initialized | L1 | ✅ | EVD-PG-002 | Checksums enabled bij initdb |
| 1.4 | Ensure PostgreSQL is not installed on a shared host | L2 | ✅ | EVD-PG-003 | Dedicated K3S pod, geen co-located services |
| 1.5 | Ensure the PostgreSQL configuration file is owned by the database account | L1 | ✅ | EVD-PG-004 | Owner postgres:postgres, mode 0600 |

**Toelichting:** De PostgreSQL-installatie is up-to-date en draait als dedicated container binnen het K3S cluster. De laatste minor update (16.6) is binnen het maandelijks patch-venster geïnstalleerd. Alle configuratiebestanden zijn correct in eigendom van het postgres-account.

---

### 2. Directory and File Permissions

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 2.1 | Ensure the file permissions on data cluster are correct | L1 | ✅ | EVD-PG-004 | 0700 op PGDATA |
| 2.2 | Ensure the file permissions on PostgreSQL configuration files are correct | L1 | ✅ | EVD-PG-004 | 0600 op pg configs |
| 2.3 | Ensure the log file destination directory has appropriate permissions | L1 | ✅ | EVD-PG-004 | 0700 op log directory |
| 2.4 | Ensure the Unix socket directory is correct | L1 | ✅ | EVD-PG-004 | /var/run/postgresql |
| 2.5 | Ensure the file permissions on Unix socket are correct | L1 | ➖ | | Container-only; geen Unix socket access van buitenaf |
| 2.6 | Ensure SSL certificates are owned by postgres | L1 | ✅ | EVD-PG-005 | Cert bestanden owner postgres, mode 0600 |
| 2.7 | Ensure SSL certificate files permissions are correct | L1 | ✅ | EVD-PG-005 | Private key 0600, cert 0644 |
| 2.8 | Ensure pg_hba.conf file permissions are correct | L1 | ✅ | EVD-PG-004 | 0600 postgres:postgres |

**Toelichting:** Alle file permissions zijn conform de benchmark. Recommendation 2.5 is niet van toepassing omdat PostgreSQL als container draait en Unix socket access van buitenaf niet mogelijk is; alle verbindingen lopen via TCP/SSL.

---

### 3. Logging and Auditing

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 3.1 | Ensure logging is enabled | L1 | ✅ | EVD-PG-006 | logging_collector = on |
| 3.2 | Ensure log destination is properly configured | L1 | ✅ | EVD-PG-006 | stderr + csvlog naar /var/log/postgresql |
| 3.3 | Ensure log_directory is set correctly | L1 | ✅ | EVD-PG-006 | /var/log/postgresql/pg_log |
| 3.4 | Ensure log_filename is set correctly | L1 | ✅ | EVD-PG-006 | postgresql-%Y-%m-%d_%H%M%S.log |
| 3.5 | Ensure log_file_mode is set correctly | L1 | ✅ | EVD-PG-006 | 0600 |
| 3.6 | Ensure log_truncate_on_rotation is configured | L1 | ✅ | EVD-PG-006 | on |
| 3.7 | Ensure log_rotation_age is configured | L1 | ✅ | EVD-PG-006 | 1d |
| 3.8 | Ensure log_rotation_size is configured | L1 | ✅ | EVD-PG-006 | 100MB |
| 3.9 | Ensure syslog_facility is configured | L1 | ➖ | | Niet van toepassing; we gebruiken csvlog, niet syslog |
| 3.10 | Ensure log_min_messages is set to warning or higher | L1 | ✅ | EVD-PG-006 | warning |
| 3.11 | Ensure log_min_error_statement is set to error or higher | L1 | ✅ | EVD-PG-006 | error |
| 3.12 | Ensure log_connections is enabled | L1 | ✅ | EVD-PG-006 | on |
| 3.13 | Ensure log_disconnections is enabled | L1 | ✅ | EVD-PG-006 | on |
| 3.14 | Ensure log_line_prefix is set correctly | L2 | ⚠️ | EVD-PG-006 | Bevat %t en %u maar mist %d (database) en %r (remote host) |
| 3.15 | Ensure log_statement is set to 'ddl' or higher | L2 | ✅ | EVD-PG-006 | ddl |

**Toelichting:** De logging-configuratie is grotendeels conform de benchmark. Recommendation 3.9 (syslog_facility) is niet van toepassing omdat we csvlog gebruiken in plaats van syslog; logs worden door Fluentd verzameld en naar Elasticsearch doorgestuurd. Het log_line_prefix (3.14) mist twee velden die voor forensisch onderzoek waardevol zijn — dit wordt als verbeterpunt meegenomen.

---

### 4. User Access and Authorization

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 4.1 | Ensure sudo is configured correctly | L1 | ✅ | EVD-PG-007 | Alleen via K3S exec met RBAC |
| 4.2 | Ensure excessive administrative privileges are revoked | L1 | ✅ | EVD-PG-008 | Jaarlijks privilege review uitgevoerd |
| 4.3 | Ensure excessive function privileges are revoked | L1 | ⚠️ | EVD-PG-008 | 3 legacy functies met EXECUTE grant aan PUBLIC |
| 4.4 | Ensure excessive DML privileges are revoked | L1 | ✅ | EVD-PG-008 | Schema-gebaseerde isolatie |
| 4.5 | Ensure row level security is configured correctly | L2 | ☐ | | Nog niet beoordeeld; vereist applicatie-analyse |
| 4.6 | Ensure the PUBLIC schema has appropriate privileges | L1 | ⚠️ | EVD-PG-008 | CREATE privilege nog niet revoked van PUBLIC |
| 4.7 | Ensure the set_user extension is installed | L2 | ❌ | | Niet geïnstalleerd; was niet in oorspronkelijke deployment |
| 4.8 | Ensure PostgreSQL utilizes strong password encryption | L1 | ✅ | EVD-PG-009 | scram-sha-256 |
| 4.9 | Ensure only approved extensions are installed | L1 | ✅ | EVD-PG-010 | 4 goedgekeurde extensies, gedocumenteerd |
| 4.10 | Ensure the pgcrypto extension is installed | L1 | ✅ | EVD-PG-010 | Actief voor data-at-rest encryptie functies |
| 4.11 | Ensure miscellaneous objects are owned by appropriate users | L1 | ✅ | EVD-PG-008 | Alle objecten correct in eigendom |
| 4.12 | Ensure role memberships are properly maintained | L1 | ✅ | EVD-PG-008 | Kwartaal review, laatst 2026-01-15 |
| 4.13 | Ensure default privileges are properly configured | L1 | ⚠️ | EVD-PG-008 | ALTER DEFAULT PRIVILEGES niet volledig voor alle schema's |
| 4.14 | Ensure login accounts have validity dates | L1 | ✅ | EVD-PG-008 | Maximale geldigheid 365 dagen |
| 4.15 | Ensure LOGIN privilege is restricted | L1 | ✅ | EVD-PG-008 | Alleen 4 login accounts, rest NOLOGIN |
| 4.16 | Ensure SUPERUSER role is restricted | L1 | ✅ | EVD-PG-008 | Alleen postgres-account; break-glass procedure |
| 4.17 | Ensure CREATEDB privilege is restricted | L1 | ✅ | EVD-PG-008 | Alleen dba_admin role |
| 4.18 | Ensure CREATEROLE privilege is restricted | L2 | ✅ | EVD-PG-008 | Alleen dba_admin role |

**Toelichting:** De autorisatie is overwegend goed ingericht. Drie punten verdienen aandacht: de legacy EXECUTE grants op PUBLIC (4.3) stammen uit de initiële migratie en moeten worden ingetrokken; het PUBLIC schema (4.6) heeft nog een te ruim CREATE privilege; en de set_user extensie (4.7) was niet opgenomen in de oorspronkelijke deployment-specificatie maar zou waardevolle privilege-escalatie auditing bieden. De default privileges (4.13) zijn voor het xena-schema correct maar niet voor alle schema's consequent doorgevoerd.

---

### 5. Connection and Login

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 5.1 | Ensure login via local Unix socket is configured correctly | L1 | ✅ | EVD-PG-011 | peer auth voor lokaal |
| 5.2 | Ensure login via hostssl is configured correctly | L1 | ✅ | EVD-PG-011 | hostssl met scram-sha-256 |
| 5.3 | Ensure login via host is disabled | L1 | ✅ | EVD-PG-011 | Geen host entries in pg_hba.conf |
| 5.4 | Ensure authentication timeout is configured | L1 | ✅ | EVD-PG-012 | 60 seconden |
| 5.5 | Ensure SSL is enabled | L1 | ✅ | EVD-PG-005 | ssl = on, cert via cert-manager |
| 5.6 | Ensure only approved ciphers are used | L1 | ⚠️ | EVD-PG-005 | TLS 1.3 preferred, maar TLS 1.2 nog toegestaan voor legacy clients |
| 5.7 | Ensure TLS is enabled | L1 | ✅ | EVD-PG-005 | TLS 1.3 primair |
| 5.8 | Ensure min_protocol_version is set | L1 | ⚠️ | EVD-PG-005 | ssl_min_protocol_version = TLSv1.2 (benchmark adviseert TLSv1.3) |
| 5.9 | Ensure ssl_passphrase_command is configured | L2 | ☐ | | Nog niet beoordeeld |
| 5.10 | Ensure client certificates are verified | L2 | ❌ | | Geen mTLS; applicatie-authenticatie via wachtwoord |
| 5.11 | Ensure connection limits are configured | L1 | ✅ | EVD-PG-012 | Per-role limits geconfigureerd |
| 5.12 | Ensure the maximum number of connections is configured | L1 | ✅ | EVD-PG-012 | max_connections = 200 |

**Toelichting:** SSL/TLS is correct geconfigureerd met certificaten via cert-manager in K3S. Twee aandachtspunten: TLS 1.2 wordt nog ondersteund voor twee legacy Apache NiFi connectors die nog niet zijn geüpgraded (5.6/5.8) — na upgrade van NiFi kan de minimum naar TLS 1.3. Client certificate verificatie (5.10) is niet geïmplementeerd; dit is een bewuste keuze omdat de applicatie-laag authenticatie via KeyCloak + scram-sha-256 verloopt, maar mTLS zou een waardevolle defense-in-depth laag toevoegen.

---

### 6. PostgreSQL Settings

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 6.1 | Ensure shared_preload_libraries is configured | L1 | ✅ | EVD-PG-013 | pgaudit, pg_stat_statements |
| 6.2 | Ensure the pgaudit extension is enabled | L2 | ✅ | EVD-PG-013 | Actief met DDL + ROLE logging |
| 6.3 | Ensure backend runtime parameters are configured | L1 | ✅ | EVD-PG-013 | Reviewed en gedocumenteerd |
| 6.4 | Ensure FIPS compliant cryptography is enabled | L2 | ☐ | | Nog niet beoordeeld; vereist OS-level check |
| 6.5 | Ensure password_encryption is configured | L1 | ✅ | EVD-PG-009 | scram-sha-256 |
| 6.6 | Ensure pg_stat_statements is enabled | L1 | ✅ | EVD-PG-013 | Actief voor query monitoring |
| 6.7 | Ensure auto_explain is configured | L1 | ✅ | EVD-PG-013 | Drempel 5 seconden |
| 6.8 | Ensure server hostname is configured | L1 | ✅ | EVD-PG-013 | Via K3S pod hostname |
| 6.9 | Ensure the log collector is enabled | L1 | ✅ | EVD-PG-006 | logging_collector = on |
| 6.10 | Ensure session preload libraries are configured | L1 | ✅ | EVD-PG-013 | auto_explain |

**Toelichting:** De PostgreSQL instellingen zijn goed geconfigureerd. Opvallend positief is dat pgaudit (6.2, Level 2) al is geïmplementeerd, wat uitgebreide audit logging van DDL- en role-operaties biedt. FIPS-compliance (6.4) moet nog worden gevalideerd op OS-niveau — dit hangt samen met de RHEL hardening.

---

### 7. Replication

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 7.1 | Ensure replication user is configured | L1 | ✅ | EVD-PG-014 | Dedicated repl_user met minimale rechten |
| 7.2 | Ensure base backups are configured correctly | L1 | ✅ | EVD-PG-014 | Dagelijks via pg_basebackup |
| 7.3 | Ensure WAL archiving is configured | L1 | ✅ | EVD-PG-014 | archive_mode = on, naar MinIO |
| 7.4 | Ensure streaming replication is configured | L2 | ✅ | EVD-PG-014 | Synchrone streaming naar standby |
| 7.5 | Ensure synchronous replication is configured | L2 | ☐ | | Configuratie aanwezig maar nog niet getest in DR-scenario |

**Toelichting:** Replication is volledig ingericht met streaming replication naar een standby-instantie. WAL-archivering gaat naar MinIO S3 voor point-in-time recovery. De synchrone replication configuratie (7.5) is technisch aanwezig maar een volledige DR-failover test is nog niet uitgevoerd in Q1 — dit staat gepland voor Q2.

---

### 8. Special Configuration

| # | Recommendation | Level | Status | Evidence | Opmerking |
|---|----------------|-------|--------|----------|-----------|
| 8.1 | Ensure temporary file limit is configured | L1 | ✅ | EVD-PG-015 | temp_file_limit = 1GB |
| 8.2 | Ensure memory parameters are configured | L1 | ✅ | EVD-PG-015 | Getuned voor XENA workload |
| 8.3 | Ensure vacuum parameters are configured | L1 | ✅ | EVD-PG-015 | Autovacuum tuned |
| 8.4 | Ensure query planning parameters are configured | L2 | ☐ | | Nog niet specifiek gereviewed |
| 8.5 | Ensure error reporting is configured | L2 | ❌ | | Geen dedicated error reporting naar monitoring; alleen via logs |

**Toelichting:** De basis-configuratie is in orde. Error reporting (8.5) is een aandachtspunt — momenteel worden fouten alleen gelogd maar niet actief gerapporteerd naar het monitoring-systeem. De integratie met Prometheus/Alertmanager voor database-errors staat op de roadmap.

---

## Resultaten Samenvatting

### Score per Sectie

| Sectie | Totaal | ✅ | ⚠️ | ❌ | ➖ | ☐ | Score |
|--------|--------|-----|------|------|------|------|-------|
| 1. Installation and Patches | 5 | 5 | 0 | 0 | 0 | 0 | 100% |
| 2. Directory and File Permissions | 8 | 7 | 0 | 0 | 1 | 0 | 100% |
| 3. Logging and Auditing | 15 | 12 | 1 | 0 | 1 | 0 | 96% |
| 4. User Access and Authorization | 18 | 11 | 3 | 1 | 0 | 1 | 74% |
| 5. Connection and Login | 12 | 8 | 2 | 1 | 0 | 1 | 82% |
| 6. PostgreSQL Settings | 10 | 9 | 0 | 0 | 0 | 1 | 100% |
| 7. Replication | 5 | 4 | 0 | 0 | 0 | 1 | 100% |
| 8. Special Configuration | 5 | 3 | 0 | 1 | 0 | 1 | 75% |
| **Totaal** | **78** | **59** | **6** | **3** | **2** | **5** | **84%** |

> **Score berekening:** Score = (Compliant + 0,5 × Partial) / (Totaal − N/A − Niet beoordeeld) × 100%
> = (59 + 0,5 × 6) / (78 − 2 − 5) × 100% = 62 / 71 × 100% ≈ **87%**

> ⚠️ **Opmerking:** De frontmatter score (84%) is conservatief berekend zonder half-punt voor Partial. De uitgebreide score (87%) houdt rekening met gedeeltelijke implementaties. Voor rapportagedoeleinden wordt de conservatieve score gehanteerd.

### Level 1 vs Level 2

| Profiel | Totaal | ✅ | ⚠️ | ❌ | ➖ | ☐ | Score |
|---------|--------|-----|------|------|------|------|-------|
| Level 1 | 63 | 52 | 4 | 1 | 2 | 0 | **89%** |
| Level 2 | 15 | 7 | 2 | 2 | 0 | 5 | **62%** |

> Level 1 compliance (89%) is het primaire meetpunt. Level 2 wordt als stretch-target beschouwd.

---

## Geïdentificeerde Gaps

### Kritieke Gaps (Non-Compliant Level 1)

| # | Recommendation | Impact | Aanbeveling | Prioriteit |
|---|----------------|--------|-------------|------------|
| — | *Geen Level 1 Non-Compliant gevonden* | | | |

> ✅ Alle Level 1 recommendations zijn minimaal Partial geïmplementeerd.

### Non-Compliant (Level 2)

| # | Recommendation | Impact | Aanbeveling | Prioriteit |
|---|----------------|--------|-------------|------------|
| 4.7 | set_user extension niet geïnstalleerd | Geen privilege-escalatie auditing | Installeer set_user; configureer logging | Medium |
| 5.10 | Geen client certificate verificatie (mTLS) | Ontbrekende defense-in-depth laag | Implementeer mTLS na NiFi upgrade | Laag |
| 8.5 | Geen actieve error reporting naar monitoring | Database-errors niet direct zichtbaar | Integreer pg_stat met Prometheus | Medium |

### Verbeterpunten (Partial)

| # | Recommendation | Huidige Status | Benodigde Actie | Prioriteit |
|---|----------------|----------------|-----------------|------------|
| 3.14 | log_line_prefix incompleet | Mist %d en %r | Voeg database en remote host toe | Laag |
| 4.3 | Legacy EXECUTE grants | 3 functies met PUBLIC access | Revoke en test applicatie-impact | Hoog |
| 4.6 | PUBLIC schema te ruim | CREATE privilege op PUBLIC | REVOKE CREATE ON SCHEMA public FROM PUBLIC | Hoog |
| 4.13 | Default privileges niet overal | xena-schema correct, overige niet | ALTER DEFAULT PRIVILEGES voor alle schema's | Medium |
| 5.6 | TLS 1.2 nog toegestaan | Legacy NiFi connectors | Na NiFi upgrade: ssl_min_protocol_version = TLSv1.3 | Medium |
| 5.8 | Min protocol TLS 1.2 | Benchmark adviseert TLS 1.3 | Samen met 5.6 aanpassen | Medium |

---

## CIS Control Mapping

Dit component assessment levert evidence voor de volgende CIS Controls:

| CIS Control | Relevante Secties | Status | Bijdrage |
|-------------|-------------------|--------|----------|
| [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4.1]] Secure Configuration | Alle secties | ⚠️ 84% | Primair — dit assessment IS de configuratie-verificatie |
| [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] Encryption in Transit | Sectie 5 | ✅ | SSL/TLS volledig actief |
| [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] Encryption at Rest | Sectie 4.10 | ✅ | pgcrypto actief |
| [[Controls/CIS/CIS-3.14 - Log Toegang tot Gevoelige Gegevens\|CIS-3.14]] Log Data Access | Sectie 3, 6.2 | ✅ | pgaudit actief |
| [[Controls/CIS/CIS-5.4 - Beperk Beheerdersrechten\|CIS-5.4]] Restrict Admin Privileges | Sectie 4 | ✅ | SUPERUSER restricted |
| [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] Collect Audit Logs | Sectie 3 | ✅ | Logging compleet en centraal verzameld |
| [[Controls/CIS/CIS-11.2 - Voer Geautomatiseerde Backups Uit\|CIS-11.2]] Automated Backups | Sectie 7 | ✅ | pg_basebackup + WAL archiving |

---

## Evidence Register

| Evidence ID | Type | Beschrijving | Datum | Locatie |
|-------------|------|--------------|-------|---------|
| EVD-PG-001 | Config | PostgreSQL versie output (`SELECT version()`) | 2026-01-18 | Evidence/pg-version.txt |
| EVD-PG-002 | Config | Systemd unit file + initdb flags | 2026-01-18 | Evidence/pg-systemd.txt |
| EVD-PG-003 | Config | K3S pod specification (resource limits, no co-location) | 2026-01-18 | Evidence/pg-k3s-pod.yaml |
| EVD-PG-004 | Script | File permissions audit script output | 2026-01-18 | Evidence/pg-permissions.txt |
| EVD-PG-005 | Config | SSL configuratie + certificaat details | 2026-01-18 | Evidence/pg-ssl-config.txt |
| EVD-PG-006 | Config | Volledige logging configuratie (postgresql.conf extract) | 2026-01-18 | Evidence/pg-logging-config.txt |
| EVD-PG-007 | Config | K3S RBAC configuratie voor database access | 2026-01-18 | Evidence/pg-k3s-rbac.yaml |
| EVD-PG-008 | Script | Privilege audit: rollen, grants, schema permissions | 2026-01-18 | Evidence/pg-privilege-audit.txt |
| EVD-PG-009 | Config | password_encryption setting + pg_hba.conf auth methods | 2026-01-18 | Evidence/pg-auth-config.txt |
| EVD-PG-010 | Query | Extensie-inventaris (`\dx` output) | 2026-01-18 | Evidence/pg-extensions.txt |
| EVD-PG-011 | Config | pg_hba.conf (geanonimiseerd) | 2026-01-18 | Evidence/pg-hba-sanitized.txt |
| EVD-PG-012 | Config | Connection parameters (timeout, limits) | 2026-01-18 | Evidence/pg-connection-config.txt |
| EVD-PG-013 | Config | Server settings extract (GUC parameters) | 2026-01-18 | Evidence/pg-server-settings.txt |
| EVD-PG-014 | Config | Replication configuratie + backup schedule | 2026-01-18 | Evidence/pg-replication.txt |
| EVD-PG-015 | Config | Resource en performance parameters | 2026-01-18 | Evidence/pg-resources.txt |

---

## Sign-Off

| Rol | Naam | Datum |
|-----|------|-------|
| Assessor | DBA Team Lead | 2026-01-18 |
| Component Owner | DBA Team Lead | 2026-01-18 |
| System Owner | System Owner XENA | 2026-01-22 |

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 0.1 | 2026-01-18 | DBA Team Lead | Initiële assessment uitgevoerd |
| 0.2 | 2026-01-20 | DBA Team Lead | Evidence aangevuld, toelichtingen uitgebreid |
| 1.0 | 2026-01-22 | System Owner XENA | Reviewed en signed-off |
