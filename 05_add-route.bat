@echo off
:: Set the router IP, subnet mask, and metric values as variables for easy modification
set ROUTER_IP=10.7.8.1
set MASK=255.255.255.0
set METRIC=2

:: Loop through a list of networks and add routes to each
for %%A in (
    10.7.252.0    :: Network 1
    10.7.253.0    :: Network 2
    10.7.4.0      :: Network 3
    10.111.173.0  :: Network 4
) do (
    :: Add the route for each network with the specified router IP, subnet mask, and metric
    route -p add %%A mask %MASK% %ROUTER_IP% metric %METRIC%
)

:: Pause the script execution to allow the user to see any output or errors
pause
