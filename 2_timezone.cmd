@echo off
set TZ=""

echo.
echo Set TimeZone
echo.
echo List of available TimeZones:
echo    A - Pacific Standard Time (PST)
echo    B - Mountain Standard Time (MST)
echo    C - Central Standard Time (CST)
echo    D - Eastern Standard Time (EST)
echo.
choice /n /C:abcd /m "Please make your selection now >"
echo.
if %errorlevel% EQU 1 set TZ="Pacific Standard Time"
if %errorlevel% EQU 2 set TZ="Mountain Standard Time"
if %errorlevel% EQU 3 set TZ="Central Standard Time"
if %errorlevel% EQU 4 set TZ="Eastern Standard Time"
echo.
tzutil /s %TZ%
echo Timezone has been updated to %TZ%
pause
