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

Step 1: Prerequisites

Before you begin, ensure you have the following:

A macOS system.
WireGuard installed and configured with a VPN profile.
Administrative privileges (sudo access).
Basic familiarity with using the Terminal in macOS.

Step 2: Download the Script

You can download the script from GitHub or copy its contents and create a new file on your system using a text editor (e.g., vpn-killswitch.sh).

Step 3: Customize the Script

Open the script in a text editor and make the following customizations:

Set the VPN_INTERFACE variable to match the name of your WireGuard VPN interface (e.g., "utun0").

Step 4: Make the Script Executable

Open Terminal and navigate to the directory where you saved the script. Use the chmod command to make the script executable:

bash
Copy code
chmod +x vpn-killswitch.sh

Step 5: Run the Script

Execute the script with administrative privileges using sudo:

bash
Copy code
sudo ./vpn-killswitch.sh
You will be prompted to enter your macOS user password.

Current Limitations: You must use the unkillswitch.sh or sudo pfctl -d to stop blocking all traffic. Be my guest if someone can figure out a way to implement both.
