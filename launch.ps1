<#
.SYNOPSIS
    GeoAnalog Matchmaker One-Click Launcher for Windows PowerShell
.DESCRIPTION
    Verifies Node.js, installs dependencies if needed, starts the Vite web server,
    and opens the web application in your default browser.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Set-Location $PSScriptRoot

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "     GEOANALOG MATCHMAKER // NASA SPACE APPS CHALLENGE 2026" -ForegroundColor Cyan
Write-Host "     Planetary Analog Intelligence & Decision Analysis Platform" -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Detect Node.js
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    $fallbackPaths = @(
        "$env:USERPROFILE\.local\nodejs",
        "C:\Users\ADMIN\.local\nodejs",
        "$env:ProgramFiles\nodejs"
    )
    $found = $false
    foreach ($p in $fallbackPaths) {
        if (Test-Path "$p\node.exe") {
            $env:Path = "$p;$env:Path"
            $found = $true
            break
        }
    }
    if (-not $found) {
        Write-Host "[ERROR] Node.js is not found on your system." -ForegroundColor Red
        Write-Host "Please install Node.js (LTS version) from https://nodejs.org/" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
        exit 1
    }
}

$nodeVer = & node -v
$npmVer = & npm -v
Write-Host "[1/4] Environment detected:" -ForegroundColor Green
Write-Host "      - Node.js: $nodeVer" -ForegroundColor White
Write-Host "      - npm:     v$npmVer" -ForegroundColor White
Write-Host ""

# 2. Check dependencies
if (-not (Test-Path "node_modules")) {
    Write-Host "[2/4] First-time setup: installing dependencies (npm install)..." -ForegroundColor Yellow
    & npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] npm install failed. Please check network connectivity." -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
    Write-Host "      Dependencies installed successfully!" -ForegroundColor Green
} else {
    Write-Host "[2/4] Dependencies verified: node_modules present." -ForegroundColor Green
}
Write-Host ""

# 3. Preparation
Write-Host "[3/4] Ready to launch development server on port 5173..." -ForegroundColor Green
Write-Host ""

# 4. Open browser & start server
Write-Host "[4/4] Starting GeoAnalog Matchmaker web application..." -ForegroundColor Green
Write-Host "      - Local URL:   http://localhost:5173/" -ForegroundColor Cyan
Write-Host "      - Network:     Available on local Wi-Fi / LAN" -ForegroundColor White
Write-Host ""
Write-Host "Launching web browser to http://localhost:5173/..." -ForegroundColor Yellow

# Direct browser launch
Start-Process "http://localhost:5173/"

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "  Web server is now RUNNING! Press Ctrl+C in this window to stop." -ForegroundColor White
Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host ""

& npm run dev -- --open
