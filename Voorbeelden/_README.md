---
id: "Voorbeelden-README"
type: documentation
name: "Voorbeelden - Gelaagd Assessment Model"
created: 2026-02-05
modified: 2026-02-05
tags:
  - documentation
  - voorbeeld
  - assessment
  - audit
---

# Voorbeelden: Gelaagd Assessment Model

## Waarom dit Model?

Het oorspronkelijke self-assessment model (v3.7 en eerder) werkte op het niveau van CIS Controls: "Is CIS-3.6 geïmplementeerd? Ja/Nee/Deels." Dit gaf een globaal beeld maar miste de technische diepgang om hardening-claims daadwerkelijk te onderbouwen.

Met de introductie van CIS/EXT Benchmark checklists in v3.5-3.7 (met in totaal 535 recommendations over 6 benchmarks) ontstond een fundamentele mismatch: de benchmarks bevatten gedetailleerde recommendation-voor-recommendation checklists, maar het self-assessment verwees hier niet naar. Het assessment beoordeelde op één abstractieniveau; de benchmarks boden een heel ander detailniveau.

Daarnaast was het onpraktisch dat één assessment-document alle componenten probeerde te dekken. De DBA die PostgreSQL beheert is niet dezelfde specialist als de platform engineer die Kubernetes configureert of de Linux-beheerder die RHEL hardeningt.

## Het Gelaagde Model

De oplossing is een **drielaags assessment-model** dat de benchmark checklists direct integreert in het auditproces:

```
Laag 3: Audit Dossier
         ↑ verifieert
Laag 2: Systeem Assessment (aggregerend)
         ↑ aggregeert scores uit
Laag 1: Component Assessments (technisch detail)
         ↑ gebaseerd op
         CIS/EXT Benchmark Checklists
```

### Laag 1 — Component Assessment

Eén document per component, uitgevoerd door de technisch beheerder van dat component. Bevat een recommendation-voor-recommendation beoordeling op basis van de bijbehorende CIS of EXT benchmark.

**Voorbeeld:** [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-PostgreSQL|SA-2026-Q1-XENA-PostgreSQL]]

Kenmerken:
- Alle 78 PostgreSQL benchmark recommendations individueel beoordeeld
- Status per recommendation: ✅ Compliant / ⚠️ Partial / ❌ Non-Compliant / ➖ N/A / ☐ Niet beoordeeld
- Toelichting per sectie met bevindingen en context
- Evidence register per component
- Score berekening (conservatief en uitgebreid)
- Mapping naar CIS Controls die dit assessment onderbouwt
- Sign-off door assessor, component owner en system owner

**Naamconventie:** `SA-{YYYY}-{QX}-{SYSTEEM}-{COMPONENT}`

### Laag 2 — Systeem Assessment

Eén document per systeem, uitgevoerd door de system owner. Aggregeert de scores uit alle component assessments en beoordeelt daarnaast de systeem-brede controls die niet component-specifiek zijn.

**Voorbeeld:** [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA|SA-2026-Q1-XENA]]

Kenmerken:
- Overzichtstabel met scores per component (via Dataview of handmatig)
- Systeem-brede controls beoordeling (CIS 1, 5, 6, 11, 16 etc.)
- Gewogen overall score
- Top risico's geëxtraheerd uit component assessments
- Bevindingen die uit de aggregatie naar voren komen
- Link naar alle onderliggende component assessments

**Naamconventie:** `SA-{YYYY}-{QX}-{SYSTEEM}` (ongewijzigd)

### Laag 3 — Audit Dossier

Het audit dossier blijft de overkoepelende container. De auditor verifieert steekproefsgewijs de component assessments en vormt een onafhankelijk oordeel.

**Voorbeeld:** [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/_IA-2026-001-XENA|_IA-2026-001-XENA]]

---

## Folder Structuur

```
Audits/2026/IA-2026-001-XENA/
├── _IA-2026-001-XENA.md                        ← Audit dossier (Laag 3)
├── Self-Assessments/
│   ├── SA-2026-Q1-XENA.md                      ← Systeem assessment (Laag 2)
│   ├── SA-2026-Q1-XENA-PostgreSQL.md            ← Component: 78 recs (Laag 1)
│   ├── SA-2026-Q1-XENA-RHEL.md                  ← Component: 255 recs
│   ├── SA-2026-Q1-XENA-Kubernetes.md             ← Component: 124 recs
│   ├── SA-2026-Q1-XENA-NGINX.md                  ← Component: 52 recs
│   ├── SA-2026-Q1-XENA-MinIO.md                  ← Component: 11 recs
│   └── SA-2026-Q1-XENA-KeyCloak.md               ← Component: 15 recs
├── Bevindingen/
│   ├── FIND-2026-001.md
│   ├── FIND-2026-002.md
│   ├── FIND-2026-003.md
│   └── FIND-2026-004.md
└── Evidence/
    ├── (systeem-breed evidence)
    └── (component evidence via sub-mappen of referenties)
```

## Frontmatter Conventies

### Component Assessment

Het component assessment introduceert de volgende frontmatter-velden:

```yaml
assessment_level: component          # Nieuw: onderscheidt van system/domain
component: "[[Components/PostgreSQL]]"  # Nieuw: link naar component
benchmark: "[[Benchmarks/CIS/...]]"     # Nieuw: link naar benchmark
benchmark_version: "v1.0.0"
profile_applied: "Level 1"           # Welk CIS profiel is beoordeeld
total_recommendations: 78            # Totaal aantal recs in benchmark
compliant: 58                        # Aantal ✅
partial: 8                           # Aantal ⚠️
non_compliant: 3                     # Aantal ❌
not_applicable: 4                    # Aantal ➖
not_assessed: 5                      # Aantal ☐
score_percentage: 84                 # Berekende score
```

### Systeem Assessment (uitgebreid)

Het systeem assessment krijgt een extra veld:

```yaml
assessment_level: system             # Nieuw: expliciet system-level
component_assessments:               # Nieuw: links naar component assessments
  - "[[.../SA-2026-Q1-XENA-PostgreSQL]]"
  - "[[.../SA-2026-Q1-XENA-RHEL]]"
```

### Score Berekening

De score wordt als volgt berekend:

**Conservatief** (voor frontmatter `score_percentage`):
```
Score = Compliant / (Totaal − N/A − Niet beoordeeld) × 100%
```

**Uitgebreid** (voor rapportage):
```
Score = (Compliant + 0,5 × Partial) / (Totaal − N/A − Niet beoordeeld) × 100%
```

De conservatieve score wordt gebruikt in frontmatter zodat Dataview-aggregaties consistent zijn. Beide scores worden in de body van het document vermeld.

---

## Workflow

### Tijdlijn

```
Week 1-2:  Component assessments (parallel, door technisch beheerders)
Week 3:    System owner aggregeert naar systeem assessment
Week 4:    CISO review en sign-off
Week 5-6:  Auditor verifieert steekproefsgewijs
Week 7:    Bevindingen registreren, audit afronden
```

### Verantwoordelijkheden

| Rol | Verantwoordelijkheid |
|-----|---------------------|
| **Technisch Beheerder** | Voert component assessment uit voor eigen component(en) |
| **System Owner** | Coördineert component assessments, stelt systeem assessment op |
| **CISO** | Review en sign-off systeem assessment |
| **Interne Auditor** | Verifieert assessments, registreert bevindingen |

---

## Voorbeeld Bestanden in deze Map

| Bestand | Type | Beschrijving |
|---------|------|--------------|
| [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/_IA-2026-001-XENA\|_IA-2026-001-XENA]] | Audit Dossier | Overkoepelend audit dossier (Laag 3) |
| [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA\|SA-2026-Q1-XENA]] | Systeem Assessment | Aggregerend assessment met scores (Laag 2) |
| [[Voorbeelden/IA-2026-001-XENA-Voorbeeld/Self-Assessments/SA-2026-Q1-XENA-PostgreSQL\|SA-2026-Q1-XENA-PostgreSQL]] | Component Assessment | Volledig uitgewerkt PostgreSQL voorbeeld (Laag 1) |

---

## Integratie in de Vault

Om dit model in productie te nemen zijn de volgende stappen nodig:

1. **Template toevoegen** — Kopieer [[Templates/Component Assessment Template]] naar de Templates map
2. **Templater script uitbreiden** — Pas het "Nieuw Self-Assessment" script aan zodat het ook component assessments kan aanmaken
3. **LISA documentatie bijwerken** — Update [[Frameworks/LISA/7-LISA-Audits]] met de beschrijving van het gelaagde model
4. **Dashboards aanpassen** — Voeg component-level queries toe aan het [[Dashboards/Audit Dashboard]]
5. **Bestaand assessment migreren** — Vervang SA-2026-Q1-XENA door de nieuwe structuur

---

## Zie Ook

- [[Frameworks/LISA/7-LISA-Audits|LISA Audits Framework]]
- [[Dashboards/Audit Dashboard|Audit Dashboard]]
- [[Audits/README|Audits Handleiding]]
- [[Templates/Component Assessment Template|Component Assessment Template]]
