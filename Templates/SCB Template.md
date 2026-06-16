---
id: "SCB-{{system}}"
type: scb
name: "System Component Breakdown - {{system}}"
system: "[[Systems/{{system}}]]"
status: Draft
owner: ""
architect: ""
biv_classification: ""
created: {{date}}
modified: {{date}}
tags:
  - scb
  - analysis
---

# System Component Breakdown: {{system}}

## 1. Systeem Overzicht

### 1.1 Basis Informatie

| Veld | Waarde |
|------|--------|
| **Systeem** | {{system}} |
| **System Owner** | |
| **Architect** | |
| **Status** | Draft |
| **Datum** | {{date}} |

### 1.2 Beschrijving

> Beschrijf het doel en de primaire functie van het systeem.

### 1.3 BIV Classificatie

| Aspect | Niveau | Toelichting |
|--------|--------|-------------|
| **Beschikbaarheid** | ☐ Laag ☐ Midden ☐ Hoog | |
| **Integriteit** | ☐ Laag ☐ Midden ☐ Hoog | |
| **Vertrouwelijkheid** | ☐ Laag ☐ Midden ☐ Hoog | |
| **Totaal (BBN)** | ☐ BBN1 ☐ BBN2 ☐ BBN3 | |

### 1.4 Data Classificatie

| Data Type | Classificatie | Bevat PII | Volume |
|-----------|---------------|-----------|--------|
| | ☐ Openbaar ☐ Intern ☐ Vertrouwelijk | ☐ Ja ☐ Nee | |
| | ☐ Openbaar ☐ Intern ☐ Vertrouwelijk | ☐ Ja ☐ Nee | |

---

## 2. Architectuur

### 2.1 Architectuur Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                        {{system}}                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐   │
│   │             │    │             │    │             │   │
│   │ Component 1 │───▶│ Component 2 │───▶│ Component 3 │   │
│   │             │    │             │    │             │   │
│   └─────────────┘    └─────────────┘    └─────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

> Vervang met actueel architectuur diagram

### 2.2 Data Flow

| Van | Naar | Data | Protocol | Encrypted |
|-----|------|------|----------|-----------|
| | | | | ☐ Ja ☐ Nee |
| | | | | ☐ Ja ☐ Nee |

---

## 3. Component Inventaris

### 3.1 Component Overzicht

| # | Component | Type | Technologie | Versie | Hosting |
|---|-----------|------|-------------|--------|---------|
| 1 | | | | | ☐ On-prem ☐ Cloud ☐ SaaS |
| 2 | | | | | ☐ On-prem ☐ Cloud ☐ SaaS |
| 3 | | | | | ☐ On-prem ☐ Cloud ☐ SaaS |
| 4 | | | | | ☐ On-prem ☐ Cloud ☐ SaaS |
| 5 | | | | | ☐ On-prem ☐ Cloud ☐ SaaS |

### 3.2 Component Details

#### Component 1: {naam}

| Eigenschap | Waarde |
|------------|--------|
| **Naam** | |
| **Type** | ☐ Database ☐ Storage ☐ IAM ☐ API ☐ UI ☐ Middleware ☐ Anders |
| **Technologie** | |
| **Vendor** | |
| **Versie** | |
| **Hostname/URL** | |
| **Poort(en)** | |
| **Authenticatie** | |
| **Eigenaar** | |

**Functie binnen systeem:**
> 

**Security relevantie:**
- [ ] Verwerkt persoonsgegevens
- [ ] Extern bereikbaar
- [ ] Privileged access vereist
- [ ] Slaat gevoelige data op

---

#### Component 2: {naam}

| Eigenschap | Waarde |
|------------|--------|
| **Naam** | |
| **Type** | ☐ Database ☐ Storage ☐ IAM ☐ API ☐ UI ☐ Middleware ☐ Anders |
| **Technologie** | |
| **Vendor** | |
| **Versie** | |
| **Hostname/URL** | |
| **Poort(en)** | |
| **Authenticatie** | |
| **Eigenaar** | |

**Functie binnen systeem:**
> 

**Security relevantie:**
- [ ] Verwerkt persoonsgegevens
- [ ] Extern bereikbaar
- [ ] Privileged access vereist
- [ ] Slaat gevoelige data op

---

*(Herhaal voor elk component)*

---

## 4. CIS Benchmark Analyse

### 4.1 Beschikbare Benchmarks

| Component | CIS Benchmark Beschikbaar | Benchmark Naam | Versie |
|-----------|---------------------------|----------------|--------|
| | ☐ Ja ☐ Nee | | |
| | ☐ Ja ☐ Nee | | |
| | ☐ Ja ☐ Nee | | |

### 4.2 Extended Benchmarks Nodig

Voor componenten zonder CIS Benchmark:

| Component | Alternatieve Bron | Actie |
|-----------|-------------------|-------|
| | ☐ Vendor Guide ☐ OWASP ☐ Custom | |
| | ☐ Vendor Guide ☐ OWASP ☐ Custom | |

---

## 5. Control Mapping Matrix

### 5.1 Component-Control Matrix

Vul in welke CIS Control categorieën van toepassing zijn per component:

| CIS Cat | Beschrijving | Comp 1 | Comp 2 | Comp 3 | Comp 4 | Comp 5 |
|---------|--------------|--------|--------|--------|--------|--------|
| **1** | Asset Inventory | ☐ | ☐ | ☐ | ☐ | ☐ |
| **2** | Software Inventory | ☐ | ☐ | ☐ | ☐ | ☐ |
| **3** | Gegevensbescherming | ☐ | ☐ | ☐ | ☐ | ☐ |
| **4** | Secure Configuration | ☐ | ☐ | ☐ | ☐ | ☐ |
| **5** | Accountbeheer | ☐ | ☐ | ☐ | ☐ | ☐ |
| **6** | Access Control | ☐ | ☐ | ☐ | ☐ | ☐ |
| **7** | Vulnerability Mgmt | ☐ | ☐ | ☐ | ☐ | ☐ |
| **8** | Audit Logging | ☐ | ☐ | ☐ | ☐ | ☐ |
| **9** | Email/Browser | ☐ | ☐ | ☐ | ☐ | ☐ |
| **10** | Malware Defense | ☐ | ☐ | ☐ | ☐ | ☐ |
| **11** | Gegevensherstel | ☐ | ☐ | ☐ | ☐ | ☐ |
| **12** | Network Infra | ☐ | ☐ | ☐ | ☐ | ☐ |
| **13** | Network Monitoring | ☐ | ☐ | ☐ | ☐ | ☐ |
| **16** | Application Security | ☐ | ☐ | ☐ | ☐ | ☐ |

**Legenda:** ☑ = Van toepassing

### 5.2 Prioriteit Controls (IG1 - Must Have)

Op basis van BIV classificatie en systeem functie:

| Control | Component | Prioriteit | Reden |
|---------|-----------|------------|-------|
| CIS-3.11 | | ☐ IG1 ☐ IG2 ☐ IG3 | |
| CIS-6.5 | | ☐ IG1 ☐ IG2 ☐ IG3 | |
| CIS-8.2 | | ☐ IG1 ☐ IG2 ☐ IG3 | |

---

## 6. Te Maken Implementation Documents

### 6.1 Implementation Lijst

| Implementation ID | Component | Control | Status |
|-------------------|-----------|---------|--------|
| IMPL-{{system}}-{comp1}-{ctrl} | | | ☐ Te maken |
| IMPL-{{system}}-{comp2}-{ctrl} | | | ☐ Te maken |
| IMPL-{{system}}-{comp3}-{ctrl} | | | ☐ Te maken |

### 6.2 Totaal Overzicht

| Categorie | Aantal |
|-----------|--------|
| Componenten | |
| Te maken Implementations | |
| Waarvan IG1 | |
| Waarvan IG2 | |
| Waarvan IG3 | |

---

## 7. Risico Identificatie

### 7.1 Voorlopige Risico's

| Risico | Component(en) | Impact | Mitigerende Control |
|--------|---------------|--------|---------------------|
| | | ☐ Laag ☐ Midden ☐ Hoog | |
| | | ☐ Laag ☐ Midden ☐ Hoog | |

### 7.2 Privacy Risico's

| Risico | Data Type | DPIA Nodig |
|--------|-----------|------------|
| | | ☐ Ja ☐ Nee |

---

## 8. Externe Integraties

### 8.1 Inbound Integraties

| Externe Partij | Data | Protocol | Authenticatie |
|----------------|------|----------|---------------|
| | | | |

### 8.2 Outbound Integraties

| Externe Partij | Data | Protocol | Authenticatie |
|----------------|------|----------|---------------|
| | | | |

### 8.3 Third Party Componenten

| Component | Vendor | Type | Security Assessment Nodig |
|-----------|--------|------|---------------------------|
| | | ☐ SaaS ☐ Managed ☐ Licensed | ☐ Ja ☐ Nee |

---

## 9. Acties & Planning

### 9.1 Volgende Stappen

| # | Actie | Verantwoordelijke | Deadline |
|---|-------|-------------------|----------|
| 1 | Component documents aanmaken | | |
| 2 | CIS Benchmarks downloaden | | |
| 3 | Implementation documents aanmaken | | |
| 4 | Risk documents aanmaken | | |
| 5 | Review door Security Officer | | |

### 9.2 Openstaande Vragen

- [ ] 
- [ ] 

---

## 10. Sign-Off

| Rol | Naam | Datum | Handtekening |
|-----|------|-------|--------------|
| System Owner | | | ☐ |
| Architect | | | ☐ |
| Security Officer | | | ☐ |

---

## Bijlagen

### A. Referenties

| Document | Locatie |
|----------|---------|
| Architectuur diagram | |
| Vendor security guide | |
| CIS Benchmark | |

### B. Gerelateerde SCF Documenten

- [[Systems/{{system}}]]
- [[Documentatie/Systeem-intakeprocedure|Systeem-intakeprocedure]]
