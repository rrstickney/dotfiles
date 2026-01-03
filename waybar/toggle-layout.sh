#!/usr/bin/env bash
set -euo pipefail

CFG_DIR="$HOME/.config/waybar"
WIDE="$CFG_DIR/config.wide.jsonc"
COMPACT="$CFG_DIR/config.compact.jsonc"
LINK="$CFG_DIR/config"

current="$(readlink -f "$LINK" || true)"

if [[ "$current" == "$(readlink -f "$WIDE")" ]]; then
  ln -sf "$COMPACT" "$LINK"
  mode="compact"
else
  ln -sf "$WIDE" "$LINK"
  mode="wide"
fi

pkill waybar || true
nohup waybar >/dev/null 2>&1 & disown

echo "Waybar switched to: $mode"

