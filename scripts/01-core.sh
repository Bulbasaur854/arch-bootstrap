#!/usr/bin/env bash
# ==========================================================
# Installs core system / development tools
# ==========================================================
set -e

packages_to_install=(
  "base-devel" # Needed for building AUR packages
  "curl"       # Download tools
  "wget"       # |
  "zsh"        # Shell
  "neovim"     # Editor
  "tree"       # Directory tree viewer
  "rsync"      # File synchronization and backup
  "fzf"        # Fuzzy finder
  "fd"         # Fast file search
  "ripgrep"    # Fast grep replacement
  "stow"       # Dotfile manager
  "jq"         # JSON `sed`
  "starship"   # Terminal prompt
  "bat"        # Better `cat`
  "zoxide"     # Better `cd`
  "p7zip"      # 7-zip
  "resvg"      # SVG preview
  "yazi"       # File explorer
)

echo "Installing core system / development tools..."
for package in "${packages_to_install[@]}"; do
  echo "Installing: $package"
  sudo pacman -S --noconfirm --needed "$package"
done
echo "Core packages installed successfully."

# Setup AUR installer (`yay`)
echo "Setting up AUR installer..."
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "AUR installer setup successful."
