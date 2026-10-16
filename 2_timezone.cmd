@echo off
echo.
::check for admin rights
net session >nul 2>&1
if not %errorlevel%==0 echo  This must be run as administrator & echo  Press any key to exit & pause > nul & exit


echo.
echo Setting TimeZone to Automatic
sc config tzautoupdate start=delayed-auto
echo.
echo Manually triggering timezone update now
net start tzautoupdate /y
pause
