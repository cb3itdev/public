@echo off
echo Setting %public%\Desktop to editable by the users group
icacls "%public%\Desktop" /grant Users:F /inheritance:e
pause
