#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Install it from https://brew.sh first, then re-run this script." >&2
  exit 1
fi

echo "==> Installing packages from Brewfile"
brew bundle --file="$REPO_DIR/Brewfile"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    local backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "Backed up existing $dest -> $backup"
  fi
  ln -sfn "$src" "$dest"
  echo "Linked $dest -> $src"
}

echo "==> Linking configs"
link "$REPO_DIR/ghostty/config" "$HOME/.config/ghostty/config"
link "$REPO_DIR/starship.toml" "$HOME/.config/starship.toml"
link "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"

echo "==> Done. Open a new terminal window (or restart Ghostty) to pick up the changes."
