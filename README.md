# WSL2 Ubuntu Development Box - Claude Code Optimized

**Version**: 1.0.0  
**Status**: Phase 0 Complete  
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

### Phase 0: Bootstrap

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

### Phases 1-2: System Foundation (Next Steps)

```bash
# After Phase 0 completes
ansible-playbook playbooks/main.yml --tags phase1,phase2
```

## 📊 Installation Progress

- [x] **Phase 0**: Bootstrap & Git Repository ✅
- [ ] **Phase 1**: System Preparation (apt packages)
- [ ] **Phase 2**: Homebrew Installation
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

## 📁 Repository Structure

```
claude-code-dev-box/
├── ansible.cfg                   # Ansible configuration (Phase 1)
├── README.md                     # This file
├── .gitignore                    # Git ignore rules
│
├── playbooks/                    # Ansible playbooks
│   └── main.yml                 # Master playbook (Phase 1+)
│
├── roles/                        # Ansible roles
│   └── [Phase-specific roles]   # Created incrementally
│
├── inventory/                    # Environment inventories
│   ├── hosts.yml                # Localhost inventory (Phase 1)
│   └── group_vars/              # Variables (Phase 1)
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
- **Context Migration**: `docs/migration/phase-N-migration.md` (generated per phase)

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

**Current Status**: Phase 0 Complete ✅  
**Next Action**: Review README → Run `./scripts/phase-0-bootstrap.sh` → Proceed to Phase 1
