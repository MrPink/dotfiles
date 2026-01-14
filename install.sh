#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Files to symlink
FILES=".zshrc .zprofile .vimrc"
CONFIG_DIRS="ghostty btop zed"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Symlink root dotfiles
for file in $FILES; do
    if [ -e "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo "Backing up $HOME/$file to $BACKUP_DIR/"
        mv "$HOME/$file" "$BACKUP_DIR/"
    fi
    if [ -L "$HOME/$file" ]; then
        rm "$HOME/$file"
    fi
    echo "Linking $file"
    ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
done

# Symlink .config directories
mkdir -p "$HOME/.config"
for dir in $CONFIG_DIRS; do
    if [ -e "$HOME/.config/$dir" ] && [ ! -L "$HOME/.config/$dir" ]; then
        echo "Backing up $HOME/.config/$dir to $BACKUP_DIR/"
        mv "$HOME/.config/$dir" "$BACKUP_DIR/"
    fi
    if [ -L "$HOME/.config/$dir" ]; then
        rm "$HOME/.config/$dir"
    fi
    echo "Linking .config/$dir"
    ln -s "$DOTFILES_DIR/.config/$dir" "$HOME/.config/$dir"
done

echo "Done! Backups saved to $BACKUP_DIR"
