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


REM Get bin exe directory
REM cd "%programfiles%\JetBrains%" && cd PyCharm* && cd bin 
set "bin=%localappdata%\Programs\Microsoft VS Code\code.exe"


REM Open the directory with PyCharm
if exist "%gitdir%\.git" (
    call "%bin%" "%gitdir%"
) else (
    call "%bin%" "%~1"
)