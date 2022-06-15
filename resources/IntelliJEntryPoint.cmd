@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Surf parents until we git a git directory
pushd "%~1"
for /l %%x in (1, 1, 512) do (
    if exist "!cd!\.git" (goto loopdone)
    cd ..
)
:loopdone
:loopdone
set "gitdir=%cd%"


REM Get PyCharm bin exe
cd "%programfiles%\JetBrains%" && cd "IntelliJ IDEA*" && cd bin 
set "pybin=%cd%\idea64.exe"


REM Open the directory with PyCharm
if exist "%gitdir%\.git" (
    call "%pybin%" "%gitdir%"
) else (
    call "%pybin%" "%~1"
)