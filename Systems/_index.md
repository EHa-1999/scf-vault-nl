---
type: index
name: "Systems"
icon: "🖥️"
created: 2026-01-28
modified: 2026-02-10
---

# 🖥️ Systems

> Applicaties en platforms die onder het security framework vallen.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[README\|🏠 Home]] | — | [[Components/_index\|🔧 Components]] · [[Implementations/_index\|⚙️ Implementations]] |

---

## XENA Platform

Het XENA platform bestaat uit twee gerelateerde systemen voor gemeentelijk documentbeheer:

| Systeem | Volledige Naam | Scope |
|---------|----------------|-------|
| **[[Systems/XENA-NZGW\|XENA-NZGW]]** | XENA Niet-Zaakgericht Werken | Documentbeheer voor niet-zaakgerichte processen |
| **[[Systems/XENA-ZGW\|XENA-ZGW]]** | XENA Zaakgericht Werken | Centrale zaakafhandeling conform VNG API's |

### XENA-ZGW Componenten

| Component | Type | Benchmark Status |
|-----------|------|------------------|
| [[Components/Tezza\|Tezza]] | Frontend | 📋 EXT-BM-Tezza (gepland) |
| [[Components/Alfresco\|Alfresco]] | DMS | 📋 EXT-BM-Alfresco (gepland) |
| [[Components/PostgreSQL\|PostgreSQL]] | Database | ✅ CIS PostgreSQL 16 |
| [[Components/OpenZaak\|OpenZaak]] | API | 📋 EXT-BM-OpenZaak (gepland) |
| [[Components/GZAC\|GZAC]] | Process | 📋 EXT-BM-GZAC (gepland) |
| [[Components/ActiveMQ\|ActiveMQ]] | Messaging | 📋 EXT-BM-ActiveMQ (gepland) |
| [[Components/RabbitMQ\|RabbitMQ]] | Messaging | 📋 EXT-BM-RabbitMQ (gepland) |

---

## Overige Systemen

| Systeem | Classificatie | Eigenaar | Status |
|---------|--------------|----------|--------|
| [[Systems/E-mail-Archief\|E-mail Archief]] | BBN2 | Team Informatiebeheer | Production |

---

## Alle Systems (Dataview)

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

## Nieuw System Toevoegen

1. Maak een System document via [[Templates/System Template|System Template]]
2. Voer een SCB analyse uit via [[Templates/SCB Template|SCB Template]]
3. Registreer componenten via [[Templates/Component Template|Component Template]]
4. Volg de [[Documentatie/System Onboarding Guide|System Onboarding Guide]]

---

## Gerelateerde Secties

- [[Components/_index|🔧 Components]] — Technische bouwstenen
- [[Implementations/_index|⚙️ Implementations]] — Control implementaties
- [[Benchmarks/_index|📏 Benchmarks]] — Security configuration guides
