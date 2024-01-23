@echo off
SETLOCAL

:: Use double slash \\ for .reg compatibility

set "resourcesdir=%~dp0resources\"
set "resourcesdir=%resourcesdir:\=\\%"

set "scriptpath=%resourcesdir%IntelliJEntryPoint.cmd"
set "iconpath=%resourcesdir%intellij.ico"
set "noshellpath=%resourcesdir%noshell.vbs"

:: Remove previous context menu entries
call "%~dp0IntelliJContextMenuRemove.cmd"


:: Add context menu
set "rtmp=%temp%\context-menu--activate.reg"

echo Windows Registry Editor Version 5.00                                                        >"%rtmp%"
echo:                                                                                            >>"%rtmp%"
echo ; Right click on explorer TREE                                                              >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\shell\IntelliJOpenGitBase]                    >>"%rtmp%"
echo @="IntelliJ Open Git Base"                                                                  >>"%rtmp%"
echo "Icon"="%iconpath%,0"                                                                       >>"%rtmp%"
echo:                                                                                            >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\shell\IntelliJOpenGitBase\command]            >>"%rtmp%"
echo @="WScript \"%noshellpath%\" \"%scriptpath%\" \"%%1\""                                      >>"%rtmp%"
echo:                                                                                            >>"%rtmp%"
echo ; Right click on explorer main area                                                         >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\IntelliJOpenGitBase]         >>"%rtmp%"
echo @="IntelliJ Open Git Base"                                                                  >>"%rtmp%"
echo "Icon"="%iconpath%,0"                                                                       >>"%rtmp%"
echo:                                                                                            >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\IntelliJOpenGitBase\command] >>"%rtmp%"
echo @="WScript \"%noshellpath%\" \"%scriptpath%\" \"%%V\""                                      >>"%rtmp%"

reg import "%rtmp%" > nul 2>&1
del "%rtmp%"

echo IntelliJ Open Git Base has been added
echo:

:: Pause if double clicked
if /i "%comspec% /c %~0 " equ "%cmdcmdline:"=%" pause