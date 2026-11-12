# RamGhostAndriod_Cyber_TooKit

A beginner-friendly Android cybersecurity learning toolkit for **Termux**.

## Included tools
- `cyber` — interactive menu
- `netcheck` — basic connectivity and DNS diagnostics
- `myip` — public IP lookup
- `dnscheck` — common DNS record lookup
- `webcheck` — HTTP response and common security-header inspection
- `portscan` — basic Nmap scan of an authorized target
- `sysinfo` — basic Android/Termux device information
- `passcheck` — local password-composition checker

> Use scanning features only on devices and networks you own or have explicit permission to assess. This toolkit does not exploit systems or guarantee security.

## Install in Termux

1. Install Termux from a trusted source and open it.
2. Extract this ZIP into your phone's Downloads folder.
3. In Termux, allow storage access:
   ```bash
   termux-setup-storage
   ```
4. Run the installer (adjust the path if you extracted it somewhere else):
   ```bash
   bash ~/storage/downloads/RamGhostAndriod_Cyber_TooKit/install.sh
   ```
5. Start the toolkit:
   ```bash
   cyber
   ```

If your file manager extracts the folder under a different location, use that folder's actual path in step 4.

## USB transfer

Copy the ZIP file to your phone using a USB cable, then extract it to `Internal Storage/Download/`. Open Termux and follow the install steps above. No GitHub account or upload is required.

## Reports

Port-scan reports are stored in:
```text
~/cyber-reports/
```

## Android limitations

Android/Termux may restrict access to low-level network interfaces and Wi-Fi details. Some commands may therefore show limited information without root or additional Android permissions. Root is not required for the included basic features.
