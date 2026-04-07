@echo off
echo.
::check for admin rights
net session >nul 2>&1
if not %errorlevel%==0 echo  This must be run as administrator & echo  Press any key to exit & pause > nul & exit


::set/clear vars
set "HPIApage=https://ftp.ext.hp.com/pub/caps-softpaq/cmit/HPIA.html"
set "HPIAlink="
::working dir
if NOT exist C:\SWSetup mkdir C:\SWSetup
CD C:\SWSetup


::parse HP Image Assistant site page for latest download exe file and set HPIAlink var to this URL
for /f "usebackq delims=" %%A in (`powershell -NoLogo -NoProfile -Command "(Invoke-WebRequest -Uri '%HPIApage%' -UseBasicParsing).Links.href | Where-Object { $_ -match '\.exe$' } | Select-Object -First 1"`) do set "HPIAlink=%%A"
::download HPIA
start /wait powershell Invoke-WebRequest -Uri %HPIAlink% -OutFile C:\SWSetup\HPIA.exe
timeout /t 2 > NUL


::extract HPIA
if exist C:\SWSetup\HPIA rmdir /S /Q C:\SWSetup\HPIA
Echo Extracting HPIA
"%programfiles%\7-zip\7z.exe" x "C:\SWSetup\HPIA.exe" -o"C:\SWSetup\HPIA\" -y
echo Letting filesystem stablize...
timeout /t 5 > NUL


::run HPIA with automated mode
CD C:\SWSetup\HPIA
start HPImageAssistant.exe /Operation:Analyze /Category:ALL /Selection:All /Action:Install /noninteractive /ReportFolder:C:\SWSetup


echo HPIA will run in the background.
echo Please minimize all windows to see the progress.
echo Closing in 10 seconds......
timeout /t 10 > NUL

