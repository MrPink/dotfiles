# Dotfiles

My macOS configuration files.

## Contents

- `.zshrc` - Zsh configuration with aliases, plugins, and tool integrations
- `.zprofile` - Zsh profile for environment setup
- `.vimrc` - Vim configuration
- `.gitconfig` - Git aliases and settings
- `.config/starship.toml` - Starship prompt theme
- `.config/git/ignore` - Global gitignore
- `.config/ghostty/config` - Ghostty terminal config
- `.config/btop/btop.conf` - btop system monitor config
- `.config/zed/settings.json` - Zed editor settings

## Installation

```bash
git clone https://github.com/MrPink/dotfiles.git ~/git/dotfiles
cd ~/git/dotfiles
./bootstrap.sh  # Install Homebrew packages
./install.sh    # Symlink dotfiles
./macos.sh      # Configure macOS defaults (optional, run once)
```

The bootstrap script installs all dependencies via Homebrew. The install script backs up existing files before creating symlinks.

## Git Aliases

| Alias | Command |
|-------|---------|
| `git st` | Status (short) |
| `git co` | Checkout |
| `git br` | Branch |
| `git ci` | Commit |
| `git lg` | Pretty log graph |
| `git amend` | Amend last commit |
| `git undo` | Undo last commit (soft) |
| `git wip` | Quick WIP commit |
