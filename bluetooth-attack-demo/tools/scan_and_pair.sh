#!/bin/bash
# Scan and attempt pairing with a Bluetooth device
if [ $# -ne 1 ]; then
  echo "Usage: $0 <TARGET_MAC>"
  exit 1
fi

TARGET_MAC=$1

echo "[*] Scanning for devices..."
hcitool scan

echo "[*] Attempting to pair with $TARGET_MAC..."
bluetoothctl <<EOF
power on
agent on
scan on
pair $TARGET_MAC
connect $TARGET_MAC
EOF
