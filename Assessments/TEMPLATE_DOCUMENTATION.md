# Assessment Template Technische Documentatie

> Technische specificaties voor het onderhouden en uitbreiden van de Excel assessment templates met VBA export macro.

---

## Overzicht

De assessment templates zijn `.xlsm` bestanden (Excel Macro-Enabled Workbooks) die:
1. Assessors in staat stellen om component security assessments uit te voeren
2. Automatisch scores berekenen via Excel formules
3. Resultaten exporteren naar Markdown via een VBA macro

---

## Template Structuur

### Verplichte Sheets

Elke template **moet** exact deze 4 sheets bevatten met deze namen:

| Sheet # | Naam | Functie |
|---------|------|---------|
| 1 | `Instructions` | Uitleg en metadata |
| 2 | `Assessment` | Maatregelen en status |
| 3 | `Summary Dashboard` | Automatische scores |
| 4 | `Export` | Metadata invoer en export knop |

> ⚠️ De VBA macro verwijst naar deze sheet namen. Wijzigen breekt de export functionaliteit.

---

## Assessment Sheet Structuur

### Kolom Layout (Vast)

De macro verwacht deze exacte kolom volgorde:

| Kolom | Letter | Inhoud | Gebruikt door Macro |
|-------|--------|--------|---------------------|
| 1 | A | ID | ✅ Ja (voor output) |
| 2 | B | Level | Nee |
| 3 | C | Baseline | Nee |
| 4 | D | CIS Controls | Nee |
| 5 | E | Control Title | ✅ Ja (voor output) |
| 6 | F | Control Description | Nee |
| 7 | G | Audit Procedure | Nee |
| 8 | H | Expected Config | Nee |
| 9 | I | Status | ✅ Ja (filter criterium) |
| 10 | J | Evidence Location | Nee |
| 11 | K | Comments | ✅ Ja (voor output) |
| 12 | L | Responsible Party | ✅ Ja (voor output) |

### Dynamisch Aantal Rijen

De macro bepaalt dynamisch het aantal maatregelen:

```vba
lastRow = wsAssess.Cells(wsAssess.Rows.Count, "A").End(xlUp).row
For row = 2 To lastRow
    ' ... verwerk elke maatregel
Next row
```

Dit betekent:
- ✅ Werkt met elk aantal maatregelen (10, 50, 200, etc.)
- ✅ Secties (headers) worden automatisch overgeslagen
- ⚠️ Rij 1 moet de header rij zijn
- ⚠️ Geen lege rijen tussen maatregelen

---

## Export Sheet Structuur

### Metadata Cellen (Vast)

| Cel | Inhoud | Verplicht |
|-----|--------|-----------|
| B5 | Assessor | ✅ Ja |
| B6 | Systeem | Nee |
| B7 | Omgeving | Nee |
| B8 | Assessment Datum | ✅ Ja |
| B9 | Goedgekeurd door | Nee |

### Export Knop

De knop moet gekoppeld zijn aan de macro `ExportToVault`:
- Positie: Ergens zichtbaar op het Export sheet
- OnAction: `ExportToVault`

---

## Summary Dashboard Structuur

### Score Cellen (Vast)

De macro leest scores uit deze specifieke cellen:

| Cel | Inhoud |
|-----|--------|
| B6 | Totaal Maatregelen |
| B10 | Baseline Maatregelen |
| B14 | Compliant count |
| B15 | Partial count |
| B16 | Non-Compliant count |
| B17 | N/A count |
| B20 | Baseline Compliant |
| B21 | Baseline Partial |
| B22 | Baseline Non-Compliant |
| B23 | Baseline N/A |
| B27 | Total Score % |
| B28 | Baseline Score % |

> ⚠️ Als je de Summary Dashboard layout wijzigt, moet je ook de VBA macro aanpassen.

---

## VBA Macro Structuur

### Module: SCF_Export_Module

```
SCF_Export_Module.bas
├── ExportToVault()           ' Hoofd export functie (public)
├── GetComponentName()        ' Haalt component naam uit Instructions sheet
├── BuildMarkdownContent()    ' Bouwt de volledige Markdown string
├── BuildNonCompliantSection()' Genereert tabel met non-compliant items
├── BuildPartialSection()     ' Genereert tabel met partial items
└── CreateExportButton()      ' Helper om knop aan te maken (eenmalig)
```

### Component Naam Detectie

De macro haalt de component naam uit cel A1 van Instructions:

```vba
' Verwacht formaat: "SECURITY SELF-ASSESSMENT: ComponentName"
title = wsInstr.Range("A1").Value
GetComponentName = Trim(Split(title, ":")(1))
```

---

## Nieuwe Template Toevoegen

### Stap 1: Genereer XLSX

Voeg de benchmark toe aan `generate_assessments_v3.py`:

```python
BENCHMARKS = {
    # ... bestaande benchmarks ...
    'NieuweComponent': {
        'version': '1.0',
        'source': 'docs.example.com',
        'intro': 'Beschrijving van de component...',
        'recommendations': [
            {
                'section': '1. Authentication',
                'items': [
                    ('NC-1.1', 'L1', 'Titel', 'Beschrijving', 
                     'Audit procedure', 'Verwachte config',
                     ['CIS-5.1', 'CIS-6.1']),  # CIS mappings
                ]
            },
        ]
    },
}
```

### Stap 2: Genereer Templates

```bash
python3 generate_assessments_v3.py
```

### Stap 3: Converteer naar XLSM

```bash
python3 convert_to_xlsm.py
```

Dit injecteert automatisch de VBA macro uit de bestaande template.

---

## VBA Macro Aanpassen

### Locatie van de Broncode

De VBA code zit embedded in de `.xlsm` bestanden. Om te bewerken:

1. Open een `.xlsm` in Excel
2. Druk `Alt+F11` om VBA Editor te openen
3. Bewerk de module `SCF_Export_Module`
4. Sla op

### Broncode Backup

Exporteer de module als `.bas` bestand:
1. VBA Editor → Rechtsklik op module → Export File
2. Bewaar als `SCF_Export_Module.bas`

### Wijzigingen Doorvoeren naar Alle Templates

Na het wijzigen van de macro in één template:

1. Exporteer de gewijzigde `vbaProject.bin`:
   ```bash
   unzip -o Template-Gewijzigd.xlsm xl/vbaProject.bin -d /tmp/
   ```

2. Update `convert_to_xlsm.py` om deze nieuwe `vbaProject.bin` te gebruiken

3. Regenereer alle templates:
   ```bash
   python3 generate_assessments_v3.py
   python3 convert_to_xlsm.py
   ```

---

## Troubleshooting

### "Macro's zijn uitgeschakeld"

Excel blokkeert standaard macro's. Oplossingen:
- Klik "Enable Content" in de gele balk
- Of: File → Options → Trust Center → Macro Settings

### Export knop werkt niet

1. Controleer of macro's zijn ingeschakeld
2. Open VBA Editor (`Alt+F11`) en controleer of module bestaat
3. Controleer of knop gekoppeld is aan `ExportToVault`

### Verkeerde data in export

Controleer of:
- Sheet namen exact kloppen (hoofdlettergevoelig)
- Kolom volgorde in Assessment sheet correct is
- Cel posities in Summary Dashboard kloppen

### "Subscript out of range" error

De component naam kon niet worden geëxtraheerd. Controleer:
- Cel A1 in Instructions bevat `: ` (dubbele punt + spatie)
- Formaat: `SECURITY SELF-ASSESSMENT: ComponentNaam`

---

## Bestandsstructuur

```
Assessments/
├── _index.md                    # Overzicht pagina
├── Templates/
│   ├── Assessment-RabbitMQ.xlsm
│   ├── Assessment-ActiveMQ.xlsm
│   ├── Assessment-Alfresco.xlsm
│   ├── Assessment-OpenZaak.xlsm
│   └── Assessment-GZAC.xlsm
├── Results/
│   ├── _index.md                # Dataview dashboards
│   └── *.md                     # Geëxporteerde resultaten
└── TEMPLATE_DOCUMENTATION.md    # Dit bestand
```

---

## Versie Geschiedenis

| Versie | Datum | Wijziging |
|--------|-------|-----------|
| 1.0 | 2026-02-11 | Initiële versie met VBA export |


---

## Bestandsnaam Conventie

### Aanbevolen formaat
```
Assessment-{Component}-Results-YYYY-MM-DD-HH-MM.md
```

Voorbeeld: `Assessment-RabbitMQ-Results-2026-02-11-14-30.md`

### Locatie
Exporteer naar: `Assessments/Results/`

De Dataview queries in `Assessments/Results/_index.md` aggregeren automatisch alle bestanden met `type: assessment-result` in de frontmatter.

---

## Macro Aanpassen (Bestandsnaam)

Om de voorgestelde bestandsnaam in de macro aan te passen:

1. Open de `.xlsm` template
2. Druk `Alt+F11` (VBA Editor)
3. Open module `SCF_Export_Module`
4. Zoek de regel met `suggestedName = `
5. Pas het formaat aan:

```vba
' Huidige formaat:
suggestedName = "Assessment-" & componentName & "-Results-" & _
                Format(Now, "YYYY-MM-DD-HH-MM") & ".md"
```

6. Sla op en sluit VBA Editor

---

## Nieuwe Templates Genereren (voor beheerders)

### Vereisten
- Python 3.x
- openpyxl library
- Een werkende `.xlsm` template als basis

### Stappen

1. **Genereer xlsx bestanden:**
```bash
python3 generate_assessments_v3.py
```

2. **Recalculeer formules:**
```bash
for file in Assessments/Templates/*.xlsx; do
    python3 recalc.py "$file" 30
done
```

3. **Converteer naar xlsm met macro:**
```bash
python3 convert_to_xlsm_v2.py
```

### Belangrijke bestanden

| Bestand | Functie |
|---------|---------|
| `generate_assessments_v3.py` | Genereert xlsx met data en formules |
| `convert_to_xlsm_v2.py` | Converteert xlsx naar xlsm, injecteert VBA |
| Basis `.xlsm` template | Bron voor VBA macro en button |

### Nieuwe benchmark toevoegen

1. Voeg benchmark data toe aan `BENCHMARKS` dict in `generate_assessments_v3.py`
2. Voer bovenstaande stappen uit
3. De nieuwe template krijgt automatisch de VBA macro

