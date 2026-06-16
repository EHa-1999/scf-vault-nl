# Assessment Templates

Deze map bevat Excel macro-enabled templates (.xlsm) voor security assessments.

## Gebruik

1. Open de relevante `.xlsm` template
2. Klik "Enable Macros" als Excel daarom vraagt
3. Vul het **Assessment** tabblad in met status per maatregel
4. Ga naar het **Export** tabblad
5. Vul de metadata in (Assessor, Systeem, Omgeving, Datum)
6. Klik op **"Exporteer naar Vault"**
7. Sla op in: `Assessments/Results/`

## Bestandsnaam

De macro suggereert automatisch:
```
Assessment-{Component}-Results-YYYY-MM-DD-HH-MM.md
```

## Templates

| Template | Component | Maatregelen | Baseline |
|----------|-----------|-------------|----------|
| Assessment-RabbitMQ.xlsm | RabbitMQ | 20 | 15 |
| Assessment-ActiveMQ.xlsm | ActiveMQ | 20 | 17 |
| Assessment-Alfresco.xlsm | Alfresco | 21 | 20 |
| Assessment-OpenZaak.xlsm | OpenZaak | 21 | 19 |
| Assessment-GZAC.xlsm | GZAC | 19 | 17 |

## VBA Module Update

Als je de macro moet aanpassen:
1. Bewerk `SCF_Export_Module.bas`
2. Importeer in een template via VBA Editor (Alt+F11 → File → Import)
3. Sla op als .xlsm

Zie [[Assessments/TEMPLATE_DOCUMENTATION|Technische Documentatie]] voor details.
