@echo off
setlocal enabledelayedexpansion

:: Script Description:
:: Performs traceroute to a target IP, analyzes output to identify the ISP.
:: Configurable for multiple ISPs, with error handling and cleanup.

:: Configuration
set "target_ip=10.7.1.193"
set "output_file=tracert_output.txt"

:: ISP definitions
set "isp[0].name=World Link"
set "isp[0].ip=172.16.11.121"
set "isp[1].name=Techminds"
set "isp[1].ip=100.71.0.2"

:: Function to run tracert
call :RunTracert

:: Function to analyze results
call :AnalyzeResults

:: Clean up
del "%output_file%"

pause
exit /b

:RunTracert
echo Starting tracert to %target_ip%...
echo Please wait while the route is being traced...
tracert %target_ip% > "%output_file%" 2>&1
if %errorlevel% neq 0 (
    echo Error: Tracert command failed.
    exit /b 1
)
echo Tracert complete. Analyzing results...
exit /b 0

:AnalyzeResults
if not exist "%output_file%" (
    echo Error: Tracert output file not found.
    exit /b 1
)

set "isp_found="
for /l %%i in (0,1,1) do (
    findstr /C:"!isp[%%i].ip!" "%output_file%" >nul
    if !errorlevel! equ 0 (
        set "isp_found=!isp[%%i].name!"
        set "isp_ip=!isp[%%i].ip!"
        goto :ReportResult
    )
)

:ReportResult
if defined isp_found (
    echo ISP: %isp_found% with IP "%isp_ip%" connected.
) else (
    echo Connection error: No known ISP found.
)
exit /b 0