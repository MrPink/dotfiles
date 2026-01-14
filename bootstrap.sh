#!/bin/bash

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing packages..."

# Shell plugins
brew install zsh-autosuggestions zsh-syntax-highlighting

# Modern CLI tools
brew install zoxide starship fzf eza bat btop tldr

# Ruby version manager
brew install chruby ruby-install

# Kubernetes tools
brew install kubectl kubie

# Applications
brew install --cask ghostty zed

echo "Done! Run ./install.sh to symlink dotfiles."
