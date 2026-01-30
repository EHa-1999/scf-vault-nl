---
type: index
name: "Templates"
icon: "📝"
created: 2026-01-28
---

# 📝 Templates

> Herbruikbare templates voor consistente documentatie.

---

## Navigatie

| ← Terug | Omhoog |
|---------|--------|
| [[README\|🏠 Home]] | — |

---

## Beschikbare Templates

| Template | Gebruik voor | Locatie |
|----------|--------------|---------|
| [[Templates/System Template\|System Template]] | Nieuwe systemen registreren | Systems/ |
| [[Templates/Component Template\|Component Template]] | Technische componenten | Components/ |
| [[Templates/Control Template\|Control Template]] | Nieuwe controls (zeldzaam) | Controls/ |
| [[Templates/Implementation Template\|Implementation Template]] | Control implementaties | Implementations/ |
| [[Templates/Risk Template\|Risk Template]] | Risico's registreren | Risks/ |
| [[Templates/SCB Template\|SCB Template]] | System Component Breakdown | Documentatie/SCB/ |

---

## Hoe Templates Gebruiken

### Methode 1: Kopiëren

1. Open het template
2. Kopieer de inhoud (Ctrl+A, Ctrl+C)
3. Maak een nieuw bestand in de juiste map
4. Plak de inhoud (Ctrl+V)
5. Pas de frontmatter en inhoud aan

### Methode 2: Templater Plugin (aanbevolen)

Met de Templater plugin kun je templates automatisch invoegen:

1. Installeer Templater via Community Plugins
2. Configureer de template folder: `Templates`
3. Gebruik Alt+E om een template in te voegen
4. Of gebruik de Templater scripts in `Audits/Scripts/`

---

## Templater Scripts

Geavanceerde scripts voor geautomatiseerde document creatie:

| Script | Functie |
|--------|---------|
| [[Audits/Scripts/Nieuwe Audit\|Nieuwe Audit]] | Compleet audit dossier aanmaken |
| [[Audits/Scripts/Nieuw Self-Assessment\|Nieuw Self-Assessment]] | Assessment document genereren |
| [[Audits/Scripts/Nieuwe Bevinding\|Nieuwe Bevinding]] | Finding registreren |

→ Zie [[Audits/README\|Audits README]] voor Templater configuratie

---

## Template Structuur

Elk template heeft:

1. **Frontmatter** (YAML) — Metadata velden
2. **Instructies** — Uitleg per sectie (verwijder na invullen)
3. **Secties** — Standaard structuur
4. **Dataview queries** — Dynamische content (waar relevant)

---

## Gerelateerde Secties

- [[Documentatie/System Onboarding Guide\|System Onboarding Guide]] — Wanneer welk template
- [[Audits/README\|Audits README]] — Templater setup
