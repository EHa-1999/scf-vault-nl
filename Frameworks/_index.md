---
type: index
name: "Frameworks"
icon: "🏛️"
created: 2026-01-28
---

# 🏛️ Governance Frameworks

> Van strategische kaders naar operationele controls — dit is waar compliance begint.

![[Assets/diagrams/LISA-Governance-Hierarchy.svg]]

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[README\|🏠 Home]] | — | [[Controls/_index\|📋 Controls]] |

---

## Wat vind je hier?

Deze map bevat de **governance laag** van het LISA framework: de strategische kaders en wettelijke vereisten waaraan de organisatie moet voldoen. Elk framework document beschrijft het kader, de scope, en hoe het doorwerkt naar concrete controls.

### LISA Framework Documentatie

Het LISA framework zelf is uitgebreid gedocumenteerd in een eigen submap:

```dataview
TABLE WITHOUT ID
  link(file.link, file.name) as "Document",
  substring(file.name, 0, 1) as "#"
FROM "Frameworks/LISA"
SORT file.name ASC
```

→ **Start hier:** [[Frameworks/LISA/1-LISA-Introductie|LISA Introductie]]

---

### Externe Frameworks

| Framework | Type | Scope | Status |
|-----------|------|-------|--------|
| [[Frameworks/ISO-27001-2022\|ISO 27001:2022]] | Certificering | Informatiebeveiliging | ✅ Actief |
| [[Frameworks/NIS2\|NIS2 Richtlijn]] | Wetgeving EU | Netwerk & Informatie | ✅ Actief |
| [[Frameworks/BIO2\|BIO2]] | Overheidsstandaard | Baseline Overheid | ✅ Actief |
| [[Frameworks/AVG-GDPR\|AVG/GDPR]] | Wetgeving EU | Privacy | ✅ Actief |
| [[Frameworks/NIST-CSF\|NIST CSF]] | Best Practice | Cyber Security | 📚 Referentie |
| [[Frameworks/CIS-Controls-v8\|CIS Controls v8]] | Best Practice | Technische Controls | ✅ Actief |

---

### Security Requirements (SR)

De 13 Security Requirements vormen de brug tussen frameworks en controls:

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  name as "Security Requirement"
FROM "Frameworks/Security-Requirements"
WHERE type = "security-requirement"
SORT id ASC
```

---

## Hoe werkt de hiërarchie?

```
Frameworks (strategisch)
    ↓ definieert vereisten voor
Security Requirements (tactisch)  
    ↓ worden ingevuld door
Controls (operationeel)
    ↓ worden geïmplementeerd als
Implementations (technisch)
```

**Voorbeeld:** 
- **NIS2 Art. 21(2)(d)** vereist incident response
- Dit valt onder **SR-12: Incident Response**
- Wat leidt tot controls **CIS-17.1** t/m **CIS-17.9**
- Geïmplementeerd in **IMPL-XENA-NiFi-17.3** etc.

---

## Gerelateerde Dashboards

- [[Dashboards/Compliance Dashboard|📊 Compliance per Framework]]
- [[Dashboards/Baseline Dashboard|🔒 Baseline Compliance]]

---

## Alle bestanden in deze map

```dataview
LIST
FROM "Frameworks"
WHERE file.name != "_index"
SORT file.name ASC
```
