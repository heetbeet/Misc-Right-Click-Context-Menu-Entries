@echo off
SETLOCAL

:: Remove context menu entries
reg delete "HKEY_CURRENT_USER\Software\Classes\Directory\shell\PyCharmOpenGitBase" /f > nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\PyCharmOpenGitBase" /f > nul 2>&1

echo PyCharm Open With (git base dir) has been removed
echo:

:: Pause if double clicked
if /i "%comspec% /c %~0 " equ "%cmdcmdline:"=%" pause