@echo off
echo.
::check for admin rights
net session >nul 2>&1
if not %errorlevel%==0 echo  This must be run as administrator & echo  Press any key to exit & pause > nul & exit

echo Setting %public%\Desktop to editable by the users group
icacls "%public%\Desktop" /grant Users:F /inheritance:e
pause
