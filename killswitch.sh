#!/bin/bash

# Define the name of your WireGuard VPN interface
VPN_INTERFACE="utun3"

# Enable the firewall rules
sudo pfctl -E

# Create a temporary pf configuration file to block all traffic by default
echo "block all" | sudo pfctl -f - 2>/dev/null

# Allow traffic through the VPN interface
echo "pass out on $VPN_INTERFACE all" | sudo pfctl -f - 2>/dev/null

# Display a message indicating the killswitch is active
echo "VPN Killswitch is active. Only traffic through $VPN_INTERFACE is 
allowed."

# Monitor the VPN connection status and block traffic when VPN is 
disconnected
while true; do
    if ifconfig $VPN_INTERFACE &> /dev/null; then
        # VPN interface exists, VPN is connected
        sleep 5
    else
        # VPN interface doesn't exist, VPN is disconnected, block all 
traffic
        echo "VPN is disconnected. Enforcing killswitch."
        echo "block all" | sudo pfctl -f - 2>/dev/null
        sleep 5
    fi
done

