@echo off
setlocal enabledelayedexpansion
title GeoAnalog Matchmaker - NASA Space Apps Challenge 2026

:: Navigate to script directory
cd /d "%~dp0"

echo ========================================================================
echo.
echo     GEOANALOG MATCHMAKER // NASA SPACE APPS CHALLENGE 2026
echo     Planetary Analog Intelligence ^& Decision Analysis Platform
echo.
echo ========================================================================
echo.

:: 1. Check Node.js availability
where node >nul 2>nul
if %errorlevel% neq 0 (
    if exist "%USERPROFILE%\.local\nodejs\node.exe" (
        set "PATH=%USERPROFILE%\.local\nodejs;%PATH%"
    ) else if exist "C:\Users\ADMIN\.local\nodejs\node.exe" (
        set "PATH=C:\Users\ADMIN\.local\nodejs;%PATH%"
    ) else if exist "%ProgramFiles%\nodejs\node.exe" (
        set "PATH=%ProgramFiles%\nodejs;%PATH%"
    ) else (
        echo [ERROR] Node.js is not installed or not found in PATH!
        echo Please download and install Node.js (LTS version recommended) from:
        echo https://nodejs.org/
        echo.
        pause
        exit /b 1
    )
)

for /f "tokens=*" %%v in ('node -v 2^>nul') do set "NODE_VERSION=%%v"
for /f "tokens=*" %%v in ('npm -v 2^>nul') do set "NPM_VERSION=%%v"

echo [1/4] Environment detected:
echo       - Node.js: %NODE_VERSION%
echo       - npm:     v%NPM_VERSION%
echo.

:: 2. Check dependencies (node_modules)
if not exist "node_modules\" (
    echo [2/4] First-time setup: installing dependencies (npm install)...
    echo       This may take 10-30 seconds...
    call npm install
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to install dependencies. Please check your internet connection.
        pause
        exit /b 1
    )
    echo       Dependencies successfully installed!
) else (
    echo [2/4] Verified dependencies: node_modules present.
)
echo.

:: 3. Check / run unit tests quick validation
echo [3/4] Ready to launch development server on port 5173...
echo.

:: 4. Launch browser and development server
echo [4/4] Starting GeoAnalog Matchmaker web application...
echo       - Local URL:   http://localhost:5173/
echo       - Network:     Accessible to mobile/tablets on local Wi-Fi
echo.
echo Launching default web browser to http://localhost:5173/...

:: Direct browser launch
start "" "http://localhost:5173/"

:: Start Vite dev server with auto-open enabled
echo.
echo ========================================================================
echo   Web server is now RUNNING! Press Ctrl+C in this window to stop.
echo ========================================================================
echo.

call npm run dev -- --open

if %errorlevel% neq 0 (
    echo.
    echo Server stopped with code %errorlevel%.
    pause
)
