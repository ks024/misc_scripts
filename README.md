# Daily Life Scripts

This repository contains a collection of simple scripts designed to automate everyday tasks and make life easier.

## List of Scripts

- [Check ISP](#check-isp)
- [Set Network IP Manually](#set-network-ip)
- [Set IP Automatic DHCP](#set-ip-automatic-dhcp)

## Scripts

### [Check ISP](01_check_isp.bat)

This Windows batch script performs a traceroute to a specified IP address and analyzes the results to identify the connected Internet Service Provider (ISP). It runs a tracert command, saves the output to a temporary file, and then searches for known ISP IP addresses within the results. The script is designed to be easily configurable and extensible, allowing for multiple ISPs to be checked efficiently. It provides clear output messages about the identified ISP or if no known ISP is found, and includes error handling for common issues.

### [Set Network IP](02_set_network_ip.bat)

 This Batch file script configures network settings on a specified Windows computer by assigning a static IP, subnet mask, and gateway values to a designated Ethernet interface (Ethernet 4 in this example). It sets both primary and secondary DNS server addresses to facilitate network connectivity and address resolution. The script uses netsh commands to alter the IP configuration without needing direct user intervention for each setting after initial execution. Additionally, it outputs a confirmation message upon successful completion of the operations.

### [Set IP Automatic DHCP](03_set_ip_automatic.bat)

 This Batch file script configures network settings on a specified Windows computer by assigning a static IP, subnet mask, and gateway values to a designated Ethernet interface (Ethernet 4 in this example). It sets both primary and secondary DNS server addresses to facilitate network connectivity and address resolution. The script uses netsh commands to alter the IP configuration without needing direct user intervention for each setting after initial execution. Additionally, it outputs a confirmation message upon successful completion of the operations.
