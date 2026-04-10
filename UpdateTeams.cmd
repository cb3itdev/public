@echo off

echo Ensuring Teams is closed
timeout /t 2 /nobreak >nul
taskkill /im MS-Teams.exe /t /f
echo.

echo Downloading Teams
if NOT exist C:\Temp mkdir C:\Temp
powershell Invoke-WebRequest -Uri "https://statics.teams.cdn.office.net/production-windows-x86/lkg/MSTeamsSetup.exe" -OutFile .\MSTeamsSetup.exe
timeout /t 2 /nobreak >nul
echo.

echo Updating....
start /nowait .\MSTeamsSetup.exe -s
echo.

echo Teams Updater should be running.
echo Closing this windows in 5 seconds.
timeout /t 5 /nobreak >nul
