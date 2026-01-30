---
type: index
name: "Dashboards"
icon: "📊"
created: 2026-01-28
---

# 📊 Dashboards

> Overzichten, KPI's en monitoring — alles op één plek.

---

## Navigatie

| ← Terug | Omhoog |
|---------|--------|
| [[README\|🏠 Home]] | — |

---

## Beschikbare Dashboards

| Dashboard | Doel | Doelgroep |
|-----------|------|-----------|
| [[Dashboards/Main Dashboard\|🏠 Main Dashboard]] | Centraal overzicht van alles | Iedereen |
| [[Dashboards/Executive Summary\|📈 Executive Summary]] | KPI's voor management | Management, CISO |
| [[Dashboards/Implementatie Dashboard\|🚀 Implementatie Dashboard]] | **Voortgang installatie controls** | Security Team, CISO |
| [[Dashboards/Compliance Dashboard\|✅ Compliance Dashboard]] | **Status naleving na validatie** | Compliance Officer, Audit |
| [[Dashboards/Baseline Dashboard\|🔒 Baseline Dashboard]] | Comply or Explain monitoring | Security Officer, CISO |
| [[Dashboards/Implementation Tracker\|📦 Implementation Tracker]] | Voortgang per component | Security Team |
| [[Dashboards/Risk Dashboard\|⚠️ Risk Dashboard]] | Risico overzicht | Risk Manager |
| [[Dashboards/Audit Dashboard\|🔍 Audit Dashboard]] | Audits en bevindingen | Internal Audit |

---

## ⭐ Twee Score Model

De vault hanteert **twee aparte scores**:

| Score | Vraag | Dashboard |
|-------|-------|-----------|
| **🚀 Implementatie** | Is de control geïnstalleerd? | [[Dashboards/Implementatie Dashboard\|Implementatie]] |
| **✅ Compliance** | Voldoet het aan de norm? | [[Dashboards/Compliance Dashboard\|Compliance]] |

> **Workflow:** Gepland → In uitvoering → Gereed → **Gevalideerd** → Compliance Assessment

---

## Per Rol

### Voor Management / CISO

Start met het **Executive Summary** voor een high-level overzicht:

→ [[Dashboards/Executive Summary|📈 Executive Summary]]

Daarna specifiek naar **Baseline Compliance** voor comply-or-explain status:

→ [[Dashboards/Baseline Dashboard|🔒 Baseline Dashboard]]

---

### Voor Security Officer

Dagelijkse monitoring via:

→ [[Dashboards/Main Dashboard|🏠 Main Dashboard]]  
→ [[Dashboards/Implementation Tracker|✅ Implementation Tracker]]

---

### Voor Compliance Officer

Framework-specifieke status:

→ [[Dashboards/Compliance Dashboard|📋 Compliance Dashboard]]

---

### Voor Risk Manager

Risico register en behandelplannen:

→ [[Dashboards/Risk Dashboard|⚠️ Risk Dashboard]]

---

### Voor Internal Audit

Audit dossiers en bevindingen:

→ [[Dashboards/Audit Dashboard|🔍 Audit Dashboard]]

---

## Vereiste Plugin

> [!warning] Dataview Vereist
> Alle dashboards gebruiken de **Dataview** plugin voor dynamische tabellen.
> 
> Installeer via: Instellingen → Community Plugins → Browse → "Dataview"
