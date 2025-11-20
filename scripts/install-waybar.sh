#!/usr/bin/env bash
# ==========================================================
# Installs waybar,
# along with packages required for my config
# ==========================================================
set -e

packages_to_install=(
    "impala"    # TUI wifi managaer
    "wiremix"   # TUI audio mixer 
)

# Check if waybar is installed. If not, install it
if ! pacman -Qi "waybar" &> /dev/null 2>&1; then
    echo "Could not detect waybar, installing now..."
    sudo pacman -S --noconfirm --needed extra/waybar
fi

echo "Installing packages required for my config..."
for package in "${packages_to_install[@]}"; do
  echo "Installing: $package"
  sudo pacman -S --noconfirm --needed "$package"
done
echo "Waybar setup is complete."