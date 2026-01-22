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
brew install zoxide starship fzf eza bat btop tldr jq yq

# Ruby version manager
brew install chruby ruby-install

# Install latest Ruby
echo "Installing latest Ruby..."
ruby-install ruby

# Python (uv)
brew install uv

# Kubernetes tools
brew install kubectl kubie k9s stern kubectx kustomize

# Observability & Debugging
brew install dive grype trivy

# Cloud CLIs
brew install awscli azure-cli google-cloud-sdk

# Infrastructure/GitOps
brew install argocd flux kustomize

# Security & Secrets
brew install sops age vault

# Networking & Service Mesh
brew install cilium-cli

# Terraform
brew install terraform terraform-docs tfswitch

# Development
brew install gh pre-commit act

# Helm
brew install helm helm-docs

# Applications
brew install --cask ghostty zed

echo "Done! Run ./install.sh to symlink dotfiles."
