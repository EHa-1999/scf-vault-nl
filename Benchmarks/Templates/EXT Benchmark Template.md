---
id: "EXT-{{Technology}}-v{{Version}}"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - {{Technology}}"
technology: "{{Technology}}"
technology_version: "{{TechVersion}}"
benchmark_version: "{{Version}}"
status: Active
last_review: {{date}}
next_review: {{next_review_date}}
owner: "Security Officer"
applies_to:
  - "[[Components/{{Component}}]]"
sources:
  - "{{Vendor}} Security Documentation"
  - "OWASP Guidelines"
  - "NIST 800-53"
recommendations_count: 0
created: {{date}}
modified: {{date}}
tags:
  - benchmark
  - extended
  - {{technology_tag}}
---

# Extended Benchmark: {{Technology}} v{{Version}}

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | {{Technology}} |
| **Technologie Versie** | {{TechVersion}}+ |
| **Benchmark Versie** | v{{Version}} |
| **Status** | Active |
| **Eigenaar** | Security Officer |
| **Laatste Review** | {{date}} |
| **Volgende Review** | {{next_review_date}} |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 Extended Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/{{Component}}]] |

---

## 1. Overzicht

### 1.1 Scope

Deze Extended Benchmark is van toepassing op:
- {{Technology}} versie {{TechVersion}} en hoger
- Standalone en clustered deployments
- On-premise en container deployments

### 1.2 Waarom een Extended Benchmark?

Er is geen officiële CIS Benchmark beschikbaar voor {{Technology}}. Deze benchmark is ontwikkeld op basis van:

| Bron | Gebruik |
|------|---------|
| [{{Vendor}} Security Documentation]({{vendor_url}}) | Primaire configuratie referentie |
| OWASP Guidelines | Web security best practices |
| NIST 800-53 | Control framework mapping |
| Bekende CVEs | Specifieke mitigaties |

### 1.3 Profiel Definities

| Profiel | Beschrijving | Onze Keuze |
|---------|--------------|------------|
| **Basis** | Minimale security configuratie | ✅ Verplicht |
| **Uitgebreid** | Aanvullende hardening | ⚠️ Waar mogelijk |

---

## 2. Recommendations

### 2.1 Authenticatie

#### EXT-{{Tech}}-2.1.1: {{Recommendation titel}}

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-6.5 - Eis MFA voor Beheerderstoegang\|CIS-6.5]] |
| **Bron** | {{Vendor}} Security Guide |

**Beschrijving:**
{{Beschrijving van wat moet worden geconfigureerd}}

**Rationale:**
{{Waarom is dit belangrijk voor security}}

**Audit:**
```bash
# Controleer de huidige configuratie
{{audit_command_or_steps}}
```

**Verwacht resultaat:**
```
{{expected_output}}
```

**Remediation:**
```bash
# Implementeer de configuratie
{{remediation_steps}}
```

**Referenties:**
- [{{Vendor}} Documentation]({{doc_url}})

---

#### EXT-{{Tech}}-2.1.2: {{Volgende recommendation}}

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-x.y\|CIS-x.y]] |
| **Bron** | {{source}} |

*(Herhaal format)*

---

### 2.2 Autorisatie

#### EXT-{{Tech}}-2.2.1: {{Recommendation titel}}

---

### 2.3 Cryptografie

#### EXT-{{Tech}}-2.3.1: Gebruik TLS voor alle verbindingen

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] |
| **Bron** | {{Vendor}} Security Guide |

**Beschrijving:**
Alle communicatie van en naar {{Technology}} moet via TLS 1.2 of hoger verlopen.

**Audit:**
```bash
{{audit_tls_command}}
```

**Remediation:**
```bash
{{enable_tls_steps}}
```

---

#### EXT-{{Tech}}-2.3.2: Versleutel data at rest

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Uitgebreid |
| **CIS Control** | [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] |

---

### 2.4 Logging en Monitoring

#### EXT-{{Tech}}-2.4.1: Activeer audit logging

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] |

---

### 2.5 Netwerk

#### EXT-{{Tech}}-2.5.1: Beperk netwerk toegang

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-4.4 - Implementeer Firewall op Servers\|CIS-4.4]], [[Controls/CIS/CIS-12.2 - Stel Veilige Netwerkarchitectuur Op\|CIS-12.2]] |

---

### 2.6 Configuratie Hardening

#### EXT-{{Tech}}-2.6.1: Verwijder standaard credentials

| Eigenschap | Waarde |
|------------|--------|
| **Profiel** | Basis |
| **CIS Control** | [[Controls/CIS/CIS-4.7 - Beheer Standaardaccounts\|CIS-4.7]] |

---

## 3. CIS Controls Mapping

### Mapping Matrix

| CIS Control | Recommendations | Profiel |
|-------------|-----------------|---------|
| [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3.10]] | 2.3.1 | Basis |
| [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3.11]] | 2.3.2 | Uitgebreid |
| [[Controls/CIS/CIS-4.4 - Implementeer Firewall op Servers\|CIS-4.4]] | 2.5.1 | Basis |
| [[Controls/CIS/CIS-4.7 - Beheer Standaardaccounts\|CIS-4.7]] | 2.6.1 | Basis |
| [[Controls/CIS/CIS-6.5 - Eis MFA voor Beheerderstoegang\|CIS-6.5]] | 2.1.1 | Basis |
| [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8.2]] | 2.4.1 | Basis |

### Coverage

```dataview
TABLE WITHOUT ID
  length(filter(rows, (r) => r.profiel = "Basis")) as "Basis Recs",
  length(filter(rows, (r) => r.profiel = "Uitgebreid")) as "Uitgebreid Recs"
FROM "Benchmarks/EXT"
WHERE file.name = this.file.name
```

---

## 4. Implementatie Tracking

### Gerelateerde Implementations

```dataview
TABLE WITHOUT ID
  link(file.link, control_id) as "Control",
  control_name as "Naam",
  impl_status as "Status"
FROM "Implementations"
WHERE contains(benchmark, this.file.name)
SORT control_id ASC
```

---

## 5. Bekende Kwetsbaarheden

### CVE Tracking

| CVE | Beschrijving | Mitigatie | Recommendation |
|-----|--------------|-----------|----------------|
| CVE-YYYY-XXXXX | {{beschrijving}} | {{mitigatie}} | EXT-{{Tech}}-x.x.x |

> **Let op:** Houd [CVE Database](https://cve.mitre.org/) in de gaten voor nieuwe kwetsbaarheden.

---

## 6. Review Historie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v{{Version}} | {{date}} | {{reviewer}} | Initiële versie |

---

## 7. Bronnen

### Primaire Bronnen

- [{{Vendor}} Security Documentation]({{vendor_security_url}})
- [{{Vendor}} Hardening Guide]({{vendor_hardening_url}})

### Aanvullende Bronnen

- [OWASP {{relevant_project}}]({{owasp_url}})
- [NIST 800-53](https://nvd.nist.gov/800-53)
- [CIS Controls v8](https://www.cisecurity.org/controls)

---

## Gerelateerde Documenten

- [[Components/{{Component}}|{{Component}} Component]]
- [[Benchmarks/CIS/_index|CIS Benchmarks]] — Vergelijkbare officiële benchmarks
- [[Documentatie/CIS Benchmark Handleiding|Benchmark Handleiding]]
