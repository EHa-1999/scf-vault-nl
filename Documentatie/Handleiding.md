---
type: documentation
title: "SCF Handleiding voor Dagelijks Gebruik"
version: "1.0"
created: 2025-01-27
modified: 2025-01-27
author: "XENA Architecture Team"
tags:
  - documentatie
  - handleiding
  - workflow
---

# SCF Handleiding voor Dagelijks Gebruik

Praktische handleiding voor het werken met de Security Control Framework Vault.

## Snelstart

### Vault Openen

1. Start Obsidian
2. Open vault: `File → Open Vault → SCF-Vault`
3. Installeer plugins (eenmalig):
   - **Dataview** (verplicht)
   - **Obsidian Git** (aanbevolen)
   - **Templater** (optioneel)

### Navigatie

| Startpunt | Wanneer |
|-----------|---------|
| [[Dashboards/Main Dashboard]] | Dagelijks overzicht |
| [[Dashboards/Compliance Dashboard]] | Framework compliance |
| [[Dashboards/Risk Dashboard]] | Risico overzicht |
| [[Dashboards/Implementation Tracker]] | Voortgang bijhouden |

## Dagelijkse Taken

### Status van een Control Bekijken

1. Ga naar `Controls/CIS/` of `Controls/EXT-P/`
2. Open de betreffende control
3. Scroll naar "Component Implementaties" sectie
4. Bekijk de status per component

### Implementation Status Bijwerken

1. Open de Implementation (in `/Implementations`)
2. Wijzig `impl_status` in frontmatter:
   ```yaml
   impl_status: "Implemented"  # of: Partial, Planned, Not Started
   ```
3. Update DoD checklist:
   ```markdown
   - [x] **DoD-1**: SSE-S3 is ingeschakeld
   - [ ] **DoD-2**: Key rotation geconfigureerd
   ```
4. Voeg toe aan Audit Trail tabel

### Bewijsmateriaal Toevoegen

1. Upload bestand naar MinIO bucket `scf-evidence`
2. Voeg link toe in Implementation onder "Verzameld Bewijsmateriaal":
   ```markdown
   | 2025-01-27 | Screenshot | MinIO encryption config | `Evidence/XENA/MinIO/encryption-2025-01.png` |
   ```

## Periodieke Taken

### Wekelijks: Review Open Items

```dataview
TABLE 
  control as "Control",
  component as "Component",
  impl_status as "Status"
FROM "Implementations"
WHERE impl_status != "Implemented"
SORT impl_status ASC
```

### Maandelijks: Aankomende Reviews

```dataview
TABLE 
  control as "Control",
  component as "Component",
  next_review as "Review Datum"
FROM "Implementations"
WHERE next_review <= date(today) + dur(30 days)
SORT next_review ASC
```

### Kwartaal: Risico Herbeoordeling

1. Open [[Dashboards/Risk Dashboard]]
2. Review elk open risico
3. Update likelihood en impact scores
4. Documenteer in Risk Review Historie

## Nieuwe Items Aanmaken

### Nieuwe Implementation

Wanneer een control op een component moet worden toegepast:

1. Kopieer `/Templates/Implementation Template.md`
2. Hernoem naar: `IMPL-{System}-{Component}-{ControlNr}.md`
3. Plaats in `/Implementations`
4. Vul in:
   - Frontmatter links (control, component, system, risk)
   - Implementatie specificatie
   - DoD criteria (minimaal 3-5 meetbare punten)
   - Vereist bewijsmateriaal

### Nieuw Risico

1. Kopieer `/Templates/Risk Template.md`
2. Hernoem naar: `RSK-{volgnummer}.md`
3. Plaats in `/Risks`
4. Vul in:
   - Risico scenario beschrijving
   - Likelihood en Impact scores
   - Getroffen systems en components
   - Mitigerende controls

### Nieuwe Component

Wanneer een nieuw technisch component wordt toegevoegd:

1. Kopieer `/Templates/Component Template.md`
2. Hernoem naar componentnaam
3. Plaats in `/Components`
4. Bepaal relevante controls
5. Maak per control een Implementation aan

## Tips en Trucs

### Snel Zoeken

- `Ctrl/Cmd + O`: Quick switcher (bestandsnaam)
- `Ctrl/Cmd + Shift + F`: Zoek in alle bestanden
- `Ctrl/Cmd + P`: Command palette

### Handige Dataview Queries

**Alle kritieke controls:**
```dataview
LIST
FROM "Controls"
WHERE priority = 5
```

**Controls per framework:**
```dataview
TABLE iso27001, nis2, bio2
FROM "Controls/CIS"
WHERE iso27001 != ""
LIMIT 20
```

**Implementations per eigenaar:**
```dataview
TABLE control, component, impl_status
FROM "Implementations"
WHERE owner = "@storage-team"
```

### Graph View

Open Graph View (`Ctrl/Cmd + G`) om relaties visueel te zien:
- Filter op `path:Implementations` voor implementation netwerk
- Filter op `path:Risks` voor risico relaties

## Veelvoorkomende Problemen

### Dataview toont "No results"

**Oorzaak**: Query pad matcht niet of cache is verouderd

**Oplossing**:
1. `Ctrl/Cmd + P` → "Dataview: Force Refresh"
2. Controleer of paden exact matchen (hoofdlettergevoelig!)

### Links werken niet

**Oorzaak**: Bestandsnaam gewijzigd

**Oplossing**:
1. Gebruik Obsidian's rename functie (F2)
2. Obsidian update automatisch alle links

### Git sync conflicten

**Oorzaak**: Meerdere personen hebben hetzelfde bestand gewijzigd

**Oplossing**:
1. Pull eerst: `Obsidian Git: Pull`
2. Los conflicten op in het bestand
3. Commit en push

## Rollen en Verantwoordelijkheden

| Rol | Taken | Mappen |
|-----|-------|--------|
| **Security Officer** | Implementation reviews, Risk management | Implementations, Risks |
| **Architect** | Component beheer, System documentatie | Components, Systems |
| **CISO** | Framework compliance, Dashboard review | Dashboards, Frameworks |
| **Auditor** | Evidence review, Compliance verificatie | Evidence, Implementations |

## Keyboard Shortcuts

| Actie | Shortcut |
|-------|----------|
| Nieuw bestand | `Ctrl/Cmd + N` |
| Quick switcher | `Ctrl/Cmd + O` |
| Command palette | `Ctrl/Cmd + P` |
| Zoeken | `Ctrl/Cmd + Shift + F` |
| Graph view | `Ctrl/Cmd + G` |
| Toggle edit/preview | `Ctrl/Cmd + E` |
| Git pull | Via command palette |
| Git push | Via command palette |

## Gerelateerde Documentatie

- [[Documentatie/SCF Architectuur|SCF Architectuur en Samenhang]]
- [[README|Quick Start Guide]]
- [[Dashboards/Main Dashboard|Hoofd Dashboard]]

---

*Handleiding versie 1.0 - Laatst bijgewerkt: 2025-01-27*
