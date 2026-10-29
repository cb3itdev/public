@echo off
echo This will delete all local data for Claude
echo If you do not wish to remove this userdata close this window now
echo.
pause

echo Ensuring Claude is closed
timeout /t 2 /nobreak >nul
taskkill /im claude.exe /t /f
echo.

echo Deleting local app data
timeout /t 2 /nobreak >nul
rmdir /s /q %appdata%\Claude\
echo.

pause

