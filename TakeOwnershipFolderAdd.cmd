@echo off
SETLOCAL

:: Use double slash \\ for .reg compatibility

set "resourcesdir=%~dp0resources\"
set "resourcesdir=%resourcesdir:\=\\%"

set "scriptpath=%resourcesdir%TakeOwnershipFolder.cmd"
set "iconpath=%resourcesdir%TakeOwnershipFolder.ico"
set "noshelladminpath=%resourcesdir%noshelladmin.vbs"

:: Remove previous context menu entries
call "%~dp0TakeOwnershipFolderRemove.cmd"


:: Add context menu
set "rtmp=%temp%\context-menu--activate.reg"

echo Windows Registry Editor Version 5.00                                                        >"%rtmp%"
echo:                                                                                           >>"%rtmp%"
echo ; Right click on explorer TREE                                                             >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\shell\TakeOwnershipFolder]                    >>"%rtmp%"
echo @="Take Ownership of Folder"                                                                  >>"%rtmp%"
echo "Icon"="%iconpath%,0"                                                                      >>"%rtmp%"
echo:                                                                                           >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\shell\TakeOwnershipFolder\command]            >>"%rtmp%"
echo @="WScript \"%noshelladminpath%\" \"%scriptpath%\" \"%%1\""                                     >>"%rtmp%"
echo:                                                                                           >>"%rtmp%"
echo ; Right click on explorer main area                                                        >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\TakeOwnershipFolder]         >>"%rtmp%"
echo @="Take Ownership of Folder"                                                                  >>"%rtmp%"
echo "Icon"="%iconpath%,0"                                                                      >>"%rtmp%"
echo:                                                                                           >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\TakeOwnershipFolder\command] >>"%rtmp%"
echo @="WScript \"%noshelladminpath%\" \"%scriptpath%\" \"%%V\""                                     >>"%rtmp%"

reg import "%rtmp%" > nul 2>&1
del "%rtmp%"

echo TakeOwnershipFolder has been added
echo:

:: Pause if double clicked
if /i "%comspec% /c %~0 " equ "%cmdcmdline:"=%" pause