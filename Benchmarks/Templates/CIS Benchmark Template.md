---
id: "CIS-{{Technology}}-{{TechVersion}}-v{{BenchmarkVersion}}"
type: benchmark
benchmark_type: "CIS"
name: "CIS {{Technology}} {{TechVersion}} Benchmark"
technology: "{{Technology}}"
technology_version: "{{TechVersion}}"
benchmark_version: "{{BenchmarkVersion}}"
cis_release_date: {{ReleaseDate}}
cis_download_url: "https://workbench.cisecurity.org/"
applies_to:
  - "[[Components/{{Component}}]]"
status: Active
recommendations_count: 0
created: {{date}}
modified: {{date}}
tags:
  - benchmark
  - cis
  - {{technology_tag}}
---

# CIS {{Technology}} {{TechVersion}} Benchmark v{{BenchmarkVersion}}

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | {{Technology}} {{TechVersion}} |
| **Benchmark Versie** | v{{BenchmarkVersion}} |
| **CIS Release Datum** | {{ReleaseDate}} |
| **Status** | Active |
| **Download** | [CIS WorkBench](https://workbench.cisecurity.org/) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/CIS/_index\|📘 CIS Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/{{Component}}]] |

---

## Scope

### Van Toepassing Op

- {{Technology}} versie {{TechVersion}}.x
- Zowel standalone als clustered deployments
- On-premise en cloud deployments

### Niet Van Toepassing Op

- Versies ouder dan {{TechVersion}}
- Managed/SaaS varianten (zie cloud-specifieke benchmarks)

---

## Profiel Definities

CIS Benchmarks definiëren twee profielen:

| Profiel | Beschrijving | Onze Keuze |
|---------|--------------|------------|
| **Level 1** | Basis security, minimale impact op functionaliteit | ✅ Verplicht |
| **Level 2** | Uitgebreide security, mogelijk impact op functionaliteit | ⚠️ Waar mogelijk |

---

## Recommendations Overzicht

| Sectie | Onderwerp | # Recs | Level 1 | Level 2 |
|--------|-----------|--------|---------|---------|
| 1 | Installation and Patches | | | |
| 2 | Directory and File Permissions | | | |
| 3 | Logging and Auditing | | | |
| 4 | Encryption | | | |
| 5 | Authentication | | | |
| 6 | Authorization | | | |
| 7 | Network | | | |
| **Totaal** | | | | |

---

## 1. Installation and Patches

### 1.1 Ensure latest security patches are installed

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-7.3 - Voer Geautomatiseerd OS Patchbeheer Uit\|CIS-7.3]], [[Controls/CIS/CIS-7.4 - Voer Geautomatiseerd Applicatie Patchbeheer Uit\|CIS-7.4]] |

**Beschrijving:**
Zorg dat de laatste security patches zijn geïnstalleerd voor {{Technology}}.

**Rationale:**
Ongepatchte software bevat bekende kwetsbaarheden die kunnen worden misbruikt.

**Audit:**
```bash
# Controleer de huidige versie
{{audit_command}}

# Vergelijk met laatste release
# Zie: {{vendor_release_url}}
```

**Remediation:**
```bash
# Update naar laatste versie
{{remediation_command}}
```

**Referenties:**
- {{vendor_patch_url}}

---

### 1.2 {{Next recommendation title}}

| Eigenschap | Waarde |
|------------|--------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-x.y\|CIS-x.y]] |

**Beschrijving:**
{{description}}

**Rationale:**
{{rationale}}

**Audit:**
```bash
{{audit_command}}
```

**Remediation:**
```bash
{{remediation_command}}
```

---

## 2. Directory and File Permissions

### 2.1 {{Recommendation title}}

*(Herhaal format voor elke recommendation)*

---

## 3. Logging and Auditing

### 3.1 {{Recommendation title}}

---

## 4. Encryption

### 4.1 {{Recommendation title}}

---

## 5. Authentication

### 5.1 {{Recommendation title}}

---

## 6. Authorization

### 6.1 {{Recommendation title}}

---

## 7. Network

### 7.1 {{Recommendation title}}

---

## CIS Controls Mapping

### Mapping Overzicht

| CIS Control | Recommendations |
|-------------|-----------------|
| [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] | 4.1, 4.2 |
| [[Controls/CIS/CIS-5.2 - Gebruik Unieke Wachtwoorden\|CIS-5.2]] | 5.1, 5.2 |
| [[Controls/CIS/CIS-6.5 - Eis MFA voor Beheerderstoegang\|CIS-6.5]] | 5.3 |
| [[Controls/CIS/CIS-7.3 - Voer Geautomatiseerd OS Patchbeheer Uit\|CIS-7.3]] | 1.1 |
| [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] | 3.1, 3.2, 3.3 |

### Implementatie Tracking

```dataview
TABLE WITHOUT ID
  link(file.link, control_id) as "Control",
  impl_status as "Status",
  impl_percentage + "%" as "Voortgang"
FROM "Implementations"
WHERE contains(benchmark, this.file.name)
SORT control_id ASC
```

---

## Wijzigingshistorie CIS

| CIS Versie | Datum | Belangrijkste Wijzigingen |
|------------|-------|---------------------------|
| v{{BenchmarkVersion}} | {{ReleaseDate}} | Initiële versie voor {{Technology}} {{TechVersion}} |

---

## Gerelateerde Documenten

- [[Components/{{Component}}|{{Component}} Component]]
- [[Documentatie/CIS Benchmark Handleiding|CIS Benchmark Handleiding]]
- Originele PDF: [CIS WorkBench](https://workbench.cisecurity.org/)

---

## Conversie Notities

> **Geconverteerd door:** {{converter}}  
> **Conversie datum:** {{date}}  
> **Bron PDF versie:** v{{BenchmarkVersion}}

Secties die niet zijn geconverteerd:
- Appendix A: Glossary (zie originele PDF)
- Appendix B: Change Log (samengevat in Wijzigingshistorie)
