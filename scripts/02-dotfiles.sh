#!/usr/bin/env bash
# ==========================================================
# Sets up my `dotfiles` repo,
# using `stow` to symlink my configs
# ==========================================================
set -e

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/Bulbasaur854/dotfiles"
REPO_NAME="dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d%H%M%S)"
CONFIG_PATHS=(
  "$HOME/.bashrc"
  "$HOME/.config/backgrounds"
  "$HOME/.config/hypr"
  "$HOME/.config/kitty"
  "$HOME/.config/starship.toml"
  "$HOME/.config/wal"
  "$HOME/.config/waybar"
)
PACKAGES=(
  "backgrounds"
  "bashrc"
  "hypr"
  "kitty"
  "pywal"
  "starship"
  "waybar"
)

if ! pacman -Qi "stow" &>/dev/null 2>&1; then
  echo "Install stow first"
  exit 1
fi

cd $HOME

# Check if repo already exists on system
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "Removing old configs..."
  for path in "${CONFIG_PATHS[@]}"; do
    rm -rf "$path"
  done

  echo "Stowing dotfiles..."
  cd "$REPO_NAME"
  for package in "${PACKAGES[@]}"; do
    stow "$package"
  done
  echo "Stowing successful, refreshing hyprctl"
  hyprctl reload
else
  echo "Failed to clone the repository"
  exit 1
fi
