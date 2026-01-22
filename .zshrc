# --- 1. Environment Variables ---
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
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
alias gs="git status"
alias get_hash="git rev-parse HEAD | pbcopy"

# --- 5. History Settings ---
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt SHARE_HISTORY

# --- 6. Ruby Manager ---
# Load chruby
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh

# Automatically use the latest installed Ruby
chruby ruby

# --- 7. Python Manager ---
# UV Python manager
eval "$(uv generate-shell-completion zsh)"

# --- 8. AWS Configuration ---
export AWS_SDK_LOAD_CONFIG=true
export AWS_DEFAULT_REGION=eu-west-1

# --- 9. PATH Configuration ---
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH=$PATH:${GOPATH}/bin:${GOROOT}/bin
export PATH="/opt/homebrew/opt/helm@3/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# --- 10. Kubernetes Helpers ---
export do="--dry-run=client -o yaml"

# --- 11. Man Page Styling ---
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# --- 12. Work-Specific Functions ---
# AWS Functions
function ecr_login {
  $(aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 491384846940.dkr.ecr.eu-west-1.amazonaws.com)
}

# Kubernetes Functions
function set_ns {
  kubectl config set-context --current --namespace=$1
}

function pem2json {
  awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}'
}

function get-pods-on-node {
  if [ -z "$1" ]; then
    echo "Please provide a node name"
    return 1
  fi
  kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName=$1
}

function hubble-cluster {
    while read -r p; do
        kubectl -n kube-system exec $p -- $*
    done <<< "$(kubectl -n kube-system get pods -l k8s-app=hubble -o json | jq -r ".items[].metadata.name")"
}

# Utility Functions
alias tg="terragrunt"

function histsearch() { fc -lim "*$@*" 1 }

function remove_tg_cache {
  find . -type d -name ".terragrunt-cache" -exec rm -rf {} +
}

function remove_tg_locks {
  find . -type f -name ".terraform.lock.hcl" -exec rm -f {} +
}

# Terraform Auto-Switch
load-tfswitch() {
  local tfswitchrc_path=".terraform-version"
  if [ -f "$tfswitchrc_path" ]; then
    tfswitch
  fi
}
add-zsh-hook chpwd load-tfswitch
load-tfswitch

# --- 13. Kubectl Completion ---
autoload -U colors; colors
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
