#!/bin/bash

# Disable the firewall rules to allow normal internet access
sudo pfctl -d

# Display a message indicating the killswitch is disabled
echo "VPN Killswitch is disabled. Normal internet access is restored."

