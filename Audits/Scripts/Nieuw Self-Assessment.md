<%*
// LISA Audit Creator - Nieuw Self-Assessment
// Voer uit vanuit een bestaand audit dossier

// Bepaal huidige audit folder
const currentPath = tp.file.folder(true);
if (!currentPath.includes("Audits/")) {
  new Notice("❌ Open dit script vanuit een audit dossier");
  return;
}

// Extract audit info uit path
const pathParts = currentPath.split("/");
const year = pathParts.find(p => /^\d{4}$/.test(p)) || new Date().getFullYear().toString();
const auditFolder = pathParts.find(p => p.startsWith("IA-")) || currentPath;

// Vraag assessment informatie
const assessmentType = await tp.system.suggester(
  ["Systeem Assessment", "Domein Assessment"],
  ["system", "domain"]
);

let scope, cis_categories;
if (assessmentType === "system") {
  scope = await tp.system.suggester(
    ["XENA", "ZGW", "E-mail-Archief", "Anders..."],
    ["XENA", "ZGW", "E-mail-Archief", "custom"]
  );
  if (scope === "custom") {
    scope = await tp.system.prompt("Systeem naam");
  }
  cis_categories = "1-6, 8-11, 16";
} else {
  scope = await tp.system.suggester(
    ["Infrastructuur", "Security-Awareness", "Incident-Response", "Leveranciers", "Pentesting", "Anders..."],
    ["Infrastructuur", "Security-Awareness", "Incident-Response", "Leveranciers", "Pentesting", "custom"]
  );
  if (scope === "custom") {
    scope = await tp.system.prompt("Domein naam");
  }
  cis_categories = assessmentType === "domain" ? "7, 12-15, 17-18" : "";
}

const quarter = await tp.system.suggester(
  ["Q1", "Q2", "Q3", "Q4", "Jaarlijks"],
  ["Q1", "Q2", "Q3", "Q4", "YEAR"]
);

const assessor = await tp.system.prompt("Assessor naam", "");

// Genereer ID
const saId = `SA-${year}-${quarter}-${scope}`;
const today = tp.date.now("YYYY-MM-DD");

// Bepaal doelmap
const targetFolder = currentPath.includes("/Self-Assessments") 
  ? currentPath 
  : `${currentPath}/Self-Assessments`;

// Maak content
const content = `---
id: "${saId}"
type: self-assessment
name: "Self-Assessment ${scope} ${quarter} ${year}"
system: "${assessmentType === 'system' ? '[[Systems/' + scope + ']]' : ''}"
domain: "${assessmentType === 'domain' ? scope : ''}"
assessment_type: ${assessmentType}
cis_categories: [${cis_categories}]
period: "${year}-${quarter}"
status: Draft
assessor: "${assessor}"
assessment_date: ${today}
review_date: 
sign_off_by: ""
sign_off_date: 
overall_score: 
created: ${today}
modified: ${today}
tags:
  - self-assessment
  - ${assessmentType}-assessment
  - ${year}
---

# Self-Assessment: ${scope} - ${quarter} ${year}

## Assessment Informatie

| Veld | Waarde |
|------|--------|
| **ID** | ${saId} |
| **Type** | ${assessmentType === 'system' ? 'Systeem' : 'Domein'} |
| **Scope** | ${scope} |
| **Periode** | ${quarter} ${year} |
| **Assessor** | ${assessor} |
| **Status** | Draft |

## Scope Beschrijving

> *Beschrijf hier de scope van dit assessment*

${assessmentType === 'system' ? `
## Baseline Controls Status

> [!warning] Comply or Explain
> Baseline controls moeten geïmplementeerd zijn óf een goedgekeurde exception hebben.

\`\`\`dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  status as "Status",
  choice(status = "Verified", "✅", 
    choice(status = "Implemented", "🟢",
      choice(status = "Partial", "⚠️ ACTIE",
        choice(status = "In Progress", "⚠️ ACTIE", "❌ ACTIE")))) as "●"
FROM "Implementations"
WHERE contains(file.name, "${scope}")
FLATTEN (this.file.frontmatter.control) as ctrl
WHERE ctrl.baseline = true
SORT id ASC
\`\`\`

## Beoordeelde Implementations

\`\`\`dataview
TABLE WITHOUT ID
  link(file.link, id) as "Implementation",
  control as "Control",
  status as "Status",
  choice(status = "Verified", "✅", 
    choice(status = "Implemented", "🟢",
      choice(status = "Partial", "🟡",
        choice(status = "In Progress", "🔵", "⚪")))) as "●"
FROM "Implementations"
WHERE contains(file.name, "${scope}")
SORT id ASC
\`\`\`
` : `
## Controls in Scope

CIS Categorieën: ${cis_categories}

### Baseline Controls in Scope

\`\`\`dataview
TABLE WITHOUT ID
  link(file.link, id) as "Control",
  control_name as "Naam",
  priority_label as "Prioriteit"
FROM "Controls/CIS"
WHERE baseline = true AND contains(string(category), regexreplace("${cis_categories}", ",\\\\s*", "|"))
SORT priority DESC
\`\`\`
`}

## Beoordeling

### Control Categorie 1

| Control | Status | Evidence | Oordeel |
|---------|--------|----------|---------|
| | ☐ Ja ☐ Nee ☐ Deels | | |

**Toelichting:**

---

## Samenvatting

### Score Overzicht

| Categorie | Totaal | Compliant | Partial | Non-Compliant | Score |
|-----------|--------|-----------|---------|---------------|-------|
| | | | | | |
| **Totaal** | | | | | **%** |

### Geïdentificeerde Gaps

1. 
2. 

### Aanbevelingen

1. 
2. 

## Sign-Off

| Rol | Naam | Datum |
|-----|------|-------|
| Assessor | ${assessor} | |
| Eigenaar | | |

## Wijzigingshistorie

| Versie | Datum | Auteur | Wijziging |
|--------|-------|--------|-----------|
| 0.1 | ${today} | ${assessor} | Initiële versie |
`;

// Maak bestand
const filePath = `${targetFolder}/${saId}.md`;
await app.vault.create(filePath, content);

// Open het nieuwe bestand
const file = app.vault.getAbstractFileByPath(filePath);
await app.workspace.getLeaf().openFile(file);

new Notice(`✅ Self-Assessment aangemaakt: ${saId}`);
-%>
