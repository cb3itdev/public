@echo off
echo Ensuring Edge is closed
timeout /t 2 /nobreak >nul
taskkill /im msedge.exe /t /f
echo.

echo Deleting local app data
timeout /t 2 /nobreak >nul
rmdir /s /q %localappdata%\Microsoft\Edge\
echo.

pause

