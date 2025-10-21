# WSL2 Ubuntu Development Box - Claude Code Optimized

**Version**: 1.0.2  
**Status**: Phase 0 Complete ✅ | Phase 1 Ready ⚡  
**Target**: WSL2 Ubuntu 24.04 LTS

## 🎯 Overview

Automated setup for a production-grade WSL2 Ubuntu development environment optimized for Claude Code agentic development.

### Three-Layer Architecture

```
Layer 3: AI Development Stack (Phases 10-13)
├── MCP Ecosystem (Universal integration protocol)
├── Task Master (Intelligent task orchestration)
├── SuperClaude Framework (Execution acceleration)
└── Claude Code CLI + Gemini CLI

Layer 2: Development Environment (Phases 3-9)
├── Languages: Python 3.12, Node.js LTS, Rust, Bun
├── Cloud: gcloud, aws, az, oci
├── IaC: Terraform, Ansible
├── Databases: PostgreSQL, Oracle Client, Supabase
├── Shell: Zsh + Oh My Zsh + Productivity tools
└── Productivity: bat, fzf, ripgrep, eza

Layer 1: System Foundation (Phases 0-2)
├── Package Manager: Homebrew (primary)
├── System: build-essential, curl, git, libraries
├── Python Manager: uv (fast pip alternative)
├── Node Manager: fnm (fast nvm alternative)
└── Rust Manager: cargo (via Homebrew)
```

## 🚀 Quick Start

### Prerequisites

- Fresh WSL2 Ubuntu 24.04 LTS installation
- Internet connectivity
- User has sudo privileges

### Phase 0: Bootstrap (Complete ✅)

```bash
# Clone repository
cd ~
git clone https://github.com/pierreribeiro/claude-code-dev-box.git
cd claude-code-dev-box

# Switch to develop branch
git checkout develop

# Make scripts executable
chmod +x scripts/*.sh

# Run Phase 0 bootstrap
./scripts/phase-0-bootstrap.sh
```

**Expected outcome**: Git repository initialized, Ansible installed, directory structure created.

### Phase 1: System Preparation (Ready ⚡)

```bash
# After Phase 0 completes, update repository
cd ~/claude-code-dev-box
git pull origin develop

# Execute Phase 1 (installs build-essential, libraries, utilities)
ansible-playbook playbooks/main.yml --tags phase1 --ask-become-pass

# Verify installation
dpkg -l | grep build-essential
gcc --version
```

**Expected outcome**: Build tools, development libraries, and utilities installed.

### Phase 2: Homebrew Installation (Next)

```bash
# After Phase 1 completes
ansible-playbook playbooks/main.yml --tags phase2 --ask-become-pass
```

## 📊 Installation Progress

- [x] **Phase 0**: Bootstrap & Git Repository ✅ **COMPLETE** (v0.1.1 - Bug Fix: PEP 668)
- [x] **Phase 1**: System Preparation (apt packages) ✅ **FIXED** (v1.0.1 - Sudo + Callback)
- [ ] **Phase 2**: Homebrew Installation ⏳ **NEXT**
- [ ] **Phase 3**: Core Tools (git, gh, jq, yq, tree)
- [ ] **Phase 4**: Language Runtimes (Python, Node.js, Rust, Bun)
- [ ] **Phase 5**: Cloud Provider CLIs
- [ ] **Phase 6**: IaC Tools (Terraform, Ansible Navigator)
- [ ] **Phase 7**: Database Clients
- [ ] **Phase 8**: Shell Configuration (Zsh, Oh My Zsh)
- [ ] **Phase 9**: Productivity Tools
- [ ] **Phase 10**: MCP Ecosystem
- [ ] **Phase 11**: Task Master
- [ ] **Phase 12**: SuperClaude Framework
- [ ] **Phase 13**: Claude Code CLI & Gemini CLI

## 📝 Recent Updates

### 2025-10-20: Phase 1 Bug Fix - Ansible Configuration
- **Issue 1**: `sudo: a password is required` error during playbook execution
- **Solution 1**: Changed `become_ask_pass = True` in ansible.cfg
- **Issue 2**: Deprecated `community.general.yaml` callback warning
- **Solution 2**: Updated to `ansible.builtin.default` with `result_format = yaml`
- **Version**: v1.0.1 (ansible.cfg fixes)
- **Commits**: 
  - [Ansible fix commit](https://github.com/pierreribeiro/claude-code-dev-box/commit/142eaf1)
  - [Docs update commit](https://github.com/pierreribeiro/claude-code-dev-box/commit/7100332)

### 2025-10-15: Phase 0 Bug Fix - Ubuntu 24.04 PEP 668 Compliance
- **Issue**: `externally-managed-environment` error when installing pipx via pip
- **Solution**: Changed pipx installation to apt-based (`sudo apt install pipx`)
- **Tag**: `v0.1.1-bugfix-pep668`
- **Tests**: 17/17 PASS on Ubuntu 24.04 LTS
- **Commits**: 
  - [Fix commit](https://github.com/pierreribeiro/claude-code-dev-box/commit/a4ee241)
  - [Docs commit](https://github.com/pierreribeiro/claude-code-dev-box/commit/672bf30)

## 📁 Repository Structure

```
claude-code-dev-box/
├── ansible.cfg                   # Ansible configuration (Fixed ✅)
├── README.md                     # This file
├── .gitignore                    # Git ignore rules
│
├── playbooks/                    # Ansible playbooks
│   └── main.yml                 # Master playbook (Phase 1+)
│
├── roles/                        # Ansible roles
│   ├── system_preparation/      # Phase 1 role ✅
│   └── [Future roles]           # Created incrementally
│
├── inventory/                    # Environment inventories
│   ├── hosts.yml                # Localhost inventory ✅
│   └── group_vars/              # Variables ✅
│       └── all.yml
│
├── scripts/                      # Utility scripts
│   ├── phase-0-bootstrap.sh     # Phase 0 bootstrap ✅
│   ├── generate-phase-control.sh # Control artifact generator ✅
│   └── functional-tests.sh      # Validation tests (Phase 14)
│
├── docs/                         # Documentation
│   ├── PRD_WSL2_ClaudeCode_DevBox_Unified_v1.0.0.md
│   ├── control/                 # Phase control artifacts
│   │   ├── phase-0-control.md  ✅
│   │   └── phase-1-control.md  ✅
│   └── migration/               # Context migration artifacts
│
├── files/                        # Static files for deployment
├── templates/                    # Jinja2 templates
├── vars/                         # Variable files
└── tests/                        # Test infrastructure
```

## 📖 Documentation

- **Main PRD**: [`docs/PRD_WSL2_ClaudeCode_DevBox_Unified_v1.0.0.md`](docs/PRD_WSL2_ClaudeCode_DevBox_Unified_v1.0.0.md)
- **Architecture**: [`docs/wsl2-ubuntu-devenv-architecture.md`](docs/wsl2-ubuntu-devenv-architecture.md)
- **Phase Control**: `docs/control/phase-N-control.md` (generated per phase)
- **Phase 0 Control**: [`docs/control/phase-0-control.md`](docs/control/phase-0-control.md) ✅
- **Phase 1 Control**: [`docs/control/phase-1-control.md`](docs/control/phase-1-control.md) ✅

## ⚡ Phase 1 Execution Guide

### Command to Execute Phase 1
```bash
cd ~/claude-code-dev-box
git pull origin develop
ansible-playbook playbooks/main.yml --tags phase1 --ask-become-pass
```

### Expected Results
```bash
# After successful execution:
$ dpkg -l | grep build-essential
ii  build-essential  12.10ubuntu1  amd64  Informational list

$ gcc --version
gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0

$ which git curl wget
/usr/bin/git
/usr/bin/curl
/usr/bin/wget
```

### What Gets Installed (~300-400 MB)
- **Build Tools**: gcc, g++, make, build-essential
- **Development Libraries**: libssl-dev, libffi-dev, libreadline-dev, libsqlite3-dev, zlib1g-dev
- **Utilities**: vim, nano, htop, net-tools, compression tools

## ⏱️ Estimated Timeline

| Phase Group | Phases | Duration | Dependencies |
|-------------|--------|----------|-------------|
| **Foundation** | 0-2 | 2-3h | None |
| **Development** | 3-9 | 8-10h | Foundation |
| **AI Stack** | 10-13 | 6-8h | Development |
| **Validation** | 14 | 2h | All |
| **Total** | 0-14 | ~20-24h | Progressive |

## 🎯 Success Metrics

| Metric | Target | Validation |
|--------|--------|------------|
| Installation Time | <90 min | Timed on fresh VM |
| Reproducibility | 100% | 3 test VMs |
| Idempotency | 100% | 3 consecutive runs |
| Ansible Lint Score | >95% | `ansible-lint` |
| AI Feature Adoption | 80% | 4-week usage |

## 🛠️ Development Philosophy

- **Phased Development**: Incremental, session-based implementation
- **Context Migration**: Each phase generates control + migration artifacts
- **Idempotency**: All playbooks can run multiple times safely
- **Rollback Capable**: Git tags enable phase-by-phase rollback
- **Production Ready**: Error handling, validation, documentation built-in

## 🐛 Known Issues & Fixes

### Phase 1 - Ansible Configuration (Fixed ✅)
- **Issue**: Sudo password required error
- **Fix**: Use `--ask-become-pass` flag (updated in ansible.cfg)
- **Status**: Resolved in commit 142eaf1

### Phase 0 - PEP 668 Compliance (Fixed ✅)
- **Issue**: pipx installation via pip blocked on Ubuntu 24.04
- **Fix**: Install pipx via apt package manager
- **Status**: Resolved in v0.1.1-bugfix-pep668

## 🤝 Contributing

This is a personal development environment setup. For issues or suggestions:

1. Open an issue describing the problem/enhancement
2. Reference specific phase if applicable
3. Include system information (Ubuntu version, existing tools)

## 📜 License

MIT License - See LICENSE file for details

## 👤 Author

**Pierre Ribeiro** - Senior Data Engineer  
Optimized for Claude Code agentic development workflows

---

**Current Status**: 
- ✅ Phase 0 Complete (v0.1.1 - PEP 668 Fix)
- ✅ Phase 1 Ready for Execution (v1.0.1 - Ansible Config Fixed)

**Next Action**: Execute Phase 1 → `ansible-playbook playbooks/main.yml --tags phase1 --ask-become-pass`

**Git Repository**: https://github.com/pierreribeiro/claude-code-dev-box  
**Branch**: develop
