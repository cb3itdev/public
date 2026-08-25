@echo off
echo.
::check for admin rights
net session >nul 2>&1
if not %errorlevel%==0 echo  This must be run as administrator & echo  Press any key to exit & pause > nul & exit


::office link
set "ODTpage=https://www.microsoft.com/en-us/download/details.aspx?id=49117"


::create temp dir, parse the office link above, grab all links, search list for exe, download latest executable
mkdir C:\Temp\install365\ > nul
powershell $ODTexe = "(Invoke-WebRequest -Uri '%ODTpage%' -UseBasicParsing).Links.href | Where-Object {$_ -match '.exe$'}"; Invoke-WebRequest -Uri $ODTexe -OutFile C:\Temp\install365\InstallOffice.exe


::extract ODT and run the installer with default configuration-64 bit office
echo Letting filesystem stablize...
timeout /t 5 > NUL
start /wait C:\Temp\install365\InstallOffice.exe /quiet /extract:c:\temp\install365\
forfiles /p C:\Temp\install365 /S /M *.xml /C "cmd /c start /wait C:\Temp\install365\setup.exe /configure @path"
echo.

::remove temporary files
echo Letting filesystem stablize...
timeout /t 30 > NUL
rmdir /s /q C:\Temp\install365


echo Closing in 10 seconds......
timeout /t 10 > NUL

