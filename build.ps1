[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$reportRoot = $PSScriptRoot
$outputDirectory = Join-Path $reportRoot 'build'
New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null

Push-Location -LiteralPath $reportRoot
try {
    $latexmk = Get-Command latexmk -ErrorAction SilentlyContinue
    $pdflatex = Get-Command pdflatex -ErrorAction SilentlyContinue
    $tectonicPath = Join-Path $reportRoot '.tools\tectonic.exe'
    $tectonic = Get-Command tectonic -ErrorAction SilentlyContinue

    if ($latexmk) {
        & $latexmk.Source -pdf -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build main.tex
        if ($LASTEXITCODE -ne 0) { throw 'LaTeX compilation failed. See build/main.log.' }
    } elseif ($pdflatex) {
        # Two passes resolve cross-references and table numbering.
        for ($pass = 1; $pass -le 2; $pass++) {
            & $pdflatex.Source -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=build main.tex
            if ($LASTEXITCODE -ne 0) { throw 'LaTeX compilation failed. See build/main.log.' }
        }
    } elseif ((Test-Path -LiteralPath $tectonicPath) -or $tectonic) {
        if (-not (Test-Path -LiteralPath $tectonicPath)) { $tectonicPath = $tectonic.Source }
        & $tectonicPath --outdir build --keep-logs main.tex
        if ($LASTEXITCODE -ne 0) { throw 'LaTeX compilation failed. See build/main.log.' }
    } else {
        throw 'No TeX compiler found. Install Tectonic, MiKTeX, or TeX Live and run this script again.'
    }

    $pdfPath = Join-Path $outputDirectory 'main.pdf'
    if (-not (Test-Path -LiteralPath $pdfPath)) { throw 'Compilation did not produce build/main.pdf.' }
    $exportDirectory = Join-Path $reportRoot 'output\pdf'
    New-Item -ItemType Directory -Path $exportDirectory -Force | Out-Null
    $exportPath = Join-Path $exportDirectory 'ECSE429_PartB_Group3_Report.pdf'
    Copy-Item -LiteralPath $pdfPath -Destination $exportPath -Force
    Write-Host "Report PDF: $pdfPath"
    Write-Host "Exported report: $exportPath"
} finally {
    Pop-Location
}
