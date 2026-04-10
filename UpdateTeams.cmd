@echo off
echo This will force an update for Teams
echo If your Teams is working correctly
echo please close this window and delete this script
echo.
pause

echo Ensuring Teams is closed
timeout /t 2 /nobreak >nul
taskkill /im MS-Teams.exe /t /f
echo.

echo Downloading Teams
powershell Invoke-WebRequest -Uri "https://statics.teams.cdn.office.net/production-windows-x86/lkg/MSTeamsSetup.exe" -OutFile C:\temp\MSTeamsSetup.exe
timeout /t 2 /nobreak >nul
echo.

echo Updating....
start /wait C:\temp\MSTeamsSetup.exe -s
echo.

echo All done. Press any key to close this window.
pause >nul
