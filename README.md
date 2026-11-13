RamGhost Android Cyber Toolkit V2.0

A beginner-friendly, non-root Android cybersecurity and network diagnostics toolkit for Termux.

Features

1. Network diagnostics
2. Public IP lookup
3. DNS investigation
4. WHOIS lookup
5. Traceroute
6. Website HTTP security header inspection
7. Authorized Nmap port scanning
8. SSL/TLS certificate inspection
9. Android system information
10. Local password composition checker
11. SHA-256 file hashing
12. Diagnostic report generation
13. Toolkit ZIP backup
14. Termux package updates

Included Scripts

Script| Purpose
cyber| Interactive toolkit menu
netcheck| Network diagnostics
myip| Public IP lookup
dnscheck| DNS record investigation
whoischeck| WHOIS lookup
trace| Traceroute
portscan| Authorized Nmap scanning
webcheck| HTTP header inspection
tlscheck| SSL/TLS certificate inspection
sysinfo| Android and Termux information
passcheck| Password composition checker
hashfile| SHA-256 file hashing
report| Diagnostic report generation
backup| Toolkit ZIP backup
update| Termux package updates
install.sh| Toolkit installer

Requirements

- Android device
- Termux
- Internet connection
- No root access required

Installation

Install Git:

pkg update
pkg install git

Clone the repository:

git clone https://github.com/ramghost93-arch/RamGhostAndriod_Cyber_TooKit.git

Enter the project:

cd RamGhostAndriod_Cyber_TooKit

Install the toolkit:

bash install.sh

Launch:

cyber

Usage Examples

dnscheck
tlscheck example.com
trace example.com
hashfile README.md
report

Reports and Backups

Diagnostic reports are stored in:

"~/cyber-reports/"

Toolkit ZIP backups are stored in your Termux home directory.

Safety and Responsible Use

- Only scan devices and networks you own or have explicit permission to assess.
- Do not use this toolkit for unauthorized access or disruption.
- Password composition checks do not guarantee password security.
- Results depend on network connectivity and Android/Termux limitations.
- Intended for learning, troubleshooting, and defensive security.

GitHub

https://github.com/ramghost93-arch/RamGhostAndriod_Cyber_TooKit
