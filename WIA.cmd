@echo off
echo.
::check for admin rights
net session >nul 2>&1
if not %errorlevel%==0 echo  This must be run as administrator & echo  Press any key to exit & pause > nul & exit


::Windows Installation Assistant 25H2
set "WIApage=https://www.microsoft.com/en-in/download/details.aspx?id=108398"


::create temp dir, parse the WIA link above, grab all links, search list for exe, download latest executable
mkdir C:\Temp\WIA\ > nul
powershell $WIAexe = "(Invoke-WebRequest -Uri '%WIApage%' -UseBasicParsing).Links.href | Where-Object {$_ -match '.exe$'}"; Invoke-WebRequest -Uri $WIAexe -OutFile C:\Temp\WIA\WIA.exe


::extract ODT and run the installer with default configuration-64 bit office
echo Letting filesystem stablize...
timeout /t 5 > NUL
start /wait C:\Temp\WIA\WIA.exe /silent
echo.

::remove temporary files
echo Letting filesystem stablize...
timeout /t 30 > NUL
rmdir /s /q C:\Temp\WIA


echo Closing in 10 seconds......
timeout /t 10 > NUL
