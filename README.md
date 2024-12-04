# Bluetooth Attack Demo
**Disclaimer**: This repository is for educational purposes only. Use responsibly and only in environments where you have explicit permission.

This project demonstrates how to disrupt a Bluetooth speaker connection and establish a new connection to play arbitrary audio.

## Features
- Scan and identify nearby devices
- Disconnect existing connections
- Pair and stream audio to the target device

## Structure
- `tools/`: Scripts for scanning, pairing, and spoofing.
- - `docs/`: Documentation for setup and usage.

## Usage
1. Install required tools: `bluetoothctl`, `hcitool`, and `l2ping`.
2. Run the scripts in `tools/` as needed.

## Legal Disclaimer
The authors are not responsible for misuse of this project

# Repository Structure 🌵
├── README.md           # Overview of the project and usage instructions
├── LICENSE             # Add a license (e.g., MIT, GPL)
bluetooth-attack-demo/
├── tools/
│   ├── spoof_mac.sh    # Script to spoof MAC address
│   ├── scan_and_pair.sh# Script to scan and pair with devices
│   └── disconnect.sh   # Script to disconnect the current device
└── docs/
    ├── usage.md        # Detailed guide on using the scripts
    ├── setup.md        # Prerequisites and setup instructions
    └── defense.md      # Guide for protecting against similar attacks

# Usage Guide
## Prerequisites
- Install `bluetoothctl`, `hcitool`, `l2ping`, and `macchanger`.
- Ensure Bluetooth is enabled on your attacker device.

## Steps
1. **Identify Target**:
   ```bash
   hcitool scan
   ```
2. Disconnect Existing Device:
  ```bash
  ./tools/disconnect.sh <TARGET_MAC>
  ```
3. Spoof MAC Address:
  ```bash
  ./tools/spoof_mac.sh <TARGET_MAC> <INTERFACE>
  ```
4. Pair and Connect:
  ``` 
  ./tools/scan_and_pair.sh <TARGET_MAC>
  ```
