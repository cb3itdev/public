@echo off
echo.
::check for admin rights
net session >nul 2>&1
if not %errorlevel%==0 echo  This must be run as administrator & echo  Press any key to exit & pause > nul & exit


::HPIA main page
set "HPIApage=https://ftp.ext.hp.com/pub/caps-softpaq/cmit/HPIA.html"
set "selected=0"
::working dir
if NOT exist C:\SWSetup mkdir C:\SWSetup
CD C:\SWSetup


::parse the HPIApage link above, grab all links, search list for exe, download latest executable
powershell $HPexe = "(Invoke-WebRequest -Uri '%HPIApage%' -UseBasicParsing).Links.href | Where-Object {$_ -match '.exe$'}"; Invoke-WebRequest -Uri $HPexe -OutFile C:\SWSetup\HPIA.exe
timeout /t 2 > NUL


::extract HPIA.exe
if exist C:\SWSetup\HPIA rmdir /S /Q C:\SWSetup\HPIA
Echo Extracting HPIA
"%programfiles%\7-zip\7z.exe" x "C:\SWSetup\HPIA.exe" -o"C:\SWSetup\HPIA\" -y
echo Letting filesystem stablize...
timeout /t 5 > NUL
echo.

::select ALL updates or select only Drivers, Dock Firmware, or Bios
echo Select 1 to update Drivers, Dock Firmware, and Bios
echo Select 2 to update only Drivers
echo Select 3 to update only Dock Firmware
echo Select 4 to update only Bios
echo.
echo "Please make your selection: >"

choice /c:1234

if %errorlevel%==1 set "selected=ALL"
if %errorlevel%==2 set "selected=Drivers"
if %errorlevel%==3 set "selected=Firmware"
if %errorlevel%==4 set "selected=BIOS"


::run HPIA with automated mode
CD C:\SWSetup\HPIA
start HPImageAssistant.exe /Operation:Analyze /Category:%selected% /Selection:All /Action:Install /noninteractive /ReportFolder:C:\SWSetup


echo HPIA will run in the background.
echo Please minimize all windows to see the progress.
echo Closing in 10 seconds......
timeout /t 10 > NUL

