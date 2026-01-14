# --- 1. Environment Variables ---
export PATH="/opt/homebrew/bin:$PATH"
export EDITOR='vim'

# --- 2. Plugin Initialization (Must be installed via Brew) ---
# Note: Install these first: brew install zsh-autosuggestions zsh-syntax-highlighting
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- 3. Tool Initializations ---
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# --- 4. Modern Aliases ---
alias ll="eza -lh --icons --grid --git"
alias cat="bat"
alias cd="z"
alias top="btop"
alias help="tldr"
alias k="kubectl"
alias kctx="kubie ctx"
alias kns="kubie ns"

# --- 5. History Settings ---
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt SHARE_HISTORY

# Load chruby
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh

# Automatically use the latest installed Ruby
chruby ruby

# UV Python manager
eval "$(uv generate-shell-completion zsh)"
export PATH="$HOME/.local/bin:$PATH"
