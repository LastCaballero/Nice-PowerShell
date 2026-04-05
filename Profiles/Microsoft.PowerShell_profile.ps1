# ---------------------------------------------------------
#  CONFIG: Speicherort für das aktive Prompt-Theme
# ---------------------------------------------------------
$PromptConfigPath = "$HOME\.config\pwsh"
$PromptConfigFile = "$PromptConfigPath\prompt-theme.txt"

if (-not (Test-Path $PromptConfigPath)) {
    New-Item -ItemType Directory -Path $PromptConfigPath | Out-Null
}

if (-not (Test-Path $PromptConfigFile)) {
    "1" | Out-File $PromptConfigFile
}

# ---------------------------------------------------------
#  FUNCTION: Prompt-Theme laden
# ---------------------------------------------------------
function Get-PromptTheme {
    $theme = Get-Content $PromptConfigFile -ErrorAction SilentlyContinue
    if (-not $theme) { $theme = "1" }
    return [int]$theme
}

# ---------------------------------------------------------
#  FUNCTION: Prompt-Theme setzen
# ---------------------------------------------------------
function Set-PromptTheme {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(1,8)]
        [int]$Theme
    )

    $Theme | Out-File $PromptConfigFile
    Write-Host "Prompt-Theme wurde gesetzt auf $Theme."
}

# ---------------------------------------------------------
#  FUNCTION: Prompt
# ---------------------------------------------------------
function prompt {

    $theme = Get-PromptTheme
    $path = (Get-Location).Path

    switch ($theme) {

        # 1 — Ocean Breeze 🌊
        1 {
            Write-Host "" -NoNewline
            Write-Host "🌊 $path" -ForegroundColor Cyan
            return "❯  "
        }

        # 2 — Sunset Glow 🌅
        2 {
            Write-Host "" -NoNewline
            Write-Host "🌅 $path" -ForegroundColor Yellow
            return "➤  "
        }

        # 3 — Cyber Neon ⚡
        3 {
            Write-Host "" -NoNewline
            Write-Host "⚡ $path" -ForegroundColor Magenta
            return "➜  "
        }

        # 4 — Forest Spirit 🌲
        4 {
            Write-Host "" -NoNewline
            Write-Host "🌲 $path" -ForegroundColor Green
            return "❯  "
        }

        # 5 — Minimal Zen 🧘
        5 {
            Write-Host "" -NoNewline
            Write-Host "🧘  $path" -ForegroundColor Gray
            return ">  "
        }

        # 6 — Fish-Shell Inspired 🐟
        6 {
            Write-Host "" -NoNewline
            Write-Host "🐟 $path" -ForegroundColor Blue
            return "→  "
        }

        # 7 — Power Arrow ➜
        7 {
            Write-Host "" -NoNewline
            Write-Host "➜ $path" -ForegroundColor DarkCyan
            return "➜  "
        }

        # 8 — Ultra Clean
        8 {
            return "❯  "
        }
    }
}

# ---------------------------------------------------------
#  OPTIONAL: Übersicht anzeigen
# ---------------------------------------------------------
function Show-PromptThemes {
    Write-Host "Verfügbare Prompt-Themes:"
    Write-Host "1 – Ocean Breeze 🌊"
    Write-Host "2 – Sunset Glow 🌅"
    Write-Host "3 – Cyber Neon ⚡"
    Write-Host "4 – Forest Spirit 🌲"
    Write-Host "5 – Minimal Zen 🧘"
    Write-Host "6 – Fish-Shell Inspired 🐟"
    Write-Host "7 – Power Arrow ➜"
    Write-Host "8 – Ultra Clean"
}
