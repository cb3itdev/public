@echo off
echo This will delete all local data and profiles for Outlook
echo Your emails are stored on the Exchange server
echo All data will download again upon reopening Outlook but can
echo take a few hours depending on the size of your mailbox
echo.
echo If you do not wish to remove cached data close this window now
echo.
pause

echo Ensuring outlook is closed
timeout /t 2 /nobreak >nul
taskkill /im Outlook.exe /t /f
echo.

echo Deleting local app data
timeout /t 2 /nobreak >nul
rmdir /s /q %localappdata%\Microsoft\Outlook\
echo.

echo Removing profiles
timeout /t 2 /nobreak >nul
reg delete "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Profiles" /f
reg delete "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\PST\LastCorruptStore" /f
reg delete "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\PST\PromptRepair" /f
echo.

pause

