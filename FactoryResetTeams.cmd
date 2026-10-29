@echo off
echo This will delete all local data and profiles for Teams
echo Your chat and channels are stored on the Microsoft server
echo All data will download again upon reopening Teams but can
echo take a while depending on the size
echo.
echo If you do not wish to remove cached data close this window now
echo.
pause

echo Ensuring Teams is closed
timeout /t 2 /nobreak >nul
taskkill /im Teams.exe /t /f
echo.

echo Deleting local app data
timeout /t 2 /nobreak >nul
rmdir /s /q %appdata%\Microsoft\Teams\
echo.

echo All done. Press any key to close this window.
pause >nul
