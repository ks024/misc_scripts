@echo off

:: Loop through a list of networks and add routes to each
for %%A in (
    10.7.252.0    :: Network 1
    10.7.253.0    :: Network 2
    10.7.4.0      :: Network 3
    10.111.173.0  :: Network 4
) do (
    :: Delete route
    delete route %%A 
)

:: Pause the script execution to allow the user to see any output or errors
pause

