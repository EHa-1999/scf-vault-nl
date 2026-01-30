---
type: index
name: "Audits"
icon: "🔍"
created: 2026-01-28
---

# 🔍 Audits & Assurance

> Self-assessments, interne audits en bevindingen — de verificatielaag.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[README\|🏠 Home]] | — | [[Risks/_index\|⚠️ Risks]] |

---

## Structuur

```
Audits/
├── Scripts/           # Templater scripts
│   ├── Nieuwe Audit.md
│   ├── Nieuw Self-Assessment.md
│   └── Nieuwe Bevinding.md
├── 2026/             # Audits per jaar
│   └── IA-2026-001-XENA/
│       ├── _IA-2026-001.md      # Hoofdrapport
│       ├── Self-Assessments/    # Assessments
│       ├── Bevindingen/         # Findings
│       └── Evidence/            # Bewijsmateriaal
└── README.md         # Setup instructies
```

---

## Actieve Audits

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Audit",
  name as "Naam",
  status as "Status",
  auditor as "Auditor"
FROM "Audits"
WHERE type = "audit" AND status != "Closed"
SORT created DESC
```

---

## Per Jaar

### 2026

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Audit",
  name as "Naam",
  status as "Status"
FROM "Audits/2026"
WHERE type = "audit"
SORT id ASC
```

---

## Self-Assessments

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Assessment",
  system as "System",
  period as "Periode",
  status as "Status"
FROM "Audits"
WHERE type = "self-assessment"
SORT assessment_date DESC
LIMIT 10
```

---

## Open Bevindingen

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "Finding",
  severity as "Ernst",
  title as "Titel",
  status as "Status",
  due_date as "Deadline"
FROM "Audits"
WHERE type = "finding" AND status != "Closed"
SORT severity DESC, due_date ASC
```

---

## Nieuwe Audit Starten

### Met Templater (aanbevolen)

1. Open een willekeurig bestand
2. Voer uit: `Audits/Scripts/Nieuwe Audit`
3. Volg de prompts

### Handmatig

1. Maak een nieuwe map: `Audits/{YYYY}/IA-{YYYY}-{NNN}-{System}/`
2. Kopieer de structuur van een bestaand audit dossier
3. Pas de frontmatter aan

→ Zie [[Audits/README|Audits README]] voor gedetailleerde instructies

---

## Gerelateerde Secties

- [[Dashboards/Audit Dashboard|🔍 Audit Dashboard]]
- [[Risks/_index|⚠️ Risks]] — Geïdentificeerde risico's
- [[Dashboards/Baseline Dashboard|🔒 Baseline Dashboard]] — Comply or Explain
