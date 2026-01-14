# Dotfiles

My macOS configuration files.

## Contents

- `.zshrc` - Zsh configuration with aliases, plugins, and tool integrations
- `.zprofile` - Zsh profile for environment setup
- `.vimrc` - Vim configuration
- `.config/ghostty/config` - Ghostty terminal config
- `.config/btop/btop.conf` - btop system monitor config
- `.config/zed/settings.json` - Zed editor settings

## Dependencies

Install via Homebrew:

```bash
brew install zsh-autosuggestions zsh-syntax-highlighting zoxide starship fzf eza bat btop tldr
```

## Installation

```bash
git clone https://github.com/MrPink/dotfiles.git ~/git/dotfiles
cd ~/git/dotfiles
./install.sh
```

The install script backs up existing files before creating symlinks.
