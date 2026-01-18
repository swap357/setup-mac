#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

# Backup existing
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.bak
[ -f ~/.config/starship.toml ] && cp ~/.config/starship.toml ~/.config/starship.toml.bak

# Apply
cp "$DIR/zshrc" ~/.zshrc
mkdir -p ~/.config
cp "$DIR/starship.toml" ~/.config/starship.toml

# Fix permissions
chmod go-w "$(brew --prefix)/share" "$(brew --prefix)/share/zsh" 2>/dev/null || true
rm -f ~/.zcompdump*

echo "Done. Open new terminal."
