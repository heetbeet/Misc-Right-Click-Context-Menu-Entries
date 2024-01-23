@echo off
takeown /f "%~1" /r /d y
icacls "%~1" /grant administrators:F /t
icacls "%~1" /grant "%USERNAME%":F /t
