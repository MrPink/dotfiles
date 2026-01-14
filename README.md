# Dotfiles

My macOS configuration files.

## Contents

- `.zshrc` - Zsh configuration with aliases, plugins, and tool integrations
- `.zprofile` - Zsh profile for environment setup
- `.vimrc` - Vim configuration
- `.config/ghostty/config` - Ghostty terminal config
- `.config/btop/btop.conf` - btop system monitor config
- `.config/zed/settings.json` - Zed editor settings

## Installation

```bash
git clone https://github.com/MrPink/dotfiles.git ~/git/dotfiles
cd ~/git/dotfiles
./bootstrap.sh  # Install Homebrew packages
./install.sh    # Symlink dotfiles
```

The bootstrap script installs all dependencies via Homebrew. The install script backs up existing files before creating symlinks.
