#!/usr/bin/env bash
# ==========================================================
# Sets up wallpaper and themes using `pywal`
# ==========================================================
set -e

wall="$HOME/.config/backgrounds/group_of_pink_flowers.jpg"

if ! pacman -Qi "python-pywal" &>/dev/null 2>&1; then
  echo "Could not detect pywal, installing now..."
  sudo pacman -S --noconfirm --needed python-pywal
fi
mkdir -p "$HOME/.cache/wal"
# Generate theme colors,
# the actual wallpaper setup is done by `hyprpaper.cong`
wal -q -i "$wall"

echo "Pywal setup is complete."
