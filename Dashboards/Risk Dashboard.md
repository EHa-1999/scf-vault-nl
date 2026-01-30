---
type: dashboard
name: "Risk Dashboard"
created: 2026-01-27
tags:
  - dashboard
  - risk
---

# ⚠️ Risk Dashboard

## Risico Heatmap

| Impact ↓ / Likelihood → | 1 (Zeer laag) | 2 (Laag) | 3 (Medium) | 4 (Hoog) | 5 (Zeer hoog) |
|-------------------------|---------------|----------|------------|----------|---------------|
| **5 (Kritiek)** | 5 🟡 | 10 🟠 | 15 🔴 | 20 🔴 | 25 🔴 |
| **4 (Hoog)** | 4 🟢 | 8 🟡 | 12 🟠 | 16 🔴 | 20 🔴 |
| **3 (Medium)** | 3 🟢 | 6 🟡 | 9 🟡 | 12 🟠 | 15 🔴 |
| **2 (Laag)** | 2 🟢 | 4 🟢 | 6 🟡 | 8 🟡 | 10 🟠 |
| **1 (Zeer laag)** | 1 🟢 | 2 🟢 | 3 🟢 | 4 🟢 | 5 🟡 |

## Actuele Risico's per Niveau

### 🔴 Kritieke Risico's (Level 5)

```dataview
TABLE 
  name as "Risico",
  inherent_risk as "Inherent",
  residual_risk as "Residueel",
  status as "Status"
FROM "Risks"
WHERE risk_level = 5
SORT inherent_risk DESC
```

### 🟠 Hoge Risico's (Level 4)

```dataview
TABLE 
  name as "Risico",
  inherent_risk as "Inherent",
  residual_risk as "Residueel",
  status as "Status"
FROM "Risks"
WHERE risk_level = 4
SORT inherent_risk DESC
```

### 🟡 Medium Risico's (Level 3)

```dataview
TABLE 
  name as "Risico",
  inherent_risk as "Inherent",
  residual_risk as "Residueel",
  status as "Status"
FROM "Risks"
WHERE risk_level = 3
SORT inherent_risk DESC
```

## Risico Behandeling Status

```dataview
TABLE WITHOUT ID
  status as "Status",
  length(rows) as "Aantal"
FROM "Risks"
GROUP BY status
```

## Top Risico's per Systeem

```dataview
TABLE 
  name as "Risico",
  risk_level as "Niveau",
  status as "Status"
FROM "Risks"
FLATTEN systems as sys
GROUP BY sys
SORT rows[0].risk_level DESC
```

## Risico's zonder Mitigatie

```dataview
LIST
FROM "Risks"
WHERE status = "Open"
SORT risk_level DESC
```
