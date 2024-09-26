@echo off
setlocal

REM Define network interface name
set INTERFACE_NAME=Ethernet 4

REM Reset the NIC to obtain IP address and DNS automatically
echo Configuring %INTERFACE_NAME% to obtain IP address and DNS automatically...
netsh interface ipv4 set address "%INTERFACE_NAME%" source=dhcp
netsh interface ipv4 set dns "%INTERFACE_NAME%" source=dhcp

REM Confirmation message
echo %INTERFACE_NAME% configured to obtain IP address and DNS automatically.

pause

endlocal
