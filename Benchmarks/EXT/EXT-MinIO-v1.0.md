---
id: "EXT-MinIO-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - MinIO"
technology: "MinIO"
technology_version: "RELEASE.2024+"
benchmark_version: "1.0"
status: Active
last_review: 2026-01-30
next_review: 2027-01-30
owner: "Security Officer"
applies_to:
  - "[[Components/MinIO]]"
sources:
  - "MinIO Security Documentation"
  - "AWS S3 Security Best Practices"
  - "CIS Controls v8"
recommendations_count: 11
created: 2026-01-28
modified: 2026-01-30
tags:
  - benchmark
  - extended
  - minio
  - storage
  - s3
---

# Extended Benchmark: MinIO v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | MinIO |
| **Technologie Versie** | RELEASE.2024+ |
| **Benchmark Versie** | v1.0 |
| **Status** | Active |
| **Eigenaar** | Security Officer |
| **Laatste Review** | 2026-01-30 |
| **Volgende Review** | 2027-01-30 |
| **Aantal Recommendations** | 11 |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/MinIO]] |

---

## 1. Overzicht

### 1.1 Scope

Deze Extended Benchmark is van toepassing op:
- MinIO Server (standalone en distributed mode)
- MinIO Console (web UI)
- S3 API endpoints
- Bucket policies en IAM

### 1.2 Waarom een Extended Benchmark?

Er is geen officiële CIS Benchmark beschikbaar voor MinIO. Deze benchmark is ontwikkeld op basis van:

| Bron | Gebruik |
|------|---------|
| [MinIO Security Documentation](https://min.io/docs/minio/linux/operations/security.html) | Primaire configuratie referentie |
| [MinIO Hardening Checklist](https://min.io/docs/minio/linux/operations/checklists/security.html) | Best practices |
| [AWS S3 Security Best Practices](https://docs.aws.amazon.com/s3/security) | S3-compatible security patterns |
| CIS Controls v8 | Control framework mapping |

### 1.3 Profiel Definities

| Profiel | Beschrijving | Implementation Group |
|---------|--------------|---------------------|
| **Basis** | Minimale security configuratie | IG1 |
| **Uitgebreid** | Aanvullende bescherming | IG2 |
| **Compliance** | Wettelijke vereisten (WORM) | IG3 |

---

## 2. Recommendations

### 2.1 Encryptie

#### EXT-MINIO-2.1.1: Activeer Server-Side Encryption (SSE-S3)

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] |
| **Bron** | MinIO Security Guide |

**Beschrijving:**
Alle objecten moeten automatisch worden versleuteld bij opslag met minimaal AES-256.

**Rationale:**
Beschermt data tegen ongeautoriseerde toegang bij fysieke toegang tot storage media.

**Audit:**
```bash
# Controleer SSE auto-encryption instelling
mc admin config get myminio api | grep auto_encryption

# Verwacht: auto_encryption: on
```

**Remediation:**
```bash
# Activeer auto-encryption
mc admin config set myminio api auto_encryption=on

# Herstart MinIO om wijziging toe te passen
mc admin service restart myminio
```

**Referenties:**
- [MinIO Server-Side Encryption](https://min.io/docs/minio/linux/operations/server-side-encryption.html)

---

#### EXT-MINIO-2.1.2: Gebruik TLS voor alle verbindingen

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |
| **Bron** | MinIO Security Guide |

**Beschrijving:**
Alle verbindingen naar MinIO moeten via TLS 1.2 of hoger verlopen.

**Rationale:**
Beschermt data in transit tegen afluisteren en man-in-the-middle aanvallen.

**Audit:**
```bash
# Controleer TLS configuratie
curl -v https://minio.example.com:9000 2>&1 | grep -i "SSL connection"

# Verwacht: SSL connection using TLSv1.3 of TLSv1.2

# Controleer certificaat geldigheid
openssl s_client -connect minio.example.com:9000 -servername minio.example.com
```

**Remediation:**
```bash
# Configureer TLS certificaten directory
export MINIO_CERTS_DIR=/path/to/certs

# Plaats certificaten in de directory:
# - public.crt  (server certificaat)
# - private.key (private key)
# - CAs/        (CA certificaten voor client auth)

# Herstart MinIO
systemctl restart minio
```

**Referenties:**
- [MinIO TLS Configuration](https://min.io/docs/minio/linux/operations/network-encryption.html)

---

#### EXT-MINIO-2.1.3: Configureer Key Management Service (KMS)

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Uitgebreid |
| **CIS Control** | [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] |
| **Bron** | MinIO KES Documentation |

**Beschrijving:**
Encryptiesleutels moeten worden beheerd door een externe KMS (bijv. OpenBAO/Vault).

**Rationale:**
Scheiding van data en sleutels, centrale key management, automatische key rotation.

**Audit:**
```bash
# Controleer KMS configuratie
mc admin config get myminio kms_kes

# Verwacht: KMS endpoint geconfigureerd
```

**Remediation:**
```bash
# Configureer KES (Key Encryption Service) met Vault/OpenBAO backend
mc admin config set myminio kms_kes \
    endpoint=https://kes.example.com:7373 \
    key_name=minio-key-1 \
    enclave_name=default
```

**Referenties:**
- [MinIO KMS Guide](https://min.io/docs/minio/linux/operations/server-side-encryption/server-side-encryption-kes.html)

---

### 2.2 Toegangscontrole

#### EXT-MINIO-2.2.1: Beperk gebruik van Root Account

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-5.4 - Beperk Beheerdersrechten\|CIS-5.4]] |
| **Bron** | MinIO Security Best Practices |

**Beschrijving:**
De root gebruiker (MINIO_ROOT_USER) mag alleen worden gebruikt voor initiële setup en noodtoegang.

**Rationale:**
Beperkt blast radius van credential compromise en verbetert auditability.

**Audit:**
```bash
# Controleer root user gebruik in audit logs
grep "MINIO_ROOT_USER" /var/log/minio/audit.log

# Lijst alle gebruikers - root moet niet voor dagelijks gebruik zijn
mc admin user list myminio
```

**Remediation:**
```bash
# 1. Maak dedicated admin users aan
mc admin user add myminio admin-user SecurePassword123!
mc admin policy attach myminio consoleAdmin --user admin-user

# 2. Documenteer root credentials in secure vault (bijv. OpenBAO)

# 3. Roteer root credentials na elke noodtoegang
```

---

#### EXT-MINIO-2.2.2: Implementeer Bucket Policies

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-6.8 - Definieer RBAC\|CIS-6.8]] |
| **Bron** | MinIO IAM Guide |

**Beschrijving:**
Elk bucket moet een expliciete access policy hebben; geen publieke toegang tenzij expliciet vereist.

**Rationale:**
Principle of least privilege, voorkomt data lekkage door misconfiguratie.

**Audit:**
```bash
# Controleer bucket policies voor alle buckets
for bucket in $(mc ls myminio | awk '{print $NF}'); do
    echo "=== $bucket ==="
    mc anonymous get myminio/$bucket
done

# Verwacht: geen "public" of "download" policies
```

**Remediation:**
```bash
# Verwijder publieke toegang
mc anonymous remove myminio/mybucket

# Configureer specifieke toegang via IAM policies
mc admin policy create myminio mybucket-readonly mybucket-readonly-policy.json
mc admin policy attach myminio mybucket-readonly --user app-user
```

---

#### EXT-MINIO-2.2.3: Activeer MFA voor Console toegang

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-6.5 - Eis MFA voor Beheerderstoegang\|CIS-6.5]] |
| **Bron** | MinIO OIDC Integration |

**Beschrijving:**
Toegang tot de MinIO Console moet worden beschermd met MFA via OIDC integratie.

**Rationale:**
Extra beschermingslaag tegen credential compromise.

**Audit:**
1. Login op MinIO Console
2. Controleer of OIDC login wordt vereist
3. Verifieer MFA policy in KeyCloak

**Remediation:**
```bash
# Configureer OIDC integratie met KeyCloak
mc admin config set myminio identity_openid \
    config_url="https://keycloak.example.com/realms/master/.well-known/openid-configuration" \
    client_id="minio" \
    client_secret="XXXXX" \
    scopes="openid,profile,email"

# Configureer MFA requirement in KeyCloak realm
```

**Referenties:**
- [MinIO OIDC Configuration](https://min.io/docs/minio/linux/operations/external-iam/configure-openid-external-identity-management.html)

---

### 2.3 Logging en Monitoring

#### EXT-MINIO-2.3.1: Activeer Audit Logging

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] |
| **Bron** | MinIO Audit Guide |

**Beschrijving:**
Alle API calls moeten worden gelogd met: timestamp, user, action, bucket, object, source IP.

**Rationale:**
Forensische analyse, compliance verificatie, anomaly detection.

**Audit:**
```bash
# Controleer audit log configuratie
mc admin config get myminio audit_webhook

# Controleer of audit logs worden gegenereerd
ls -la /var/log/minio/audit/
```

**Remediation:**
```bash
# Configureer audit webhook naar Elasticsearch
mc admin config set myminio audit_webhook:elastic \
    endpoint=https://elasticsearch.example.com:9200/minio-audit/_doc \
    auth_token=Bearer:XXXXX

# Of configureer Kafka target
mc admin config set myminio audit_kafka \
    enable=on \
    brokers=kafka.example.com:9092 \
    topic=minio-audit
```

---

#### EXT-MINIO-2.3.2: Configureer Log Retentie

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Uitgebreid |
| **CIS Control** | [[Controls/CIS/CIS-8.10 - Bewaar Auditlogs\|CIS-8.10]] |
| **Bron** | Compliance Requirements |

**Beschrijving:**
Audit logs moeten minimaal 1 jaar worden bewaard conform compliance vereisten.

**Rationale:**
Wettelijke bewaarplicht, incident investigation timeline.

**Audit:**
```bash
# Controleer oudste beschikbare audit logs
ls -la /var/log/minio/audit/ | head -10

# Of controleer Elasticsearch retention policy
curl -X GET "elasticsearch.example.com:9200/_ilm/policy/minio-audit"
```

**Remediation:**
```bash
# Configureer Elasticsearch ILM policy voor 1 jaar retentie
curl -X PUT "elasticsearch.example.com:9200/_ilm/policy/minio-audit" \
-H 'Content-Type: application/json' -d'
{
  "policy": {
    "phases": {
      "delete": {
        "min_age": "365d",
        "actions": { "delete": {} }
      }
    }
  }
}'
```

---

### 2.4 Gegevensbescherming

#### EXT-MINIO-2.4.1: Activeer Object Versioning

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Uitgebreid |
| **CIS Control** | [[Controls/CIS/CIS-11.3 - Bescherm Herstelgegevens\|CIS-11.3]] |
| **Bron** | MinIO Versioning Guide |

**Beschrijving:**
Versioning moet zijn ingeschakeld voor buckets met belangrijke data.

**Rationale:**
Bescherming tegen accidentele deletes, ransomware recovery, audit trail van wijzigingen.

**Audit:**
```bash
# Controleer versioning status per bucket
mc version info myminio/mybucket
```

**Remediation:**
```bash
# Activeer versioning
mc version enable myminio/mybucket

# Verifieer
mc version info myminio/mybucket
# Verwacht: versioning is enabled
```

---

#### EXT-MINIO-2.4.2: Configureer Object Lock voor Compliance

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Compliance |
| **CIS Control** | [[Controls/CIS/CIS-11.3 - Bescherm Herstelgegevens\|CIS-11.3]] |
| **Bron** | MinIO Object Lock Documentation |

**Beschrijving:**
Object Lock (WORM - Write Once Read Many) moet worden ingeschakeld voor buckets met wettelijke bewaarplicht.

**Rationale:**
Onveranderbare opslag voor audit trails, archiefwet compliance, bescherming tegen manipulatie.

**Audit:**
```bash
# Controleer object lock configuratie
mc retention info myminio/compliance-bucket
```

**Remediation:**
```bash
# Let op: bucket moet worden aangemaakt MET object-lock
mc mb myminio/compliance-bucket --with-lock

# Configureer retention policy (bijv. 7 jaar voor archiefwet)
mc retention set --default COMPLIANCE 7y myminio/compliance-bucket
```

**Referenties:**
- [MinIO Object Lock](https://min.io/docs/minio/linux/administration/object-management/object-retention.html)

---

### 2.5 Configuratie Hardening

#### EXT-MINIO-2.5.1: Deactiveer onnodige features

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-4.8 - Verwijder Onnodige Services\|CIS-4.8]] |
| **Bron** | MinIO Hardening Checklist |

**Beschrijving:**
Niet-gebruikte features en endpoints moeten worden uitgeschakeld om attack surface te reduceren.

**Rationale:**
Elke actieve feature is een potentieel aanvalsvector.

**Audit:**
```bash
# Controleer ingeschakelde features
mc admin config get myminio | grep enable

# Controleer of browser (Console) toegang nodig is
mc admin config get myminio api browser
```

**Remediation:**
```bash
# Deactiveer browser/console indien niet nodig
mc admin config set myminio api browser=off

# Beperk anonymous requests
mc admin config set myminio api requests_max=0
```

---

## 3. CIS Controls Mapping

### Mapping Matrix

| CIS Control | Recommendations | Profiel |
|-------------|-----------------|---------|
| [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] | 2.1.2 | Basis |
| [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] | 2.1.1, 2.1.3 | Basis/Uitgebreid |
| [[Controls/CIS/CIS-4.8 - Verwijder Onnodige Services\|CIS-4.8]] | 2.5.1 | Basis |
| [[Controls/CIS/CIS-5.4 - Beperk Beheerdersrechten\|CIS-5.4]] | 2.2.1 | Basis |
| [[Controls/CIS/CIS-6.5 - Eis MFA voor Beheerderstoegang\|CIS-6.5]] | 2.2.3 | Basis |
| [[Controls/CIS/CIS-6.8 - Definieer RBAC\|CIS-6.8]] | 2.2.2 | Basis |
| [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] | 2.3.1 | Basis |
| [[Controls/CIS/CIS-8.10 - Bewaar Auditlogs\|CIS-8.10]] | 2.3.2 | Uitgebreid |
| [[Controls/CIS/CIS-11.3 - Bescherm Herstelgegevens\|CIS-11.3]] | 2.4.1, 2.4.2 | Uitgebreid/Compliance |

### Coverage per Profiel

| Profiel | Aantal Recs | CIS Controls |
|---------|-------------|--------------|
| Basis | 7 | CIS-3.10, 3.11, 4.8, 5.4, 6.5, 6.8, 8.2 |
| Uitgebreid | 3 | CIS-3.11, 8.10, 11.3 |
| Compliance | 1 | CIS-11.3 |

---

## 4. Implementatie Checklist

| # | Recommendation | Profiel | Status |
|---|----------------|---------|--------|
| 2.1.1 | SSE-S3 Encryption | Basis | ☐ |
| 2.1.2 | TLS Connections | Basis | ☐ |
| 2.1.3 | KMS Integration | Uitgebreid | ☐ |
| 2.2.1 | Beperk Root Account | Basis | ☐ |
| 2.2.2 | Bucket Policies | Basis | ☐ |
| 2.2.3 | MFA voor Console | Basis | ☐ |
| 2.3.1 | Audit Logging | Basis | ☐ |
| 2.3.2 | Log Retentie | Uitgebreid | ☐ |
| 2.4.1 | Object Versioning | Uitgebreid | ☐ |
| 2.4.2 | Object Lock (WORM) | Compliance | ☐ |
| 2.5.1 | Deactiveer Onnodige Features | Basis | ☐ |

---

## 5. Implementatie Tracking

```dataview
TABLE WITHOUT ID
  link(file.link, control_id) as "Control",
  control_name as "Naam",
  impl_status as "Status"
FROM "Implementations"
WHERE contains(string(benchmark), "MinIO")
SORT control_id ASC
```

---

## 6. Bekende Kwetsbaarheden

### CVE Tracking

| CVE | Beschrijving | Ernst | Mitigatie | Recommendation |
|-----|--------------|-------|-----------|----------------|
| CVE-2023-28432 | Information disclosure via cluster config | High | Update naar RELEASE.2023-03-20 | 2.1.2 |
| CVE-2023-28434 | Privilege escalation | Critical | Update naar RELEASE.2023-03-20 | 2.2.1 |

> **Monitoring:** Volg [MinIO Security Advisories](https://github.com/minio/minio/security/advisories)

---

## 7. Review Historie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-01-28 | Security Team | Initiële versie |
| v1.0 | 2026-01-30 | Security Team | Migratie naar Benchmarks folder, enhanced format |

---

## 8. Bronnen

### Primaire Bronnen

- [MinIO Security Documentation](https://min.io/docs/minio/linux/operations/security.html)
- [MinIO Hardening Checklist](https://min.io/docs/minio/linux/operations/checklists/security.html)
- [MinIO KES (Key Encryption Service)](https://min.io/docs/kes/)

### Aanvullende Bronnen

- [AWS S3 Security Best Practices](https://docs.aws.amazon.com/s3/security)
- [CIS Controls v8](https://www.cisecurity.org/controls)
- [MinIO GitHub Security Advisories](https://github.com/minio/minio/security/advisories)

---

## Gerelateerde Documenten

- [[Components/MinIO|MinIO Component]]
- [[Benchmarks/CIS/_index|CIS Benchmarks]] — Vergelijkbare officiële benchmarks
- [[Documentatie/CIS Benchmark Handleiding|Benchmark Handleiding]]
- [[Components/OpenBAO|OpenBAO]] — KMS integratie
