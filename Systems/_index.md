---
type: index
name: "Systems"
icon: "🖥️"
created: 2026-01-28
---

# 🖥️ Systems

> Applicaties en platforms die onder het security framework vallen.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[README\|🏠 Home]] | — | [[Components/_index\|🔧 Components]] · [[Implementations/_index\|⚙️ Implementations]] |

---

## Wat is een System?

Een **System** is een applicatie, platform of dienst die:
- Bedrijfskritische functies vervult
- Data verwerkt die beschermd moet worden
- Onder de scope van het security framework valt

Elk system heeft:
- Een **BIV-classificatie** (Beschikbaarheid, Integriteit, Vertrouwelijkheid)
- Een **System Component Breakdown (SCB)** met alle technische componenten
- **Implementations** die controls koppelen aan componenten

---

## Geregistreerde Systems

```dataview
TABLE WITHOUT ID
  link(file.link, name) as "System",
  classification as "BIV",
  status as "Status",
  owner as "Eigenaar"
FROM "Systems"
WHERE type = "system"
SORT name ASC
```

---

## System Details

### XENA

| Veld | Waarde |
|------|--------|
| **Type** | Document Management System |
| **Classificatie** | BBN2 (M-H-H) |
| **Architectuur** | Common Ground |
| **SCB** | [[Documentatie/SCB/SCB-XENA\|SCB-XENA]] |

**Componenten:**
```dataview
LIST
FROM "Components"
WHERE contains(system, "XENA")
```

→ [[Systems/XENA|Open XENA]]

---

### ZGW

| Veld | Waarde |
|------|--------|
| **Type** | Zaakgericht Werken Platform |
| **Classificatie** | BBN2 |
| **Architectuur** | ZGW API standaard |

**Componenten:**
```dataview
LIST
FROM "Components"
WHERE contains(system, "ZGW")
```

→ [[Systems/ZGW|Open ZGW]]

---

## Nieuw System Toevoegen

1. Maak een System document via [[Templates/System Template|System Template]]
2. Voer een SCB analyse uit via [[Templates/SCB Template|SCB Template]]
3. Registreer componenten via [[Templates/Component Template|Component Template]]
4. Volg de [[Documentatie/System Onboarding Guide|System Onboarding Guide]]

---

## Gerelateerde Secties

- [[Components/_index|🔧 Components]] — Technische bouwstenen
- [[Implementations/_index|⚙️ Implementations]] — Control implementaties
- [[Documentatie/SCB/SCB-XENA|📋 SCB-XENA]] — Voorbeeld System Component Breakdown
