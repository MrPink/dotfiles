# Dotfiles

My macOS configuration files.

## Contents

- `.zshrc` - Zsh configuration with aliases, plugins, and tool integrations
- `.zprofile` - Zsh profile for environment setup
- `.vimrc` - Vim configuration
- `.gitconfig` - Git aliases and settings
- `.tmux.conf` - tmux configuration with vim-style keybindings
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

## Tools Included

### Kubernetes
- kubectl, kubie, k9s, stern, kubectx, kustomize
- Cilium CLI for networking

### Cloud Providers
- AWS CLI, Azure CLI, Google Cloud SDK

### Infrastructure as Code
- Terraform, Terragrunt, tfswitch, terraform-docs
- ArgoCD CLI, Flux CLI

### Security & Secrets
- SOPS, age, Vault

### Observability
- dive (Docker image explorer)
- grype, trivy (vulnerability scanning)

### Development
- GitHub CLI, pre-commit, act (GitHub Actions locally)
- Helm, helm-docs

## Shell Aliases

### Git
| Alias | Command |
|-------|---------|
| `gs` | git status |
| `get_hash` | Copy current git commit hash |
| `git st` | Status (short) |
| `git co` | Checkout |
| `git br` | Branch |
| `git ci` | Commit |
| `git lg` | Pretty log graph |
| `git lc` | Log compact |
| `git amend` | Amend last commit |
| `git undo` | Undo last commit (soft) |
| `git wip` | Quick WIP commit |

### Kubernetes
| Alias | Command |
|-------|---------|
| `k` | kubectl |
| `kc` | kubectx |
| `kn` | kubens |
| `k9` | k9s |
| `logs` | stern |

### Infrastructure
| Alias | Command |
|-------|---------|
| `tf` | terraform |
| `tg` | terragrunt |
| `v` | vault |

### Docker
| Alias | Command |
|-------|---------|
| `di` | dive |
| `scan` | grype |

### Modern CLI Tools
| Alias | Command |
|-------|---------|
| `ll` | eza (better ls) |
| `cat` | bat (syntax highlighting) |
| `cd` | zoxide (smart cd) |
| `top` | btop (better top) |
| `help` | tldr (simplified man pages) |

## Custom Functions

### Kubernetes
- `kexec <pod> [command]` - Exec into pod (default: sh)
- `klogs <pod>` - Follow pod logs
- `kpf <pod> <port>` - Port forward to pod
- `kgetall` - Get all resources in namespace
- `kdecode-secret <name>` - Decode and display secret values
- `set_ns <namespace>` - Set current namespace
- `get-pods-on-node <node>` - List all pods on a node
- `hubble-cluster <command>` - Run command on all Hubble pods

### AWS
- `ecr_login` - Login to ECR

### Terraform
- `remove_tg_cache` - Clean Terragrunt cache
- `remove_tg_locks` - Remove Terraform lock files
- Auto-switch Terraform version based on `.terraform-version`

### Docker
- `docker-clean` - Prune containers, images, and volumes

### Utilities
- `pem2json` - Convert PEM to JSON format
- `histsearch <query>` - Search command history

## tmux Keybindings

### Prefix Key
- Changed from `Ctrl-b` to `Ctrl-a` (easier to reach)

### Window & Pane Management
- `Ctrl-a |` - Split pane vertically
- `Ctrl-a -` - Split pane horizontally
- `Ctrl-a h/j/k/l` - Navigate panes (vim-style)
- `Ctrl-a H/J/K/L` - Resize panes (vim-style)
- `Ctrl-a r` - Reload tmux config

### Features
- Mouse support enabled
- Vim-style copy mode
- 256 color support
- 10,000 line history buffer
- Window renumbering on close
