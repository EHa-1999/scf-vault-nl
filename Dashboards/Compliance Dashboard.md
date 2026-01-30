---
id: "DASH-Compliance"
type: dashboard
name: "Compliance Dashboard"
created: 2026-01-29
modified: 2026-01-29
tags:
  - dashboard
  - compliance
  - audit
---

# ✅ Compliance Dashboard

> Compliancestatus op basis van assessments en audits — alleen voor gevalideerde implementaties.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Dashboards/_index\|📊 Dashboards]] | [[README\|🏠 Home]] | [[Dashboards/Implementatie Dashboard\|🚀 Implementatie]] |

---

## Compliance vs Implementatie

| Aspect | Implementatie | Compliance |
|--------|---------------|------------|
| **Vraag** | Is het geïnstalleerd? | Voldoet het aan de norm? |
| **Wanneer** | Tijdens project | Na validatie |
| **Wie** | Implementatie team | Auditor / Assessor |
| **Bewijs** | Configuratie docs | Audit rapport |
| **Score** | % gereed | % compliant |

> ⚠️ **Let op**: Een control kan 100% geïmplementeerd zijn maar toch niet compliant (bijv. MFA geïnstalleerd maar niet door alle gebruikers geactiveerd).

---

## Compliance Statussen

| Status | Betekenis | Score |
|--------|-----------|-------|
| ⬜ `niet_beoordeeld` | Nog niet geassessed | - |
| 🔴 `niet_compliant` | Voldoet niet aan vereisten | 0-30% |
| 🟡 `gedeeltelijk` | Gedeeltelijk compliant | 31-79% |
| 🟢 `compliant` | Volledig compliant | 80-100% |

---

## Totaal Compliance Overzicht

### Per Status (Alleen Gevalideerde Controls)

```dataview
TABLE WITHOUT ID
  compliance_status as "Status",
  length(rows) as "Aantal"
FROM "Controls"
WHERE type = "control" AND impl_status = "gevalideerd"
GROUP BY compliance_status
SORT compliance_status ASC
```

### Gemiddelde Compliance Score per Categorie

```dataview
TABLE WITHOUT ID
  category as "Categorie",
  length(filter(rows, (r) => r.impl_status = "gevalideerd")) as "Gevalideerd",
  length(filter(rows, (r) => r.compliance_status = "compliant")) as "🟢",
  length(filter(rows, (r) => r.compliance_status = "gedeeltelijk")) as "🟡",
  length(filter(rows, (r) => r.compliance_status = "niet_compliant")) as "🔴"
FROM "Controls"
WHERE type = "control"
GROUP BY category
SORT category ASC
```

---

## Framework Compliance

### NIS2 Directive Compliance

```dataview
TABLE WITHOUT ID
  nis2 as "Artikel",
  length(rows) as "Controls",
  length(filter(rows, (r) => r.compliance_status = "compliant")) as "🟢",
  length(filter(rows, (r) => r.compliance_status = "gedeeltelijk")) as "🟡",
  length(filter(rows, (r) => r.compliance_status = "niet_compliant")) as "🔴"
FROM "Controls"
WHERE type = "control" AND nis2 != null AND nis2 != "" AND impl_status = "gevalideerd"
GROUP BY nis2
SORT nis2 ASC
```

### ISO 27001:2022 Compliance

```dataview
TABLE WITHOUT ID
  iso27001 as "Annex",
  length(rows) as "Controls",
  length(filter(rows, (r) => r.compliance_status = "compliant")) as "🟢",
  length(filter(rows, (r) => r.compliance_status = "gedeeltelijk")) as "🟡",
  length(filter(rows, (r) => r.compliance_status = "niet_compliant")) as "🔴"
FROM "Controls"
WHERE type = "control" AND iso27001 != null AND iso27001 != "" AND impl_status = "gevalideerd"
GROUP BY iso27001
SORT iso27001 ASC
LIMIT 20
```

### BIO2 Compliance

```dataview
TABLE WITHOUT ID
  bio2 as "Maatregel",
  length(rows) as "Controls",
  length(filter(rows, (r) => r.compliance_status = "compliant")) as "🟢",
  length(filter(rows, (r) => r.compliance_status = "gedeeltelijk")) as "🟡",
  length(filter(rows, (r) => r.compliance_status = "niet_compliant")) as "🔴"
FROM "Controls"
WHERE type = "control" AND bio2 != null AND bio2 != "" AND impl_status = "gevalideerd"
GROUP BY bio2
SORT bio2 ASC
LIMIT 20
```

---

## Compliance Details per Control Type

### CIS Controls - Compliance Status

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(compliance_status = "compliant", "🟢", choice(compliance_status = "gedeeltelijk", "🟡", choice(compliance_status = "niet_compliant", "🔴", "⬜"))) as "Status",
  compliance_score as "Score",
  compliance_assessed as "Beoordeeld",
  compliance_assessor as "Assessor"
FROM "Controls/CIS"
WHERE type = "control" AND impl_status = "gevalideerd"
SORT compliance_status ASC, id ASC
```

### Extended Controls - Compliance Status

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  choice(compliance_status = "compliant", "🟢", choice(compliance_status = "gedeeltelijk", "🟡", choice(compliance_status = "niet_compliant", "🔴", "⬜"))) as "Status",
  compliance_score as "Score",
  compliance_assessed as "Beoordeeld"
FROM "Controls"
WHERE type = "control" AND impl_status = "gevalideerd" AND !contains(file.path, "CIS")
SORT id ASC
```

---

## Assessment Backlog

### Gevalideerd maar Nog Niet Beoordeeld

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  category as "Categorie",
  priority as "Prio",
  impl_date as "Gevalideerd op"
FROM "Controls"
WHERE type = "control" AND impl_status = "gevalideerd" AND compliance_status = "niet_beoordeeld"
SORT priority DESC, impl_date ASC
```

### Gedeeltelijk Compliant - Actie Vereist

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  compliance_score + "%" as "Score",
  compliance_assessed as "Beoordeeld"
FROM "Controls"
WHERE type = "control" AND compliance_status = "gedeeltelijk"
SORT compliance_score ASC
```

### Niet Compliant - Kritieke Gaps

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  compliance_score + "%" as "Score",
  compliance_assessor as "Assessor"
FROM "Controls"
WHERE type = "control" AND compliance_status = "niet_compliant"
SORT priority DESC
```

---

## Compliance Assessment Proces

### Workflow

![[Assets/diagrams/Compliance-Assessment-Workflow.svg]]

### Assessment Typen

| Type | Frequentie | Door wie | Diepgang |
|------|------------|----------|----------|
| **Self-Assessment** | Kwartaal | Control owner | Basis check |
| **Interne Audit** | Jaarlijks | CISO / Internal Audit | Volledig |
| **Externe Audit** | Jaarlijks | Externe auditor | Certificering |

---

## Evidence Overzicht

### Controls met Evidence

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  compliance_evidence as "Evidence"
FROM "Controls"
WHERE type = "control" AND compliance_evidence != null AND length(compliance_evidence) > 0
SORT id ASC
LIMIT 20
```

---

## Compliance Checklist per Assessment

Bij elk compliance assessment:

- [ ] **Control gevalideerd?** Implementatie moet status "gevalideerd" hebben
- [ ] **Effectiviteit getest?** Werkt de control in de praktijk?
- [ ] **Volledigheid?** Dekt de implementatie alle aspecten van de control?
- [ ] **Evidence verzameld?** Screenshots, logs, configuraties, interviews
- [ ] **Afwijkingen gedocumenteerd?** Wat ontbreekt, waarom, actieplan
- [ ] **Score bepaald?** 0-100% op basis van bevindingen
- [ ] **Status gezet?** compliant / gedeeltelijk / niet_compliant

---

## Recente Assessments

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  compliance_status as "Status",
  compliance_score + "%" as "Score",
  compliance_assessed as "Datum",
  compliance_assessor as "Assessor"
FROM "Controls"
WHERE type = "control" AND compliance_assessed != null
SORT compliance_assessed DESC
LIMIT 15
```

---

## Gerelateerde Documenten

- [[Dashboards/Implementatie Dashboard|Implementatie Dashboard]]
- [[Dashboards/Audit Dashboard|Audit Dashboard]]
- [[Audits/_index|Audits Overzicht]]
- [[Dashboards/Executive Summary|Executive Summary]]
