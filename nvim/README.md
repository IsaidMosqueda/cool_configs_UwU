# Neovim Configuration - NvChad v2.0 with OpenCode AI

## Overview

This is a **NvChad v2.0** based Neovim configuration with extensive customizations for Python development, AI assistance, and debugging.

### Recent Migration: Avante → OpenCode

This configuration has been migrated from **Avante.nvim** to **OpenCode.nvim** to provide:

- ✅ **Superior autocomplete** - Built-in file/command/context completion
- ✅ **Full context awareness** - Automatic injection of files, diagnostics, selections  
- ✅ **Permission system** - Built-in safety for file operations
- ✅ **Session management** - Persistent conversations, sharing, timeline navigation
- ✅ **Modern integration** - Works with blink.cmp completion engine

---

## Configuration Highlights

- **Theme**: Nightowl with transparency
- **Language Focus**: Python development
- **AI Assistant**: OpenCode with comprehensive autocomplete and file management
- **Debugging**: Full DAP support with debugpy
- **Git Integration**: Comprehensive git tools

---

## Quick Start

### Installation

1. **Ensure OpenCode CLI** is installed and available in PATH
2. **Clone this configuration** to `~/.config/nvim`
3. **Run Neovim** - Lazy.nvim will install all dependencies automatically

### Key Requirements

- **Neovim 0.8+**
- **OpenCode CLI** (v0.6.3+)
- **Lazy.nvim** (included with NvChad)

---

## Main Features

### 🤖 AI Assistant (OpenCode)

**Primary Commands:**
- `Space + og` - Toggle OpenCode (main toggle)
- `Space + oi` - Open input window (current session)
- `Space + oo` - Open output window
- `Space + o/` - Quick chat with selection context

**Autocomplete Features:**
- `~` - File picker with fuzzy completion
- `@` - Context completion (@this, @buffer, @diagnostics, @files, @agents)
- `/` - Command completion (/models, /help, /agent, /variant)
- Works with blink.cmp or nvim-cmp

**Agent & Variant Commands:**
- `/agent` - Switch between agents (build, plan, general, explore, or custom agents)
- `/variant` - Cycle through model variants (toggle reasoning, different model versions)
- `Tab` - Switch between primary agents during session
- `@agent-name` - Manually invoke subagents in messages

**Commands Menu:**
- `/help` - Show help dialog with all available commands
- `Ctrl+x h` - Open command palette (alternative to /help)
- `/models` - List available models
- `/themes` - List and switch themes
- `/sessions` - List and switch between sessions

**Markdown Glow Commands:**
- `/export` - Export conversation to Markdown and open in editor
- Markdown rendering with syntax highlighting
- Support for headers, code blocks, links, and formatting
- Customizable markdown themes (opencode, tokyonight, catppuccin, etc.)

**Advanced Features:**
- Session management with timeline navigation
- Permission system for file operations
- Diff management and rollback capabilities
- Image paste support from clipboard

### 🐍 Python Development

**LSP Setup:**
- **pyright** for type checking and intelligence
- **ruff** for linting and formatting
- **black** for code formatting (auto-format on save)
- **mypy** for static type checking

**Debugging:**
- **debugpy** with nvim-dap integration
- `Control + b` - Toggle breakpoints
- `Control + d` - Run current Python test method
- nvim-dap-ui for debugging interface

### 🔧 Git Integration

- **nvim-tree** for file management
- **vim-fugitive** for git commands
- **git-blame** for inline blame information
- Telescope git commands for commit history and status

### 🎨 UI Features

- **Nightowl theme** with transparency
- **Telescope** for fuzzy finding
- **Terminal management** with floating/horizontal/vertical layouts
- **Buffer management** with custom keybindings

---

## Key Reference

### AI Assistant (OpenCode)
| Key | Description |
|------|-------------|
| `Space + og` | Toggle OpenCode |
| `Space + oi` | Open input window |
| `Space + o/` | Quick chat with selection |
| `~` | File completion |
| `@` | Context completion |
| `/` | Command completion |
| `Tab` | Switch between agents |
| `/agent` | Change agent |
| `/variant` | Change model variant |
| `/help` | Show commands menu |
| `/themes` | Switch themes |
| `/export` | Export to Markdown |

### Debug Commands
| Key | Description |
|------|-------------|
| `Control + b` | Toggle breakpoint |
| `Control + d` | Run Python test |

### File Management
| Key | Description |
|------|-------------|
| `Space + ff` | Find files |
| `Control + n` | Toggle NvimTree |
| `Tab` / `Shift + Tab` | Buffer navigation |

---

## Configuration Structure

```
/Users/raul/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── core/                   # NvChad core functionality
│   │   ├── mappings.lua        # Core key mappings
│   │   └── ...
│   └── custom/                 # Your customizations
│       ├── chadrc.lua          # Main custom config
│       ├── mappings.lua        # Custom debug mappings
│       ├── plugins.lua         # Custom plugins
│       └── configs/            # Plugin configurations
│           ├── lspconfig.lua   # LSP setup
│           └── null-ls.lua     # Formatting/linting
├── lazy-lock.json              # Plugin lock file
└── NVIM_COMMANDS.md          # Complete command reference
```

---

## Plugin List

### Core (NvChad)
- nvchad/base46 (theme system)
- nvchad/ui (UI components)
- telescope.nvim (fuzzy finder)
- nvim-tree.lua (file explorer)
- which-key.nvim (key mapping help)

### AI Assistant
- **sudo-tee/opencode.nvim** (main AI assistant)
- saghen/blink.cmp (autocompletion)
- MeanderingProgrammer/render-markdown.nvim (markdown rendering)

### Development Tools
- nvim-dap / nvim-dap-ui (debugging)
- nvim-dap-python (Python debugging)
- nvim-lspconfig (LSP configuration)
- none-ls.nvim (null-ls for formatting/linting)

### Git
- vim-fugitive (git commands)
- git-blame.nvim (blame information)

---

## Workflow Tips

### AI Development Workflow
1. Use `Space + og` to open OpenCode
2. Use `~` and `@` to add context files
3. Type prompts with autocomplete support
4. Review changes with built-in diff system
5. Use permission system to control file edits

### Python Development
1. LSP provides real-time diagnostics and completion
2. Use `Space + fm` to format code
3. Set breakpoints with `Control + b`
4. Debug with `Control + d` for test methods
5. Auto-format on save with black

### File Management
1. Use `Space + ff` for file finding
2. Use `Control + n` for file explorer
3. Use telescope for searching across files
4. Manage buffers with Tab navigation

---

## Troubleshooting

### Common Issues

**Space + o doesn't work:**
- Ensure no other keymaps conflict with OpenCode prefix
- Check that OpenCode plugin loaded correctly

**AI not responding:**
- Verify OpenCode CLI is installed and in PATH
- Check configuration for correct API keys

**LSP not working:**
- Ensure Mason has installed pyright and ruff
- Restart Neovim after configuration changes

---

## Documentation

- **Complete Reference**: See `NVIM_COMMANDS.md` for all keybindings
- **OpenCode Commands**: See OpenCode documentation for AI-specific features
- **NvChad Documentation**: See official NvChad docs for base features

---

**Last Updated**: January 2026  
**Migration**: Successfully migrated from Avante to OpenCode with full autocomplete support
