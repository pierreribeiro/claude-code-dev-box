#!/bin/bash
# Phase 0: Bootstrap & Git Repository Setup
# WSL2 Ubuntu 24.04 Development Environment
# Author: Pierre Ribeiro
# Version: 1.0.0

set -e  # Exit on error
set -u  # Exit on undefined variable

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Banner
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "  WSL2 Ubuntu DevBox - Phase 0: Bootstrap"
echo "  Claude Code Optimized Setup"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then
   log_error "Please do not run as root. Use your regular user account."
   exit 1
fi

# Verify Ubuntu version
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID" != "ubuntu" ]]; then
        log_error "This script is designed for Ubuntu. Detected: $ID"
        exit 1
    fi
    log_info "Detected: $PRETTY_NAME"
else
    log_error "Cannot detect OS version"
    exit 1
fi

# Update system
log_info "Updating system packages..."
sudo apt update && sudo apt upgrade -y
log_success "System updated"

# Install Git first (if not already installed)
log_info "Checking Git installation..."
if ! command -v git &> /dev/null; then
    log_info "Installing Git..."
    sudo apt install -y git
    log_success "Git installed"
else
    log_info "Git already installed: $(git --version)"
fi

# Verify we're in the right directory
if [ ! -f "README.md" ] || [ ! -d "scripts" ]; then
    log_error "Please run this script from the project root directory"
    exit 1
fi

log_info "Project directory verified: $(pwd)"

# Install prerequisites for Ansible
log_info "Installing Ansible prerequisites..."
sudo apt install -y \
    software-properties-common \
    python3 \
    python3-pip \
    python3-venv
log_success "Prerequisites installed"

# Install pipx (for Ansible)
log_info "Installing pipx..."
if ! command -v pipx &> /dev/null; then
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    export PATH="$HOME/.local/bin:$PATH"
    log_success "pipx installed"
else
    log_info "pipx already installed: $(pipx --version)"
fi

# Add Ansible PPA
log_info "Adding Ansible PPA..."
sudo add-apt-repository --yes --update ppa:ansible/ansible
log_success "Ansible PPA added"

# Install Ansible
log_info "Installing Ansible..."
if ! command -v ansible &> /dev/null; then
    sudo apt install -y ansible
    log_success "Ansible installed: $(ansible --version | head -1)"
else
    log_info "Ansible already installed: $(ansible --version | head -1)"
fi

# Create directory structure if not exists
log_info "Ensuring directory structure..."
mkdir -p playbooks
mkdir -p roles
mkdir -p inventory/{group_vars,host_vars}
mkdir -p files
mkdir -p templates
mkdir -p vars
mkdir -p docs/{control,migration}
mkdir -p tests
log_success "Directory structure verified"

# Git configuration
log_info "Configuring Git..."
read -p "Enter your Git username (default: Pierre Ribeiro): " git_user
git_user=${git_user:-"Pierre Ribeiro"}

read -p "Enter your Git email: " git_email
if [ -z "$git_email" ]; then
    log_error "Git email is required"
    exit 1
fi

git config user.name "$git_user"
git config user.email "$git_email"
log_success "Git configured for: $git_user <$git_email>"

# Commit Phase 0 if changes exist
if [[ -n $(git status -s) ]]; then
    log_info "Committing Phase 0 changes..."
    git add .
    git commit -m "Phase 0: Bootstrap and initial setup complete"
    git tag -a phase-0-complete -m "Phase 0 Complete: Bootstrap"
    log_success "Phase 0 committed and tagged"
else
    log_info "No changes to commit (already up to date)"
fi

# Generate Phase 0 control artifact
log_info "Generating Phase 0 control artifact..."
if [ -f "scripts/generate-phase-control.sh" ]; then
    chmod +x scripts/generate-phase-control.sh
    ./scripts/generate-phase-control.sh 0
    log_success "Control artifact generated"
else
    log_warning "Control artifact generation script not found"
fi

# Summary
echo ""
echo "═══════════════════════════════════════════════════════════"
log_success "Phase 0 Complete!"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "✅ Git repository initialized"
echo "✅ Ansible installed: $(ansible --version | head -1)"
echo "✅ pipx installed: $(pipx --version)"
echo "✅ Directory structure created"
echo "✅ Git configured"
echo ""
echo "📊 Repository Status:"
git status --short
echo ""
echo "📋 Next Steps:"
echo "  1. Review: cat README.md"
echo "  2. Review control artifact: cat docs/control/phase-0-control.md"
echo "  3. Proceed to Phase 1: ansible-playbook playbooks/main.yml --tags phase1"
echo ""
echo "💡 Tip: Run './scripts/generate-phase-control.sh N' after each phase"
echo ""
