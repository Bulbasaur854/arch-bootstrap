#!/usr/bin/env bash
# ==========================================================
# Sets up wallpaper and themes using `pywal`
# ==========================================================
set -e

if ! pacman -Qi "python-pywal" &> /dev/null 2>&1; then
    echo "Could not detect pywal, installing now..."
    sudo pacman -S --noconfirm --needed python-pywal
fi
mkdir -p "$HOME/.cache/wal"
echo "Pywal setup is complete."

if ! pacman -Qi "hyprpaper" &> /dev/null 2>&1; then
    echo "Could not detect hyprpaper, installing now..."
    sudo pacman -S --noconfirm --needed hyprpaper
fi

# Generate theme colors,
# the actual wallpaper setup is done by `hyprpaper.cong`
wall="$HOME/.config/backgrounds/group_of_pink_flowers.jpg"
wal -q -i "$wall"
