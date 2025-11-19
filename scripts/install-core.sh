#!/usr/bin/env bash
# ==========================================================
# Installs core system / development tools
# ==========================================================
set -e

packages_to_install=(
  "base-devel"      # Needed for building AUR packages
  "curl"            # Download tools
  "wget"            # |
  "zsh"             # Shell
  "neovim"          # Editor
  "tree"            # Directory tree viewer
  "rsync"           # File synchronization and backup
  "fzf"             # Fuzzy finder
  "fd"              # Fast file search
  "ripgrep"         # Fast grep replacement
  "stow"            # Dotfile manager
)

for package in "${packages_to_install[@]}"; do
  echo "Installing: $package"
  sudo pacman -S --noconfirm --needed "$package"
done

echo "Core packages installed successfully."
