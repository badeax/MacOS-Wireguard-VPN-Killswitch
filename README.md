# Wireguard-VPN-Killswitch

VPN Killswitch Script

This Bash script is designed to act as a VPN killswitch by maintaining strict control over network traffic when using the WireGuard VPN on a macOS system. It leverages the macOS firewall utility, pfctl, to ensure that only traffic routed through the specified WireGuard VPN interface is allowed, blocking all other traffic when the VPN connection is inactive.

Script Overview:

VPN Interface Configuration: The script starts by defining the name of the WireGuard VPN interface, which you should customize to match your specific setup.
Enabling Firewall Rules: It enables the macOS firewall rules using sudo pfctl -E.
Temporary Default Block: A temporary pf configuration is created to block all network traffic by default. This step ensures that, without an active VPN connection, all outgoing traffic is prevented.
Allowing VPN Traffic: Traffic through the specified VPN interface is explicitly allowed to pass through the firewall.
Status Display: A message is displayed indicating that the VPN Killswitch is active, and only traffic through the designated VPN interface is permitted.
VPN Connection Monitoring: The script enters a loop that continuously monitors the status of the VPN connection. If the VPN interface exists (indicating an active VPN connection), the script waits for 5 seconds. If the VPN interface does not exist (indicating a disconnected VPN), it enforces the killswitch by blocking all traffic and waits for 5 seconds.
