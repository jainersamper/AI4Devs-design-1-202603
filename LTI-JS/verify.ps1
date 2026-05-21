# Verificación del proyecto LTI-JS — Jainer Samper
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$gv = Get-ChildItem "C:\Program Files\Graphviz" -Recurse -Filter "dot.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
if ($gv) {
    $env:Path = "$($gv.DirectoryName);" + $env:Path
}

function Test-Command($name) {
    $cmd = Get-Command $name -ErrorAction SilentlyContinue
    if (-not $cmd) { throw "No se encuentra: $name" }
    Write-Host "[OK] $name"
}

Write-Host "=== Comprobando herramientas ==="
Test-Command java
Test-Command dot
Test-Command python

Write-Host "`n=== Regenerando diagramas ==="
if (-not (Test-Path "tools\plantuml.jar")) { throw "Falta tools\plantuml.jar" }
java -jar tools\plantuml.jar -tsvg -o . diagrams.puml
python ats_architecture.py

Write-Host "`n=== Comprobando artefactos ==="
$required = @(
    "LTI-JS.md", "prompts.md", "lean-canvas.html",
    "Candidate_Resume_Submission.svg",
    "AI_Candidate_Screening_Ranking.svg",
    "Conversational_Chatbot_Screening.svg",
    "C4_Context_ATS.svg",
    "C4_Container_ATS.svg",
    "C4_AI_Microservices_Component.svg",
    "ats_architecture_on_aws.png"
)
foreach ($f in $required) {
    if (-not (Test-Path $f)) { throw "Falta: $f" }
    Write-Host "[OK] $f"
}

$png = [System.IO.File]::ReadAllBytes("ats_architecture_on_aws.png")
if ($png[0] -ne 0x89 -or $png[1] -ne 0x50) { throw "ats_architecture_on_aws.png no es un PNG valido" }
Write-Host "[OK] PNG valido ($($png.Length) bytes)"

Get-ChildItem *.svg | ForEach-Object {
    [xml](Get-Content $_.FullName -Raw) | Out-Null
    Write-Host "[OK] SVG $($_.Name)"
}

python -c "import diagrams, graphviz; print('[OK] Modulos Python')"

Write-Host "`n=== Proyecto funcional ==="
