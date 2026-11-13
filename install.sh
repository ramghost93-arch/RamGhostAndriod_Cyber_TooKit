#!/data/data/com.termux/files/usr/bin/bash
set -e

if [ -z "${PREFIX:-}" ] || [ ! -d "$PREFIX" ]; then
  echo "Run this installer inside Termux."
  exit 1
fi

echo "===== RAMGHOST V2.0 INSTALLER ====="

pkg update

pkg install -y bash curl dnsutils inetutils nmap python \
  whois traceroute openssl-tool coreutils zip

mkdir -p "$HOME/bin" "$HOME/cyber-reports"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

scripts=(
  cyber netcheck myip dnscheck whoischeck trace portscan
  webcheck tlscheck sysinfo passcheck hashfile report backup update
)

for script in "${scripts[@]}"; do
  if [ -f "$SCRIPT_DIR/$script" ]; then
    install -m 700 "$SCRIPT_DIR/$script" "$HOME/bin/$script"
    echo "[INSTALLED] $script"
  else
    echo "[WARNING] Missing script: $script"
  fi
done

if ! grep -Fq '# RamGhost Android Cyber Toolkit' "$HOME/.bashrc" 2>/dev/null; then
  printf '\n# RamGhost Android Cyber Toolkit\nexport PATH="$HOME/bin:$PATH"\n' >> "$HOME/.bashrc"
fi

export PATH="$HOME/bin:$PATH"

echo
echo "===== INSTALLATION COMPLETE ====="
echo "Start toolkit with: cyber"
echo "Reports folder: $HOME/cyber-reports"
