<%*
// LISA Audit Creator - Nieuwe Interne Audit
// Vereist: Templater plugin

// Vraag audit informatie
const year = await tp.system.prompt("Jaar", new Date().getFullYear().toString());
const auditNr = await tp.system.prompt("Audit nummer (bijv. 001)", "001");
const scope = await tp.system.prompt("Scope (bijv. XENA, Domeinen-Q1)", "");
const auditor = await tp.system.prompt("Auditor naam", "");

// Genereer ID
const auditId = `IA-${year}-${auditNr}-${scope.replace(/\s+/g, '-')}`;
const folderPath = `Audits/${year}/${auditId}`;

// Maak folder structuur
await app.vault.createFolder(folderPath);
await app.vault.createFolder(`${folderPath}/Self-Assessments`);
await app.vault.createFolder(`${folderPath}/Bevindingen`);
await app.vault.createFolder(`${folderPath}/Evidence`);

// Maak hoofdrapport
const today = tp.date.now("YYYY-MM-DD");
const reportContent = `---
id: "${auditId}"
type: internal-audit
name: "Interne Audit ${scope} ${year}"
scope: "${scope}"
audit_type: "Interne Audit"
period: "${year}"
status: Planning
auditor: "${auditor}"
audit_start_date: 
audit_end_date: 
report_date: 
overall_opinion: 
findings_critical: 0
findings_high: 0
findings_medium: 0
findings_low: 0
created: ${today}
modified: ${today}
tags:
  - internal-audit
  - ${year}
---

# Interne Audit: ${scope} - ${year}

## Audit Informatie

| Veld | Waarde |
|------|--------|
| **Audit ID** | ${auditId} |
| **Scope** | ${scope} |
| **Auditor** | ${auditor} |
| **Status** | Planning |

## Management Samenvatting

> *Nog in te vullen na afronding audit*

## Self-Assessments in Scope

\`\`\`dataview
TABLE WITHOUT ID
  link(file.link, id) as "Assessment",
  assessment_type as "Type",
  overall_score + "%" as "Score",
  status as "Status"
FROM "${folderPath}/Self-Assessments"
WHERE type = "self-assessment"
SORT file.name ASC
\`\`\`

## Bevindingen

### Overzicht

\`\`\`dataview
TABLE WITHOUT ID
  classification as "Ernst",
  length(rows) as "Aantal"
FROM "${folderPath}/Bevindingen"
WHERE type = "finding"
GROUP BY classification
\`\`\`

### Alle Bevindingen

\`\`\`dataview
TABLE WITHOUT ID
  link(file.link, id) as "ID",
  name as "Bevinding",
  classification as "Ernst",
  status as "Status"
FROM "${folderPath}/Bevindingen"
WHERE type = "finding"
SORT classification ASC
\`\`\`

## Conclusies & Aanbevelingen

> *Nog in te vullen*

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 0.1 | ${today} | ${auditor} | Audit dossier aangemaakt |
`;

await app.vault.create(`${folderPath}/_${auditId}.md`, reportContent);

// Open het nieuwe rapport
const file = app.vault.getAbstractFileByPath(`${folderPath}/_${auditId}.md`);
await app.workspace.getLeaf().openFile(file);

new Notice(`✅ Audit dossier aangemaakt: ${auditId}`);
-%>
