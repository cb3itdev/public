@echo off
echo.
::check for admin rights
net session >nul 2>&1
if not %errorlevel%==0 echo  This must be run as administrator & echo  Press any key to exit & pause > nul & exit


set "scriptdir=%~dp0"

::get office
set "ODTpage=https://www.microsoft.com/en-us/download/details.aspx?id=49117"
set "selected=0"


::parse the office link above, grab all links, search list for exe, download latest executable
mkdir C:\Temp\install365\ > nul
powershell $ODTexe = "(Invoke-WebRequest -Uri '%ODTpage%' -UseBasicParsing).Links.href | Where-Object {$_ -match '.exe$'}"; Invoke-WebRequest -Uri $ODTexe -OutFile C:\Temp\install365\InstallOffice.exe
::timeout /t 2 > NUL


::run the installer
echo Letting filesystem stablize...
timeout /t 5 > NUL
start /wait C:\Temp\install365\InstallOffice.exe /quiet /extract:c:\temp\install365\
forfiles /p C:\Temp\install365 /S /M *.xml /C "cmd /c start /wait C:\Temp\install365\setup.exe /configure @path"
echo.


echo Letting filesystem stablize...
timeout /t 10 > NUL
rmdir /s /q C:\Temp\install365

echo Closing in 10 seconds......
timeout /t 10 > NUL

