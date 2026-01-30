---
id: "PLAN-2026"
type: planning
name: "Implementatieplan Security Controls 2026"
created: 2026-01-28
modified: 2026-01-28
status: Active
owner: CISO
tags:
  - planning
  - implementation
  - roadmap
---

# Implementatieplan Security Controls 2026

## Management Samenvatting

Dit implementatieplan beschrijft de gefaseerde uitrol van security controls voor alle systemen binnen de LISA architectuur. Het plan richt zich op het bereiken van compliance met ISO 27001, NIS2, BIO2 en AVG/GDPR tegen eind 2026.

**Doelstellingen:**
- CIS Controls compliance: 82% → 95%
- ISO 27001 certificering gereed: Q4 2026
- NIS2 compliance behouden: doorlopend
- Privacy controls volledig: Q3 2026

## Fasering Overzicht

```
2026
├─ Q1 (Jan-Mrt) ──────────────────────────────────────────────
│  ├── Fase 1: Foundation & Quick Wins
│  └── Focus: MFA, Logging, Encryption
│
├─ Q2 (Apr-Jun) ──────────────────────────────────────────────
│  ├── Fase 2: Core Security
│  └── Focus: Vulnerability Mgmt, Network Security
│
├─ Q3 (Jul-Sep) ──────────────────────────────────────────────
│  ├── Fase 3: Advanced Controls
│  └── Focus: Monitoring, Incident Response
│
└─ Q4 (Okt-Dec) ──────────────────────────────────────────────
   ├── Fase 4: Maturity & Certification
   └── Focus: ISO Audit, Optimization
```

---

## Fase 1: Foundation & Quick Wins (Q1 2026)

### Doelen
- [ ] MFA volledig uitgerold voor alle privileged users
- [ ] Data-at-rest encryptie 100% compleet
- [ ] Audit logging operationeel voor alle systemen
- [ ] Self-assessment proces geïmplementeerd

### Deliverables

| # | Deliverable | Eigenaar | Deadline | Status |
|---|-------------|----------|----------|--------|
| 1.1 | MFA enrollment privileged users | IAM Team | 28 Feb | 🟡 |
| 1.2 | MinIO encryptie verificatie | Platform Team | 15 Feb | ✅ |
| 1.3 | PostgreSQL TDE configuratie | DBA Team | 15 Feb | ✅ |
| 1.4 | NiFi audit logging | Platform Team | 28 Feb | 🟡 |
| 1.5 | Self-assessment templates | CISO | 31 Jan | ✅ |
| 1.6 | Q1 Self-assessments uitvoeren | System Owners | 31 Mrt | 🔵 |

### Gerelateerde Controls

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  name as "Naam",
  implementation_group as "IG"
FROM "Controls/CIS"
WHERE category = 3 OR category = 6 OR category = 8
SORT category ASC
LIMIT 15
```

### Resources Benodigd

| Resource | Uren | Kosten |
|----------|------|--------|
| Security Engineer | 120 | Intern |
| IAM Specialist | 40 | Intern |
| DBA | 20 | Intern |
| MFA Licenties | - | €15.000 |
| **Totaal** | **180** | **€15.000** |

### Risico's & Mitigaties

| Risico | Impact | Mitigatie |
|--------|--------|-----------|
| MFA adoptie weerstand | Medium | Communicatieplan + training |
| Performance impact encryptie | Laag | Benchmark voor/na |
| Resource beschikbaarheid | Medium | Prioritering met management |

---

## Fase 2: Core Security (Q2 2026)

### Doelen
- [ ] Vulnerability management proces operationeel
- [ ] Network segmentatie geïmplementeerd
- [ ] Patch management geformaliseerd
- [ ] Leveranciers risk assessments uitgevoerd

### Deliverables

| # | Deliverable | Eigenaar | Deadline | Status |
|---|-------------|----------|----------|--------|
| 2.1 | Vulnerability scanner deployment | Security Team | 30 Apr | 🔵 |
| 2.2 | Vulnerability management proces | CISO | 15 Apr | 🔵 |
| 2.3 | Network segmentatie XENA | Netwerk Team | 31 Mei | 🔵 |
| 2.4 | Patch management procedure | Operations | 30 Apr | 🔵 |
| 2.5 | Leveranciers inventarisatie | Procurement | 15 Apr | 🔵 |
| 2.6 | Top 10 leveranciers assessment | Security Team | 30 Jun | 🔵 |

### Gerelateerde Controls

| CIS Cat | Controls | Focus |
|---------|----------|-------|
| 7 | Vulnerability Management | Scanner, proces, remediation |
| 12 | Network Infrastructure | Segmentatie, hardening |
| 15 | Service Provider Mgmt | Assessments, contracten |

### Resources Benodigd

| Resource | Uren | Kosten |
|----------|------|--------|
| Security Engineer | 160 | Intern |
| Network Engineer | 80 | Intern |
| Vulnerability Scanner | - | €25.000/jaar |
| Externe assessments | 40 | €8.000 |
| **Totaal** | **280** | **€33.000** |

---

## Fase 3: Advanced Controls (Q3 2026)

### Doelen
- [ ] SIEM operationeel
- [ ] Incident response proces getest
- [ ] Security awareness training vernieuwd
- [ ] Penetration test uitgevoerd

### Deliverables

| # | Deliverable | Eigenaar | Deadline | Status |
|---|-------------|----------|----------|--------|
| 3.1 | SIEM deployment | Security Team | 31 Jul | 🔵 |
| 3.2 | Use cases en alerting | Security Team | 31 Aug | 🔵 |
| 3.3 | IR playbooks update | CISO | 15 Jul | 🔵 |
| 3.4 | IR tabletop exercise | Security Team | 31 Aug | 🔵 |
| 3.5 | Awareness training rollout | HR/Security | 30 Sep | 🔵 |
| 3.6 | Externe pentest | Extern | 30 Sep | 🔵 |

### Gerelateerde Controls

| CIS Cat | Controls | Focus |
|---------|----------|-------|
| 13 | Network Monitoring | SIEM, alerting |
| 17 | Incident Response | Proces, team, oefeningen |
| 14 | Security Awareness | Training, phishing tests |
| 18 | Penetratietesten | Externe test, remediatie |

### Resources Benodigd

| Resource | Uren | Kosten |
|----------|------|--------|
| Security Engineer | 200 | Intern |
| SIEM Implementatie | - | €40.000 |
| Awareness Platform | - | €5.000/jaar |
| Penetration Test | - | €15.000 |
| **Totaal** | **200** | **€60.000** |

---

## Fase 4: Maturity & Certification (Q4 2026)

### Doelen
- [ ] ISO 27001 interne audit afgerond
- [ ] Alle bevindingen remediated
- [ ] 95% CIS Controls compliance
- [ ] Continuous improvement proces actief

### Deliverables

| # | Deliverable | Eigenaar | Deadline | Status |
|---|-------------|----------|----------|--------|
| 4.1 | Gap assessment ISO 27001 | CISO | 15 Okt | 🔵 |
| 4.2 | Remediation plan | Security Team | 31 Okt | 🔵 |
| 4.3 | Interne audit ISO | Interne Auditor | 30 Nov | 🔵 |
| 4.4 | Management review | CISO/MT | 15 Dec | 🔵 |
| 4.5 | Certificering aanvraag | CISO | 31 Dec | 🔵 |

### Gerelateerde Controls

Alle resterende controls met focus op:
- Documentatie en procedures
- Evidence verzameling
- Continuous monitoring
- Management commitment

### Resources Benodigd

| Resource | Uren | Kosten |
|----------|------|--------|
| Security Engineer | 120 | Intern |
| CISO | 80 | Intern |
| ISO Consultant | 40 | €12.000 |
| Certificeringsaudit | - | €20.000 |
| **Totaal** | **240** | **€32.000** |

---

## Budget Overzicht

| Fase | Intern (uren) | Extern (€) |
|------|---------------|------------|
| Q1: Foundation | 180 | €15.000 |
| Q2: Core Security | 280 | €33.000 |
| Q3: Advanced | 200 | €60.000 |
| Q4: Maturity | 240 | €32.000 |
| **Totaal** | **900** | **€140.000** |

### Verdeling per Categorie

| Categorie | Budget |
|-----------|--------|
| Tooling & Licenties | €85.000 |
| Externe Diensten | €35.000 |
| Training | €5.000 |
| Certificering | €15.000 |
| **Totaal** | **€140.000** |

## Dependencies & Kritiek Pad

```
MFA (Q1) ──────────────────────────────────────►
          │
          ├── Vulnerability Mgmt (Q2) ─────────►
          │                     │
          │                     └── Pentest (Q3) ───►
          │
          └── Network Segmentatie (Q2) ────────►
                                │
                                └── SIEM (Q3) ──────► ISO Audit (Q4)
```

## Governance

### Stuurgroep
- **Voorzitter:** CIO
- **Leden:** CISO, IT Manager, Privacy Officer
- **Frequentie:** Maandelijks

### Rapportage
- **Weekly:** Status update aan Security Team
- **Monthly:** Voortgangsrapport aan MT
- **Quarterly:** Executive Summary aan Bestuur

### Escalatie
1. Security Team → CISO
2. CISO → IT Manager
3. IT Manager → CIO
4. CIO → Bestuur

## KPI's en Metrics

| KPI | Baseline | Q1 | Q2 | Q3 | Q4 |
|-----|----------|----|----|----|----|
| CIS Compliance % | 82% | 86% | 90% | 93% | 95% |
| Open Bevindingen | 6 | 4 | 3 | 2 | 0 |
| Kritieke Risico's | 1 | 0 | 0 | 0 | 0 |
| MFA Coverage % | 60% | 100% | 100% | 100% | 100% |
| Patch Compliance % | 70% | 80% | 90% | 95% | 95% |

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 1.0 | 2026-01-28 | CISO | Initiële versie |

---

## Gerelateerde Documenten

- [[Dashboards/Executive Summary|Executive Summary]]
- [[Dashboards/Implementation Tracker|Implementation Tracker]]
- [[Dashboards/Compliance Dashboard|Compliance Dashboard]]
- [[Frameworks/LISA/1-LISA-Introductie|LISA Framework]]
