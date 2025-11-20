#!/usr/bin/env bash
# ==========================================================
# Sets up wallpaper and themes using `pywal`
# ==========================================================
set -e

if ! pacman -Qi "python-pywal" &> /dev/null 2>&1; then
    echo "Could not detect pywal, installing now..."
    sudo pacman -S --noconfirm --needed python-pywal
fi

if ! pacman -Qi "hyprpaper" &> /dev/null 2>&1; then
    echo "Could not detect hyprpaper, installing now..."
    sudo pacman -S --noconfirm --needed hyprpaper
fi
mkdir -p "$HOME/.cache/wal"
echo "Pywal setup is complete."

# Pick wallpaper and generate theme
wall = "$HOME/.config/backgrounds/group_of_pink_flowers.jpg"
wal -q -i "$wall"