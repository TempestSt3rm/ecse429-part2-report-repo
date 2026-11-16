# Part B report

Local LaTeX sources for the team's 5–10-page PDF report. Edit locally; no Overleaf connection is configured.

## Files

- `main.tex`: cover metadata, team roster, and section order.
- `report-style.tex`: Part A cover, typography, colors, headings, tables, figures, and footers, adapted for Part B.
- `sections/`: report content, split by topic.
- `figures/`: screenshots and other figures referenced by the report.
- `build.ps1`: local PDF build command.
- `build/`: generated PDF, logs, and auxiliary files (ignored by Git).
- `output/pdf/ECSE429_PartB_Group3_Report.pdf`: report PDF produced by the build script.

## Build

Install a local TeX distribution (MiKTeX or TeX Live) with `pdflatex` on PATH. The build script prefers `latexmk` if it is available and otherwise runs `pdflatex` twice. Packages used by `report-style.tex` must be installed in the distribution. PDFLaTeX uses TeX Gyre Termes; XeLaTeX/LuaLaTeX use installed Times New Roman when available, with TeX Gyre Termes as fallback. No local font files are required.

From this folder in PowerShell:

```powershell
.\build.ps1
```

From the workspace root:

```powershell
& .\Project\Part2\Report\build.ps1
```

The compiler output is `build/main.pdf`; the build script also copies it to `output/pdf/ECSE429_PartB_Group3_Report.pdf`. Compilation errors are recorded in `build/main.log`. The script works from any current directory and leaves it unchanged afterwards.

The portable Tectonic 0.17.0 Windows MSVC compiler is available in `.tools/` (ignored by Git). The build script uses it when `latexmk` and `pdflatex` are unavailable. Tectonic downloads packages on first use and caches them for later builds. Its official release is at https://github.com/tectonic-typesetting/tectonic/releases/tag/tectonic%400.17.0.

## Writing

The report contains the report prose, a generated story-coverage table, an architecture diagram, execution findings, and bug analysis. Its executable-source reference is commit `e404151581db239870832037758d61221c01e61a`; the README and bug report have subsequent documentation edits. The team roster is carried over from the Part A example.

The eight sections follow the Part A report: deliverables, story testing method, story coverage, suite structure, repository and reproduction, execution findings (including bugs), AI disclosure, and references. Manual page breaks mirror Part A; reflow them as the text grows to maintain the 5–10-page target. The AI disclosure describes the team's work using Jeffrey's account. Section 7 includes the supplied AI prompt examples. An uppercase placeholder identifies the final ZIP/video references. Earlier AI disclosure material is preserved in `notes/ai-disclosure-source.tex`, which is not included in the PDF.

Requirements sources: `../../../ECSE_429_Project.pdf`, Part B (pages 5–6) and the Part A bug format (page 4); `../../Part1/Context/ECSE 429 Course Project Overview.pdf`, AI usage (page 5).
