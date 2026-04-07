@echo off
echo.

echo Device hostname
hostname
echo.

::echo Laptop specification
::wmic csproduct get Name,Vendor,IdentifyingNumber,UUID
::echo.

echo Laptop BIOS version
powershell Get-CimInstance Win32_BIOS
echo.

echo GPU specification
powershell "Get-CimInstance -ClassName Win32_VideoController | Select-Object Name,Description,DriverVersion,DriverDate,Status,AdapterRAM"

::wmic path win32_videocontroller get name,DriverVersion,DriverDate,Description,Status,AdapterRAM
echo.

echo Memory specifications
powershell Get-CimInstance -ClassName CIM_PhysicalMemory
::powershell "(Get-CimInstance -ClassName CIM_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB"
echo.

echo Harddrive specifications
powershell Get-PhysicalDisk
echo.

echo Network specifications
powershell "Get-NetAdapter -Name * -Physical | Format-List -Property name,InterfaceDescription,DriverVersion"
echo.

pause
