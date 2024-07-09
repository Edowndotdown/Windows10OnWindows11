@echo off
title Windows 10 on Windows 11 Patcher
:: BatchGotAdmin
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo Welcome to WoW! A combonation of software and registry tweaks to make Windows 11 look like Windows 10
echo.
echo.
echo Credits to 
echo Explorer Patcher, and Windows11DisableRoundedCorners.
echo This is a free program. We are not responsible for damages done to your device.
echo For Documentation, visit the GitHub Page!
pause
start /wait NR.exe
start /wait EP.exe
start /wait EPS.reg
start /wait context.reg
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v UseCompactMode /t REG_DWORD /d 1 /f 
timeout 2 >nul
shutdown -r -t 0

