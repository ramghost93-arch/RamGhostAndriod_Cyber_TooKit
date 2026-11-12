#!/data/data/com.termux/files/usr/bin/bash
set -e

if [ -z "${PREFIX:-}" ] || [ ! -d "$PREFIX" ]; then
  echo "Please run this installer inside Termux on Android."
  exit 1
fi

echo "[1/4] Updating package lists..."
pkg update -y

echo "[2/4] Installing required packages..."
pkg install -y bash curl dnsutils iputils nmap python

echo "[3/4] Installing toolkit commands..."
mkdir -p "$HOME/bin" "$HOME/cyber-reports"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for script in "$SCRIPT_DIR"/scripts/*; do
  [ -f "$script" ] || continue
  install -m 700 "$script" "$HOME/bin/$(basename "$script")"
done

if ! grep -Fq 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc" 2>/dev/null; then
  printf '\\n# RamGhost Android Cyber Toolkit\\nexport PATH="$HOME/bin:$PATH"\\n' >> "$HOME/.bashrc"
fi

echo "[4/4] Installation complete."
echo "Close and reopen Termux, or run: source ~/.bashrc"
echo "Then start the toolkit with: cyber"
