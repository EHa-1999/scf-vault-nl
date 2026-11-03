---
type: index
name: "CIS Controls"
icon: "🛡️"
created: 2026-01-28
modified: 2026-01-29
---

# 🛡️ CIS Controls v8

> 153 security controls van het Center for Internet Security — de industriestandaard voor cyber hygiene.

---

## Navigatie

| ← Terug | Omhoog | Gerelateerd |
|---------|--------|-------------|
| [[Controls/_index\|📋 Controls]] | [[README\|🏠 Home]] | [[Controls/EXT-P/_index\|🔐 Privacy Controls]] |

---

## Overzicht

| Statistiek | Waarde |
|------------|--------|
| **Totaal Controls** | 153 |
| **Baseline** | 93 (61%) |
| **Niet-baseline** | 60 (39%) |
| **Categorieën** | 18 |

---

## Per Categorie

### CIS 1: Inventarisatie en Beheer van Bedrijfsmiddelen
*Asset inventaris, detectie, DHCP logging*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 1"
SORT id ASC
```

---

### CIS 2: Inventarisatie en Beheer van Software
*Software inventaris, whitelisting, scripts*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 2"
SORT id ASC
```

---

### CIS 3: Gegevensbescherming
*Classificatie, encryptie, DLP, bewaartermijnen*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 3"
SORT id ASC
```

---

### CIS 4: Veilige Configuratie van Systemen en Software
*Hardening, firewalls, sessievergrendeling*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 4"
SORT id ASC
```

---

### CIS 5: Accountbeheer
*Accountinventaris, wachtwoorden, serviceaccounts*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 5"
SORT id ASC
```

---

### CIS 6: Toegangsbeheer
*Toegangsverlening, MFA, RBAC*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 6"
SORT id ASC
```

---

### CIS 7: Continu Kwetsbaarheidsbeheer
*Vulnerability scanning, patching, herstel*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 7"
SORT id ASC
```

---

### CIS 8: Auditlog Beheer
*Logging, SIEM, bewaartermijnen*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 8"
SORT id ASC
```

---

### CIS 9: E-mail en Webbrowser Beveiliging
*DNS filtering, DMARC, URL filters*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 9"
SORT id ASC
```

---

### CIS 10: Malware Bescherming
*Anti-malware, signatures, gedragsdetectie*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 10"
SORT id ASC
```

---

### CIS 11: Gegevensherstel
*Backup, recovery, testen*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 11"
SORT id ASC
```

---

### CIS 12: Netwerkinfrastructuur Beheer
*Netwerkarchitectuur, segmentatie, remote access*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 12"
SORT id ASC
```

---

### CIS 13: Netwerkmonitoring en Verdediging
*IDS/IPS, netflow, alerting*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 13"
SORT id ASC
```

---

### CIS 14: Security Awareness en Training
*Bewustwording, phishing, rolspecifieke training*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 14"
SORT id ASC
```

---

### CIS 15: Leveranciersbeheer
*Leveranciersinventaris, contracten, monitoring*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 15"
SORT id ASC
```

---

### CIS 16: Applicatiebeveiliging
*Secure development, SAST, pentesting*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 16"
SORT id ASC
```

---

### CIS 17: Incidentrespons Beheer
*CSIRT, procedures, oefeningen*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 17"
SORT id ASC
```

---

### CIS 18: Penetratietesten
*Externe/interne pentests, validatie*

```dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  control_name as "Control",
  choice(baseline, "✓", "") as "BL"
FROM "Controls/CIS"
WHERE category = "CIS 18"
SORT id ASC
```

---

## Relatie met Frameworks

| Framework | Dekking |
|-----------|---------|
| [[Frameworks/ISO-27001-2022\|ISO 27001:2022]] | Technische controls (A.8) |
| [[Frameworks/NIS2\|NIS2]] | Art. 21(2) maatregelen |
| [[Frameworks/BIO2\|BIO2]] | Hoofdstuk 5-12 |
| [[Frameworks/NIST-CSF\|NIST CSF]] | Alle functies |

---

## Gerelateerde Documenten

- [[Frameworks/CIS-Controls-v8|CIS Controls v8 Framework]]
- [[Dashboards/Baseline Dashboard|Baseline Dashboard]]
- [[Documentatie/CIS Benchmark Handleiding|CIS Benchmark Mapping Guide]]
