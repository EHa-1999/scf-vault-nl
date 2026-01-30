---
type: index
name: "Risks"
icon: "⚠️"
created: 2026-01-28
---

# ⚠️ Risks

> Risico register met behandelplannen en mitigerende controls.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[README\|🏠 Home]] | — | [[Audits/_index\|🔍 Audits]] · [[Controls/_index\|📋 Controls]] |

---

## Risico Overzicht

```dataview
TABLE WITHOUT ID
  risk_level as "Niveau",
  length(rows) as "Aantal"
FROM "Risks"
WHERE type = "risk"
GROUP BY risk_level
SORT risk_level DESC
```

---

## Open Risico's

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  name as "Risico",
  risk_level as "Niveau",
  status as "Status",
  owner as "Eigenaar"
FROM "Risks"
WHERE type = "risk" AND status != "Closed" AND status != "Mitigated"
SORT risk_level DESC
```

---

## Per System

### XENA

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  name as "Risico",
  risk_level as "Niveau",
  status as "Status"
FROM "Risks"
WHERE contains(system, "XENA")
SORT risk_level DESC
```

### ZGW

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  name as "Risico",
  risk_level as "Niveau",
  status as "Status"
FROM "Risks"
WHERE contains(system, "ZGW")
SORT risk_level DESC
```

---

## Risico Niveaus

| Niveau | Beschrijving | Actie |
|--------|--------------|-------|
| **Critical** | Onmiddellijke dreiging, hoge impact | Direct adresseren |
| **High** | Significante dreiging | Binnen 30 dagen |
| **Medium** | Beheersbare dreiging | Binnen 90 dagen |
| **Low** | Minimale dreiging | Monitoren |

---

## Nieuw Risico Registreren

1. Maak document via [[Templates/Risk Template|Risk Template]]
2. Gebruik naamconventie: `RSK-{System}-{NNN}`
3. Koppel aan relevante controls
4. Definieer behandelplan
5. Wijs eigenaar toe

---

## Gerelateerde Secties

- [[Dashboards/Risk Dashboard|⚠️ Risk Dashboard]]
- [[Controls/_index|📋 Controls]] — Mitigerende controls
- [[Audits/_index|🔍 Audits]] — Risico identificatie via audits
