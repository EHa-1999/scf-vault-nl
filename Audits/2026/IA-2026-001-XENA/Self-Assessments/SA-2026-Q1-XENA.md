---
id: "SA-2026-Q1-XENA"
type: self-assessment
name: "Self-Assessment XENA Q1 2026"
system: "[[Systems/XENA]]"
domain: ""
assessment_type: system
cis_categories: [1, 2, 3, 4, 5, 6, 8, 11, 16]
period: "2026-Q1"
status: Completed
assessor: "System Owner XENA"
assessment_date: 2026-01-15
review_date: 2026-01-20
sign_off_by: "System Owner"
sign_off_date: 2026-01-20
overall_score: 75
created: 2026-01-15
modified: 2026-01-20
tags:
  - self-assessment
  - system-assessment
  - 2026
  - xena
---

# Self-Assessment: XENA - Q1 2026

## Assessment Informatie

| Veld | Waarde |
|------|--------|
| **ID** | SA-2026-Q1-XENA |
| **Type** | Systeem Assessment |
| **Systeem** | [[Systems/XENA]] |
| **Periode** | Q1 2026 |
| **Assessor** | System Owner XENA |
| **Status** | Completed |
| **Score** | 75% |

## Scope Beschrijving

Dit assessment beoordeelt alle security control implementations voor het XENA document management systeem. Het systeem bestaat uit de volgende componenten: MinIO (object storage), PostgreSQL (metadata), Apache NiFi (orchestratie), KeyCloak (IAM) en Saviynt (identity governance).

### BIV Classificatie

| Aspect | Classificatie | Toelichting |
|--------|---------------|-------------|
| Beschikbaarheid | Midden | Uitval heeft operationele impact |
| Integriteit | Hoog | Documenten moeten betrouwbaar zijn |
| Vertrouwelijkheid | Hoog | Bevat gevoelige gemeentelijke documenten |

## Beoordeelde Implementations

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  status as "Status",
  choice(status = "Verified", "✅", 
    choice(status = "Implemented", "🟢",
      choice(status = "Partial", "🟡",
        choice(status = "In Progress", "🔵", "⚪")))) as "●"
FROM "Implementations"
WHERE contains(file.name, "XENA")
SORT id ASC
```

## Beoordeling per Categorie

### CIS 3: Gegevensbescherming

| Control | Implementation | Status | Evidence | Oordeel |
|---------|----------------|--------|----------|---------|
| CIS-3.6 | IMPL-XENA-MinIO-3.6 | Implemented | Config export | ✅ Compliant |
| CIS-3.11 | IMPL-XENA-PostgreSQL-3.11 | Implemented | TDE config | ✅ Compliant |

**Toelichting:** Data-at-rest encryptie is volledig geïmplementeerd voor zowel MinIO als PostgreSQL.

---

### CIS 6: Access Management

| Control | Implementation | Status | Evidence | Oordeel |
|---------|----------------|--------|----------|---------|
| CIS-6.5 | IMPL-XENA-KeyCloak-6.5 | Partial | MFA config | ⚠️ Partial |

**Toelichting:** MFA is geïmplementeerd voor beheerders, maar nog niet voor alle privileged users. Zie bevinding FIND-2026-001.

---

### CIS 8: Audit Logging

| Control | Implementation | Status | Evidence | Oordeel |
|---------|----------------|--------|----------|---------|
| CIS-8.2 | IMPL-XENA-Apache-NiFi-8.2 | Implemented | Log samples | ✅ Compliant |

**Toelichting:** Audit logging is volledig operationeel met adequate retentie.

---

## Samenvatting

### Score Overzicht

| Categorie | Totaal | Compliant | Partial | Non-Compliant | Score |
|-----------|--------|-----------|---------|---------------|-------|
| CIS 3 | 2 | 2 | 0 | 0 | 100% |
| CIS 6 | 1 | 0 | 1 | 0 | 50% |
| CIS 8 | 1 | 1 | 0 | 0 | 100% |
| **Totaal** | 4 | 3 | 1 | 0 | **75%** |

### Geïdentificeerde Gaps

1. **MFA niet volledig uitgerold** - MFA is alleen actief voor beheerders, niet voor alle privileged users
2. *(geen verdere kritieke gaps geïdentificeerd)*

### Aanbevelingen

1. Rol MFA uit naar alle gebruikers met elevated privileges (prioriteit: Hoog)
2. Documenteer de MFA enrollment procedure voor nieuwe medewerkers

## Evidence Referenties

| Evidence ID | Type | Beschrijving | Locatie |
|-------------|------|--------------|---------|
| EVD-001 | Config | MinIO encryption settings | Evidence/minio-encryption-config.json |
| EVD-002 | Config | PostgreSQL TDE config | Evidence/pg-tde-settings.txt |
| EVD-003 | Test | MFA test results | Evidence/keycloak-mfa-test.pdf |

## Sign-Off

| Rol | Naam | Datum |
|-----|------|-------|
| Assessor | System Owner XENA | 2026-01-15 |
| System Owner | System Owner | 2026-01-20 |

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 0.1 | 2026-01-15 | System Owner | Initiële versie |
| 1.0 | 2026-01-20 | System Owner | Afgerond en signed-off |
