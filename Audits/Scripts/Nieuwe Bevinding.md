<%*
// LISA Audit Creator - Nieuwe Bevinding
// Voer uit vanuit een bestaand audit dossier

// Bepaal huidige audit folder
const currentPath = tp.file.folder(true);
if (!currentPath.includes("Audits/")) {
  new Notice("❌ Open dit script vanuit een audit dossier");
  return;
}

// Extract year uit path
const pathParts = currentPath.split("/");
const year = pathParts.find(p => /^\d{4}$/.test(p)) || new Date().getFullYear().toString();

// Bepaal volgend finding nummer (simpele telling)
const auditRoot = currentPath.split("/Bevindingen")[0].split("/Self-Assessments")[0];
const findingsFolder = `${auditRoot}/Bevindingen`;

// Tel bestaande bevindingen
let findingNr = 1;
try {
  const folder = app.vault.getAbstractFileByPath(findingsFolder);
  if (folder && folder.children) {
    findingNr = folder.children.filter(f => f.name.startsWith("FIND-")).length + 1;
  }
} catch(e) {}

const findingNrStr = findingNr.toString().padStart(3, '0');

// Vraag bevinding informatie
const name = await tp.system.prompt("Bevinding titel");

const classification = await tp.system.suggester(
  ["🔴 Kritiek", "🟠 Hoog", "🟡 Medium", "🟢 Laag", "ℹ️ Observatie"],
  ["Critical", "High", "Medium", "Low", "Observation"]
);

const owner = await tp.system.prompt("Eigenaar (verantwoordelijke voor actie)");

// Bereken default deadline op basis van classificatie
const today = new Date();
let deadlineDays;
switch(classification) {
  case "Critical": deadlineDays = 7; break;
  case "High": deadlineDays = 30; break;
  case "Medium": deadlineDays = 90; break;
  default: deadlineDays = 180;
}
const deadline = new Date(today.getTime() + deadlineDays * 24 * 60 * 60 * 1000);
const deadlineStr = deadline.toISOString().split('T')[0];

const linkedControl = await tp.system.prompt("Gerelateerde Control (bijv. CIS-8.2)", "");

// Genereer ID
const findingId = `FIND-${year}-${findingNrStr}`;
const todayStr = tp.date.now("YYYY-MM-DD");

// Maak content
const content = `---
id: "${findingId}"
type: finding
name: "${name}"
classification: ${classification}
status: Open
audit: "[[${auditRoot.split('/').pop()}]]"
linked_controls: [${linkedControl ? '"' + linkedControl + '"' : ''}]
linked_implementations: []
root_cause: ""
identified_date: ${todayStr}
due_date: ${deadlineStr}
closed_date: 
owner: "${owner}"
action_id: ""
created: ${todayStr}
modified: ${todayStr}
tags:
  - finding
  - ${classification.toLowerCase()}
  - ${year}
---

# Bevinding: ${findingId}

## Bevinding Informatie

| Veld | Waarde |
|------|--------|
| **ID** | ${findingId} |
| **Titel** | ${name} |
| **Classificatie** | ${classification} |
| **Status** | Open |
| **Eigenaar** | ${owner} |
| **Deadline** | ${deadlineStr} |

## Beschrijving

### Situatie (Ist)

> Beschrijf de huidige situatie zoals aangetroffen.

### Norm (Soll)

> Beschrijf de verwachte situatie conform de control/standaard.
${linkedControl ? `\nZie: [[Controls/CIS/${linkedControl}]]` : ''}

### Gap

> Beschrijf het verschil tussen Ist en Soll.

## Impact

| Aspect | Impact | Toelichting |
|--------|--------|-------------|
| Beschikbaarheid | ☐ Hoog ☐ Midden ☐ Laag ☐ Geen | |
| Integriteit | ☐ Hoog ☐ Midden ☐ Laag ☐ Geen | |
| Vertrouwelijkheid | ☐ Hoog ☐ Midden ☐ Laag ☐ Geen | |

## Root Cause

> Wat is de onderliggende oorzaak?

- [ ] Proces niet gedefinieerd
- [ ] Proces niet gevolgd
- [ ] Technische beperking
- [ ] Resource beperking
- [ ] Kennis/training gap
- [ ] Anders: 

## Verbeteractie

### Beschrijving

> Welke actie is nodig om de bevinding op te lossen?

### Acceptatie Criteria

- [ ] 
- [ ] 

## Evidence

| Type | Beschrijving | Locatie |
|------|--------------|---------|
| | | |

## Verificatie

| Veld | Waarde |
|------|--------|
| Verificatie datum | |
| Geverifieerd door | |
| Resultaat | ☐ Gesloten ☐ Deels opgelost ☐ Niet opgelost |

## Status Historie

| Datum | Status | Toelichting | Door |
|-------|--------|-------------|------|
| ${todayStr} | Open | Bevinding geregistreerd | |
`;

// Maak bestand
const targetFolder = currentPath.includes("/Bevindingen") 
  ? currentPath 
  : `${auditRoot}/Bevindingen`;
const filePath = `${targetFolder}/${findingId}.md`;
await app.vault.create(filePath, content);

// Open het nieuwe bestand
const file = app.vault.getAbstractFileByPath(filePath);
await app.workspace.getLeaf().openFile(file);

new Notice(`✅ Bevinding aangemaakt: ${findingId}`);
-%>
