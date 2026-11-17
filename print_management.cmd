@echo off
echo.
::check for admin rights
net session >nul 2>&1
if not %errorlevel%==0 echo  This must be run as administrator & echo  Press any key to exit & pause > nul & exit


echo Installing print management
echo.
DISM /online /add-capability /CapabilityName:Print.Management.Console~~~~0.0.1.0