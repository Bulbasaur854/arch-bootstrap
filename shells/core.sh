# ==========================================================
# Installs core system / development tools
# ==========================================================
#!/usr/bin/env bash
set -e

packages_to_install=(
  "base-devel"  # Needed for building AUR packages
  "curl"        # Download tools
  "wget"        # |
  "zsh"         # Shell
  "neovim"      # Editor
  "tree"        # Directory tree viewer
  "rsync"       # File synchronization and backup
)

echo "Installing pacman packages..."
for $package in "${packages_to_install[@}"; do
  sudo pacman -S --noconfirm --needed $package
done
