@echo off
setlocal

:: Define network interface name and IP configuration
set INTERFACE_NAME=Ethernet 4
set IP_ADDRESS=10.7.27.102
set SUBNET_MASK=255.255.255.0
set GATEWAY=10.7.27.1
set PRIMARY_DNS=202.45.144.2
set SECONDARY_DNS=202.45.144.3

:: Set static IP address and subnet mask
netsh interface ip set address name="%INTERFACE_NAME%" static %IP_ADDRESS% %SUBNET_MASK% %GATEWAY%

:: Set primary DNS server
netsh interface ip set dns name="%INTERFACE_NAME%" static %PRIMARY_DNS%

:: Add secondary DNS server
netsh interface ipv4 add dnsservers "%INTERFACE_NAME%" address=%SECONDARY_DNS% index=2

REM Confirmation message
echo %INTERFACE_NAME% configured to Static IP address.

:: Pause to view the results
pause

endlocal
