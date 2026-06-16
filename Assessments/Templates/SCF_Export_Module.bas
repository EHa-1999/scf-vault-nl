' =============================================================================
' SCF-Vault Assessment Export Module
' =============================================================================
' Dit VBA module exporteert assessment resultaten naar een Markdown bestand
' dat direct bruikbaar is in de Obsidian vault.
'
' INSTALLATIE:
' 1. Open de Assessment Excel (xlsx)
' 2. Druk Alt+F11 om de VBA Editor te openen
' 3. Ga naar File > Import File
' 4. Selecteer dit .bas bestand
' 5. Sluit de VBA Editor
' 6. Sla het bestand op als .xlsm (Excel Macro-Enabled Workbook)
'
' GEBRUIK:
' - Ga naar het Export tabblad
' - Klik op de "Exporteer naar Vault" knop
' - Kies een locatie en bestandsnaam
' =============================================================================

Option Explicit

Public Sub ExportToVault()
    ' Main export function - generates Markdown file from assessment data
    
    Dim ws As Worksheet
    Dim wsAssess As Worksheet
    Dim wsDash As Worksheet
    Dim wsExport As Worksheet
    
    Dim filePath As String
    Dim fileNum As Integer
    Dim mdContent As String
    Dim componentName As String
    Dim benchmarkName As String
    
    ' Get worksheets
    Set wsAssess = ThisWorkbook.Worksheets("Assessment")
    Set wsDash = ThisWorkbook.Worksheets("Summary Dashboard")
    Set wsExport = ThisWorkbook.Worksheets("Export")
    
    ' Get component name from Instructions sheet
    componentName = GetComponentName()
    benchmarkName = "EXT-BM-" & componentName & "-v1.0"
    
    ' Validate required fields
    If Trim(wsExport.Range("B5").Value) = "" Then
        MsgBox "Vul eerst de Assessor in (cel B5)", vbExclamation, "Ontbrekende gegevens"
        wsExport.Activate
        wsExport.Range("B5").Select
        Exit Sub
    End If
    
    If Trim(wsExport.Range("B8").Value) = "" Then
        MsgBox "Vul eerst de Assessment Datum in (cel B8)", vbExclamation, "Ontbrekende gegevens"
        wsExport.Activate
        wsExport.Range("B8").Select
        Exit Sub
    End If
    
    ' Build filename suggestion
    ' Format: Assessment-ComponentName-Results-YYYY-MM-DD-HH-MM.md
    Dim suggestedName As String
    suggestedName = "Assessment-" & componentName & "-Results-" & _
                    Format(Now, "YYYY-MM-DD-HH-MM") & ".md"
    
    ' Show save dialog
    filePath = Application.GetSaveAsFilename( _
        InitialFileName:=suggestedName, _
        FileFilter:="Markdown Files (*.md), *.md", _
        Title:="Exporteer Assessment naar Vault (Assessments/Results/ folder)")
    
    If filePath = "False" Then
        Exit Sub ' User cancelled
    End If
    
    ' Ensure .md extension
    If Right(filePath, 3) <> ".md" Then
        filePath = filePath & ".md"
    End If
    
    ' Build Markdown content
    mdContent = BuildMarkdownContent(componentName, benchmarkName, wsExport, wsDash, wsAssess)
    
    ' Write to file
    fileNum = FreeFile
    Open filePath For Output As #fileNum
    Print #fileNum, mdContent
    Close #fileNum
    
    ' Confirm success
    MsgBox "Assessment geëxporteerd naar:" & vbCrLf & vbCrLf & filePath, _
           vbInformation, "Export Succesvol"
    
End Sub

Private Function GetComponentName() As String
    ' Extract component name from the Instructions sheet title
    Dim wsInstr As Worksheet
    Dim title As String
    
    Set wsInstr = ThisWorkbook.Worksheets("Instructions")
    title = wsInstr.Range("A1").Value
    
    ' Title format: "SECURITY SELF-ASSESSMENT: ComponentName"
    If InStr(title, ":") > 0 Then
        GetComponentName = Trim(Split(title, ":")(1))
    Else
        GetComponentName = "Unknown"
    End If
End Function

Private Function BuildMarkdownContent(componentName As String, benchmarkName As String, _
                                       wsExport As Worksheet, wsDash As Worksheet, _
                                       wsAssess As Worksheet) As String
    Dim md As String
    Dim timestamp As String
    
    timestamp = Format(Now, "YYYY-MM-DD HH:MM:SS")
    
    ' YAML Frontmatter
    md = "---" & vbLf
    md = md & "type: assessment-result" & vbLf
    md = md & "component: " & componentName & vbLf
    md = md & "benchmark: " & benchmarkName & vbLf
    md = md & "assessment_date: """ & wsExport.Range("B8").Value & """" & vbLf
    md = md & "export_timestamp: """ & timestamp & """" & vbLf
    md = md & "assessor: """ & wsExport.Range("B5").Value & """" & vbLf
    md = md & "system: """ & wsExport.Range("B6").Value & """" & vbLf
    md = md & "environment: """ & wsExport.Range("B7").Value & """" & vbLf
    md = md & "approved_by: """ & wsExport.Range("B9").Value & """" & vbLf
    md = md & vbLf
    
    ' Scores section
    md = md & "# Scores" & vbLf
    md = md & "total_score: " & wsDash.Range("B27").Value & vbLf
    md = md & "baseline_score: " & wsDash.Range("B28").Value & vbLf
    md = md & vbLf
    
    ' Counts section
    md = md & "# Tellingen" & vbLf
    md = md & "total_measures: " & wsDash.Range("B6").Value & vbLf
    md = md & "baseline_measures: " & wsDash.Range("B10").Value & vbLf
    md = md & vbLf
    md = md & "compliant: " & wsDash.Range("B14").Value & vbLf
    md = md & "partial: " & wsDash.Range("B15").Value & vbLf
    md = md & "non_compliant: " & wsDash.Range("B16").Value & vbLf
    md = md & "na: " & wsDash.Range("B17").Value & vbLf
    md = md & vbLf
    md = md & "baseline_compliant: " & wsDash.Range("B20").Value & vbLf
    md = md & "baseline_partial: " & wsDash.Range("B21").Value & vbLf
    md = md & "baseline_non_compliant: " & wsDash.Range("B22").Value & vbLf
    md = md & "baseline_na: " & wsDash.Range("B23").Value & vbLf
    md = md & "---" & vbLf
    md = md & vbLf
    
    ' Document body
    md = md & "# Assessment Result: " & componentName & vbLf
    md = md & vbLf
    md = md & "> Geëxporteerd uit Assessment-" & componentName & ".xlsm op " & timestamp & vbLf
    md = md & vbLf
    
    ' Summary table
    md = md & "## Samenvatting" & vbLf
    md = md & vbLf
    md = md & "| Metric | Waarde |" & vbLf
    md = md & "|--------|--------|" & vbLf
    md = md & "| Baseline Score | " & wsDash.Range("B28").Value & "% |" & vbLf
    md = md & "| Totaal Score | " & wsDash.Range("B27").Value & "% |" & vbLf
    md = md & "| Baseline Maatregelen | " & wsDash.Range("B10").Value & " |" & vbLf
    md = md & "| Totaal Maatregelen | " & wsDash.Range("B6").Value & " |" & vbLf
    md = md & "| Compliant | " & wsDash.Range("B14").Value & " |" & vbLf
    md = md & "| Partial | " & wsDash.Range("B15").Value & " |" & vbLf
    md = md & "| Non-Compliant | " & wsDash.Range("B16").Value & " |" & vbLf
    md = md & vbLf
    
    ' Metadata
    md = md & "## Metadata" & vbLf
    md = md & vbLf
    md = md & "- **Assessor**: " & wsExport.Range("B5").Value & vbLf
    md = md & "- **Systeem**: " & wsExport.Range("B6").Value & vbLf
    md = md & "- **Omgeving**: " & wsExport.Range("B7").Value & vbLf
    md = md & "- **Datum**: " & wsExport.Range("B8").Value & vbLf
    md = md & "- **Goedgekeurd door**: " & wsExport.Range("B9").Value & vbLf
    md = md & vbLf
    
    ' Non-compliant items
    md = md & BuildNonCompliantSection(wsAssess)
    
    ' Partial items
    md = md & BuildPartialSection(wsAssess)
    
    ' Related links
    md = md & "## Gerelateerd" & vbLf
    md = md & vbLf
    md = md & "- [[Components/" & componentName & "|" & componentName & " Component]]" & vbLf
    md = md & "- [[Benchmarks/EXT/" & benchmarkName & "|" & benchmarkName & " Benchmark]]" & vbLf
    md = md & "- [[Assessments/_index|Assessments Overzicht]]" & vbLf
    
    BuildMarkdownContent = md
End Function

Private Function BuildNonCompliantSection(wsAssess As Worksheet) As String
    Dim md As String
    Dim row As Long
    Dim lastRow As Long
    Dim hasItems As Boolean
    
    md = "## Non-Compliant Items" & vbLf & vbLf
    
    lastRow = wsAssess.Cells(wsAssess.Rows.Count, "A").End(xlUp).row
    hasItems = False
    
    md = md & "| ID | Control | Verantwoordelijke | Opmerking |" & vbLf
    md = md & "|----|---------|-------------------|-----------|" & vbLf
    
    For row = 2 To lastRow
        If wsAssess.Cells(row, 9).Value = "Non-Compliant" Then
            md = md & "| " & wsAssess.Cells(row, 1).Value & _
                     " | " & wsAssess.Cells(row, 5).Value & _
                     " | " & wsAssess.Cells(row, 12).Value & _
                     " | " & wsAssess.Cells(row, 11).Value & " |" & vbLf
            hasItems = True
        End If
    Next row
    
    If Not hasItems Then
        md = md & "| - | Geen non-compliant items | - | - |" & vbLf
    End If
    
    md = md & vbLf
    BuildNonCompliantSection = md
End Function

Private Function BuildPartialSection(wsAssess As Worksheet) As String
    Dim md As String
    Dim row As Long
    Dim lastRow As Long
    Dim hasItems As Boolean
    
    md = "## Partial Items" & vbLf & vbLf
    
    lastRow = wsAssess.Cells(wsAssess.Rows.Count, "A").End(xlUp).row
    hasItems = False
    
    md = md & "| ID | Control | Verantwoordelijke | Opmerking |" & vbLf
    md = md & "|----|---------|-------------------|-----------|" & vbLf
    
    For row = 2 To lastRow
        If wsAssess.Cells(row, 9).Value = "Partial" Then
            md = md & "| " & wsAssess.Cells(row, 1).Value & _
                     " | " & wsAssess.Cells(row, 5).Value & _
                     " | " & wsAssess.Cells(row, 12).Value & _
                     " | " & wsAssess.Cells(row, 11).Value & " |" & vbLf
            hasItems = True
        End If
    Next row
    
    If Not hasItems Then
        md = md & "| - | Geen partial items | - | - |" & vbLf
    End If
    
    md = md & vbLf
    BuildPartialSection = md
End Function

Public Sub CreateExportButton()
    ' Helper sub to create the export button on the Export sheet
    ' Run this once after importing the module
    
    Dim ws As Worksheet
    Dim btn As Button
    
    Set ws = ThisWorkbook.Worksheets("Export")
    
    ' Remove existing button if present
    On Error Resume Next
    ws.Buttons("btnExport").Delete
    On Error GoTo 0
    
    ' Create new button
    Set btn = ws.Buttons.Add(10, 200, 180, 40)
    With btn
        .Name = "btnExport"
        .Caption = "Exporteer naar Vault"
        .OnAction = "ExportToVault"
        .Font.Size = 12
        .Font.Bold = True
    End With
    
    MsgBox "Export knop aangemaakt!", vbInformation
End Sub
