---
id: "SCB-{{System}}"
type: scb
name: "System Component Breakdown - {{System}}"
system: "[[Systems/{{System}}]]"
version: "1.0"
status: Draft
architect: ""
created: {{date}}
modified: {{date}}
tags:
  - scb
  - architecture
---

# System Component Breakdown: {{System}}

## Document Informatie

| Veld | Waarde |
|------|--------|
| **Systeem** | [[Systems/{{System}}]] |
| **Versie** | 1.0 |
| **Status** | Draft |
| **Architect** | |
| **Laatst bijgewerkt** | {{date}} |

## 1. Systeem Overzicht

### 1.1 Beschrijving

> Beschrijf het doel en de functie van het systeem.

### 1.2 Classificatie

| Aspect | Classificatie | Toelichting |
|--------|---------------|-------------|
| **Beschikbaarheid** | | |
| **Integriteit** | | |
| **Vertrouwelijkheid** | | |
| **BIV Totaal** | | |

### 1.3 Data Classificatie

| Data Type | Classificatie | Volume | Retentie |
|-----------|---------------|--------|----------|
| | | | |

## 2. Architectuur Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                        {{System}}                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐   │
│   │             │    │             │    │             │   │
│   │  Frontend   │───▶│   Backend   │───▶│  Database   │   │
│   │             │    │             │    │             │   │
│   └─────────────┘    └─────────────┘    └─────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

> Vervang dit diagram door een gedetailleerd architectuur diagram.

## 3. Component Inventaris

### 3.1 Component Overzicht

| # | Component | Type | Vendor | Versie | CIS Benchmark |
|---|-----------|------|--------|--------|---------------|
| 1 | | | | | ☐ Ja / ☐ Nee |
| 2 | | | | | ☐ Ja / ☐ Nee |
| 3 | | | | | ☐ Ja / ☐ Nee |

### 3.2 Component Details

#### Component 1: {Naam}

| Eigenschap | Waarde |
|------------|--------|
| **Type** | |
| **Vendor** | |
| **Versie** | |
| **Hostname** | |
| **Poort(en)** | |
| **Protocol** | |
| **Authenticatie** | |
| **SCF Document** | [[Components/{naam}]] |

**Functie:**
> Beschrijf de functie van dit component binnen het systeem.

**Security Relevantie:**
- [ ] Verwerkt persoonsgegevens
- [ ] Extern bereikbaar
- [ ] Privileged access
- [ ] Slaat gevoelige data op

---

#### Component 2: {Naam}

*(Herhaal voor elk component)*

---

## 4. Data Flows

### 4.1 Interne Data Flows

| Van | Naar | Data Type | Protocol | Encryptie |
|-----|------|-----------|----------|-----------|
| | | | | ☐ Ja / ☐ Nee |

### 4.2 Externe Integraties

| Externe Partij | Richting | Data Type | Protocol | Authenticatie |
|----------------|----------|-----------|----------|---------------|
| | Inbound / Outbound | | | |

### 4.3 Data Flow Diagram

```
┌──────────┐         ┌──────────┐         ┌──────────┐
│  User    │──HTTPS──│ Frontend │──REST───│ Backend  │
└──────────┘         └──────────┘         └──────────┘
                                               │
                                            SQL/TLS
                                               │
                                               ▼
                                          ┌──────────┐
                                          │ Database │
                                          └──────────┘
```

## 5. Security Boundaries

### 5.1 Trust Zones

| Zone | Componenten | Trust Level |
|------|-------------|-------------|
| DMZ | | Untrusted |
| Applicatie | | Internal |
| Data | | Restricted |
| Management | | Privileged |

### 5.2 Network Segmentatie

| Segment | VLAN/Subnet | Firewall Rules |
|---------|-------------|----------------|
| | | |

## 6. Control Mapping per Component

### 6.1 CIS Benchmark Beschikbaarheid

| Component | CIS Benchmark | Versie | Bron |
|-----------|---------------|--------|------|
| | ☐ Beschikbaar / ☐ Niet | | |

### 6.2 Control Toewijzing Matrix

| CIS Cat | Control | Comp 1 | Comp 2 | Comp 3 | Comp 4 |
|---------|---------|--------|--------|--------|--------|
| 3 | Gegevensbescherming | ☐ | ☐ | ☐ | ☐ |
| 4 | Secure Config | ☐ | ☐ | ☐ | ☐ |
| 5 | Account Mgmt | ☐ | ☐ | ☐ | ☐ |
| 6 | Access Control | ☐ | ☐ | ☐ | ☐ |
| 8 | Audit Logging | ☐ | ☐ | ☐ | ☐ |
| 10 | Malware | ☐ | ☐ | ☐ | ☐ |
| 11 | Gegevensherstel | ☐ | ☐ | ☐ | ☐ |
| 16 | App Security | ☐ | ☐ | ☐ | ☐ |

**Legenda:** ☑ = Van toepassing, ☐ = Niet van toepassing

### 6.3 Te Maken Implementations

```dataview
TABLE WITHOUT ID
  "IMPL-{{System}}-" + component + "-" + control as "Implementation ID",
  component as "Component",
  control as "Control"
FROM "Controls/CIS"
WHERE implementation_group = "IG1"
LIMIT 20
```

> Pas deze query aan op basis van de control mapping.

## 7. Risico's

### 7.1 Geïdentificeerde Risico's

| Risico | Component(en) | Impact | Likelihood | Mitigerende Controls |
|--------|---------------|--------|------------|---------------------|
| | | | | |

### 7.2 Privacy Risico's (indien PII)

| Risico | Data Type | Impact | DPIA Vereist |
|--------|-----------|--------|--------------|
| | | | ☐ Ja / ☐ Nee |

## 8. Implementatie Checklist

### 8.1 Voorafgaand aan Productie

- [ ] Alle componenten gedocumenteerd in SCF
- [ ] Control mapping compleet
- [ ] Alle IG1 controls hebben Implementation document
- [ ] DoD gedefinieerd voor alle implementations
- [ ] Risico's geïdentificeerd en gedocumenteerd
- [ ] Privacy controls geadresseerd (indien PII)
- [ ] Security Officer review compleet
- [ ] CISO goedkeuring

### 8.2 Na Go-Live

- [ ] Baseline Self-Assessment gepland
- [ ] Monitoring actief
- [ ] Incident response procedures bekend
- [ ] Eerste vulnerability scan gepland

## 9. Bijlagen

### 9.1 Referenties

| Document | Locatie |
|----------|---------|
| Architectuur Diagram (Visio/Draw.io) | |
| Vendor Security Guide | |
| CIS Benchmark PDF | |

### 9.2 Gerelateerde SCF Documenten

```dataview
LIST
FROM "Systems" OR "Components" OR "Implementations"
WHERE contains(string(file.outlinks), "{{System}}")
LIMIT 20
```

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 1.0 | {{date}} | | Initiële versie |
