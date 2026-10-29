@echo off
echo.
echo   Keeping PC from going to sleep.
echo   Close this window to cancel the effect.

powershell $idle = New-Object -ComObject WScript.Shell; while (1) {$idle.SendKeys('+{F15}');  Start-Sleep -seconds 30}