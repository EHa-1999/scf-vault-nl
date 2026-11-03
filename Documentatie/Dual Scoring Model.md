---
id: "DOC-Dual-Scoring"
type: documentation
name: "Dual Scoring Model"
created: 2026-01-29
modified: 2026-01-29
tags:
  - documentatie
  - scoring
  - implementatie
  - compliance
---

# Dual Scoring Model

> Twee scores, twee vragen, één compleet beeld.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Documentatie/_index\|📚 Documentatie]] | [[README\|🏠 Home]] | [[Dashboards/Implementatie Dashboard\|🚀 Implementatie]] |

---

## Waarom Twee Scores?

Het SCF-Vault framework maakt onderscheid tussen **implementatie** en **compliance** omdat dit twee fundamenteel verschillende vragen beantwoordt:

| Vraag | Score | Wie | Wanneer |
|-------|-------|-----|---------|
| "Is de control geïnstalleerd?" | **Implementatie** | Project team | Tijdens implementatie |
| "Voldoet het aan de norm?" | **Compliance** | Auditor / Assessor | Na validatie |

### Het Probleem met Één Score

Een enkele score kan misleidend zijn:

- **MFA is 100% geïnstalleerd** in KeyCloak...
- ...maar **slechts 94% van de gebruikers** heeft het geactiveerd
- Is de control "compliant"? Nee, niet volledig.

Met twee scores:
- `impl_percentage: 100%` → technisch volledig ingericht
- `compliance_score: 94%` → niet alle gebruikers voldoen

---

## De Twee Scores

### 🚀 Implementatie Score

**Vraag:** "Is de technische configuratie voltooid?"

| Veld | Type | Waarden |
|------|------|---------|
| `impl_status` | enum | `gepland` → `in_uitvoering` → `gereed` → `gevalideerd` |
| `impl_percentage` | number | 0-100 |
| `impl_validated` | boolean | false / true |
| `impl_date` | date | Datum van validatie |
| `impl_owner` | string | Verantwoordelijke |
| `impl_system` | string | Implementerend systeem |

**Focus:** Projectvoortgang, technische realisatie

### ✅ Compliance Score

**Vraag:** "Voldoet de implementatie aan de norm?"

| Veld | Type | Waarden |
|------|------|---------|
| `compliance_status` | enum | `niet_beoordeeld` → `niet_compliant` → `gedeeltelijk` → `compliant` |
| `compliance_score` | number | 0-100 (null indien niet beoordeeld) |
| `compliance_assessed` | date | Datum van laatste assessment |
| `compliance_assessor` | string | Wie heeft beoordeeld |
| `compliance_evidence` | list | Links naar bewijs |

**Focus:** Audit-gereedheid, normnaleving

---

## Workflow

![[Assets/diagrams/Implementation-Workflow.svg]]

### Fase 1: Implementatie

```
GEPLAND → IN_UITVOERING → GEREED → GEVALIDEERD
```

1. **Gepland** (`impl_status: "gepland"`)
   - Control staat op de roadmap
   - Nog geen werk gestart
   - `impl_percentage: 0`

2. **In Uitvoering** (`impl_status: "in_uitvoering"`)
   - Actief bezig met configuratie
   - `impl_percentage: 1-99`

3. **Gereed** (`impl_status: "gereed"`)
   - Technisch voltooid
   - `impl_percentage: 100`
   - Wacht op validatie

4. **Gevalideerd** (`impl_status: "gevalideerd"`)
   - Technisch geverifieerd door eigenaar
   - `impl_validated: true`
   - Klaar voor compliance assessment

### Fase 2: Compliance Assessment

![[Assets/diagrams/Compliance-Assessment-Workflow.svg]]

Pas **na validatie** kan compliance worden beoordeeld:

| Assessment Type | Frequentie | Door wie |
|-----------------|------------|----------|
| Self-Assessment | Kwartaal | Control owner |
| Interne Audit | Jaarlijks | CISO / Internal Audit |
| Externe Audit | Jaarlijks | Externe auditor |

### Compliance Status

| Status | Score Range | Betekenis |
|--------|-------------|-----------|
| 🟢 `compliant` | 80-100% | Voldoet aan de norm |
| 🟡 `gedeeltelijk` | 31-79% | Gedeeltelijk compliant |
| 🔴 `niet_compliant` | 0-30% | Voldoet niet |
| ⬜ `niet_beoordeeld` | - | Nog geen assessment |

---

## YAML Frontmatter Voorbeeld

```yaml
---
id: "CIS-6.5"
control_name: "Eis MFA voor Beheerderstoegang"
type: control

# ─────────────────────────────────────────────────────────────────────
# Implementatie Tracking
# ─────────────────────────────────────────────────────────────────────
impl_status: "gevalideerd"
impl_percentage: 100
impl_validated: true
impl_date: 2026-01-15
impl_owner: "Security Team"
impl_system: "KeyCloak"

# ─────────────────────────────────────────────────────────────────────
# Compliance Tracking
# ─────────────────────────────────────────────────────────────────────
compliance_status: "compliant"
compliance_score: 94
compliance_assessed: 2026-01-20
compliance_assessor: "J. de Vries"
compliance_evidence:
  - "[[Audits/2026/IA-2026-001-XENA/Self-Assessments/SA-2026-Q1-XENA]]"
compliance_notes: "3 van 50 admin accounts zonder MFA geactiveerd"
---
```

---

## Praktijkvoorbeeld: MFA Implementatie

### Situatie

Het Security Team heeft MFA geïmplementeerd in KeyCloak voor alle beheerders.

### Implementatie Perspectief

| Aspect | Status |
|--------|--------|
| KeyCloak MFA module | ✅ Geïnstalleerd |
| Configuratie | ✅ Correct |
| Documentatie | ✅ Bijgewerkt |
| Technische test | ✅ Geslaagd |

**Conclusie:** `impl_status: "gevalideerd"`, `impl_percentage: 100`

### Compliance Perspectief

| Aspect | Bevinding |
|--------|-----------|
| Totaal admin accounts | 50 |
| MFA geactiveerd | 47 |
| MFA niet geactiveerd | 3 |
| Compliance percentage | 94% |

**Conclusie:** `compliance_status: "compliant"`, `compliance_score: 94`. Volgens de drempels is 94% compliant. De drie accounts zonder MFA zijn wel een bevinding die moet worden opgevolgd; bij een baseline-control hoort daar een termijn bij.

### Actie

De 3 accounts zonder MFA moeten worden aangepakt:
1. Gebruikers notificeren
2. Deadline stellen
3. Escaleren indien nodig
4. Herbeoordeling na 30 dagen

---

## Dashboards

### Implementatie Dashboard

→ [[Dashboards/Implementatie Dashboard|🚀 Implementatie Dashboard]]

Toont:
- Status per control (gepland/in_uitvoering/gereed/gevalideerd)
- Voortgang per categorie
- Backlog en validatie-wachtrij

### Compliance Dashboard

→ [[Dashboards/Compliance Dashboard|✅ Compliance Dashboard]]

Toont:
- Compliance status van gevalideerde controls
- Framework compliance (NIS2, ISO 27001, BIO2)
- Assessment backlog
- Actie-items voor niet-compliant controls

### Executive Summary

→ [[Dashboards/Executive Summary|📈 Executive Summary]]

Toont beide scores in één overzicht voor management.

---

## Dataview Queries

### Alle Gevalideerde maar Niet-Beoordeelde Controls

```dataview
TABLE
  control_name as "Control",
  impl_date as "Gevalideerd op"
FROM "Controls"
WHERE impl_status = "gevalideerd" AND compliance_status = "niet_beoordeeld"
SORT impl_date ASC
```

### Controls met Compliance Gaps

```dataview
TABLE
  control_name as "Control",
  compliance_score + "%" as "Score",
  compliance_notes as "Notities"
FROM "Controls"
WHERE compliance_status = "gedeeltelijk" OR compliance_status = "niet_compliant"
SORT compliance_score ASC
```

---

## Best Practices

### 1. Implementatie Eerst, Compliance Later

Beoordeel compliance pas **na** technische validatie. Een half-geïnstalleerde control kan niet compliant zijn.

### 2. Evidence Verzamelen

Verzamel bewijs tijdens de assessment:
- Screenshots van configuratie
- Logbestanden
- Testresultaten
- Interview notities

### 3. Regelmatige Herbeoordeling

Compliance is geen eenmalige activiteit:
- **Kwartaal:** Self-assessments
- **Jaarlijks:** Interne audit
- **Bij wijzigingen:** Herbeoordeling

### 4. Actieplannen voor Gaps

Bij `gedeeltelijk` of `niet_compliant`:
1. Documenteer de gap in `compliance_notes`
2. Maak een actieplan
3. Plan herbeoordeling
4. Track in [[Dashboards/Risk Dashboard|Risk Dashboard]]

---

## Gerelateerde Documenten

- [[Documentatie/Systeem-intakeprocedure|Systeem-intakeprocedure]]
- [[Frameworks/LISA/7-LISA-Audits|LISA Audits]]
- [[Dashboards/_index|Dashboards Overzicht]]
- [[Templates/Control Template|Control Template]]
