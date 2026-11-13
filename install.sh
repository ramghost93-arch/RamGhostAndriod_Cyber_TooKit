#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

# RAMGHOST ANDROID CYBER TOOLKIT V2.0
# Improved, repeatable Termux installer

if [[ -z "${PREFIX:-}" || ! -d "$PREFIX" ]]; then
    echo "[ERROR] Run this installer inside Termux."
    exit 1
fi

if ! command -v pkg >/dev/null 2>&1; then
    echo "[ERROR] Termux package manager not found."
    exit 1
fi

echo "======================================"
echo "       RAMGHOST V2.0 INSTALLER"
echo "======================================"

echo "[1/5] Updating package lists..."
pkg update

echo "[2/5] Installing dependencies..."
pkg install -y bash curl dnsutils inetutils nmap python \
    whois traceroute openssl-tool coreutils zip

echo "[3/5] Creating toolkit directories..."
mkdir -p "$HOME/bin" "$HOME/cyber-reports"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

scripts=(
    cyber netcheck myip dnscheck whoischeck trace portscan
    webcheck tlscheck sysinfo passcheck hashfile report backup update
)

echo "[4/5] Installing toolkit scripts..."

installed=0
missing=0

for script in "${scripts[@]}"; do
    if [[ -f "$SCRIPT_DIR/$script" ]]; then
        install -m 700 "$SCRIPT_DIR/$script" "$HOME/bin/$script"
        echo "[INSTALLED] $script"
        installed=$((installed + 1))
    else
        echo "[WARNING] Missing script: $script"
        missing=$((missing + 1))
    fi
done

echo "[5/5] Configuring Bash PATH..."

touch "$HOME/.bashrc"

PATH_LINE="export PATH=\"\$HOME/bin:\$PATH\""

if ! grep -Fqx "$PATH_LINE" "$HOME/.bashrc"; then
    if ! grep -Fqx '# RamGhost Android Cyber Toolkit' "$HOME/.bashrc"; then
        printf '\n%s\n' '# RamGhost Android Cyber Toolkit' >> "$HOME/.bashrc"
    fi
    printf '%s\n' "$PATH_LINE" >> "$HOME/.bashrc"
fi

export PATH="$HOME/bin:$PATH"

echo
echo "======================================"
echo "       INSTALLATION SUMMARY"
echo "======================================"
echo "Installed scripts: $installed"
echo "Missing scripts:   $missing"
echo "Reports folder:    $HOME/cyber-reports"
echo
echo "Start toolkit with: cyber"
echo "Installation completed."
echo "======================================"
