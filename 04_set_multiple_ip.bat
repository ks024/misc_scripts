@echo off
setlocal

REM Define variables for network configuration
set INTERFACE_NAME=Ethernet 4
set IP1_ADDRESS=192.168.1.161
set IP1_SUBNET=255.255.255.0
set IP1_GATEWAY=192.168.1.254
set IP1_GWMETRIC=10

set IP2_ADDRESS=10.7.27.102
set IP2_SUBNET=255.255.255.0
set IP2_GATEWAY=10.7.27.1
set IP2_GWMETRIC=20

set PRIMARY_DNS=202.45.144.2
set SECONDARY_DNS=202.45.144.3
set TERTIARY_DNS=1.1.1.1

REM Configure IP addresses and gateways
echo Configuring IP addresses and gateways on %INTERFACE_NAME%...
netsh interface ipv4 add address "%INTERFACE_NAME%" %IP1_ADDRESS% %IP1_SUBNET% gateway=%IP1_GATEWAY% gwmetric=%IP1_GWMETRIC%
netsh interface ipv4 add address "%INTERFACE_NAME%" %IP2_ADDRESS% %IP2_SUBNET% gateway=%IP2_GATEWAY% gwmetric=%IP2_GWMETRIC%

REM Configure DNS servers
echo Configuring DNS servers on %INTERFACE_NAME%...
netsh interface ipv4 set dns name="%INTERFACE_NAME%" static %PRIMARY_DNS% primary
netsh interface ipv4 add dns name="%INTERFACE_NAME%" address=%SECONDARY_DNS% index=2
netsh interface ipv4 add dns name="%INTERFACE_NAME%" address=%TERTIARY_DNS% index=3

echo IP addresses and DNS servers configured successfully.
pause

endlocal
