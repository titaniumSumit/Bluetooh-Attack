#!/bin/bash
# Spoof a MAC address for Bluetooth
if [ $# -ne 2 ]; then
  echo "Usage: $0 <TARGET_MAC> <INTERFACE>"
  exit 1
fi

TARGET_MAC=$1
INTERFACE=$2

echo "[*] Spoofing MAC address to $TARGET_MAC on $INTERFACE"
sudo ifconfig $INTERFACE down
sudo macchanger -m $TARGET_MAC $INTERFACE
sudo ifconfig $INTERFACE up
echo "[+] MAC address spoofed."
