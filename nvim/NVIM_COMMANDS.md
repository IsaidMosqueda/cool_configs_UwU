# Neovim Configuration Commands Guide

## Key Reference Guide (Mac)

### Modifier Keys
- **Space** - Leader key (primary command key)
- **Control** - Ctrl key (labeled "control" on Mac)
- **Command** - Cmd key (labeled "⌘" on Mac) - *Note: Not used in this config*
- **Option** - Alt key (labeled "⌥" on Mac)
- **Shift** - Shift key

### Key Notations Used
- **C** = Control key
- **A** = Option/Alt key  
- **S** = Shift key
- **leader** = Space key
- **tab** = Tab key
- **esc** = Escape key

### Examples
- `C-s` = Press Control + S
- `A-i` = Press Option + I
- `leader ff` = Press Space + F + F
- `S-tab` = Press Shift + Tab

---

## Overview

This is a **NvChad v2.0** based Neovim configuration with extensive customizations for Python development, AI assistance, and debugging.

### Configuration Highlights
- **Theme**: Nightowl with transparency
- **Language Focus**: Python development
- **AI Assistant**: OpenCode with comprehensive autocomplete and file management
- **Debugging**: Full DAP support with debugpy
- **Git Integration**: Comprehensive git tools

---

## Essential Key Mappings

### General Navigation & Editing

| Key | Mode | Description |
|-----|------|-------------|
| **Space** | Leader | Primary leader key for all commands |
| **Control + h** | Normal | Navigate to window left |
| **Control + j** | Normal | Navigate to window down |
| **Control + k** | Normal | Navigate to window up |
| **Control + l** | Normal | Navigate to window right |
| **Control + s** | Normal | Save current file |
| **Control + c** | Normal | Copy whole file to clipboard |
| **Escape** | Normal | Clear search highlights |
| **Space + n** | Normal | Toggle line numbers |
| **Space + rn** | Normal | Toggle relative line numbers |
| **Space + ch** | Normal | Show mapping cheatsheet |
| **Space + o/** | Normal/Visual | Quick chat with selection/current line context (OpenCode) |

### OpenCode Autocomplete Features

The OpenCode plugin provides comprehensive autocomplete capabilities in the input window:

#### File & Context Completion
- **`~`** → Press in input window → File picker with fuzzy matching
- **`@`** → Press in input window → Context completion ( @this, @buffer, @diagnostics, @files, @agents )
- **`#`** → Press in input window → Context items completion ( current file, selection, diagnostics )

#### Command Completion  
- **`/`** → Press in input window → Command completion ( /models, /help, /agent, /variant )

#### Navigation & History
- **`<Tab>`** → Navigate between input/output panes
- **`<Up>/<Down>`** → Navigate through prompt history
- **`<Ctrl-y>`** → Confirm completion ( nvim-cmp style )

#### Smart Integration
- **Works with blink.cmp** (recommended, modern autocomplete)
- **Works with nvim-cmp** (classic, you may already have configured)
- **Automatic file filtering** → Ignores .git, node_modules, build files, etc.
- **Mentions support** → Reference files directly with @filename
- **Permission requests** → Built-in permission system with accept/deny prompts

#### Context Display
- **Context bar** shows current context items at top of input window
- **File sources** → Uses opencode CLI server for cross-platform file listing
- **Max files** → Up to 10 files in completion with intelligent display

### OpenCode Workflow Examples

#### Basic Usage
1. **Start conversation**: `Space + oi` (opens input window)
2. **Type your question**: Regular text with optional context
3. **Use completions**: Press `Tab` for suggestions, `@` for files, `/` for commands
4. **Submit**: Press `Enter` or `Control + s` to send prompt

#### Advanced Features
- **File mentions**: Type `@filename` to add specific files to context
- **Quick chat**: `Space + o/` with text selected → fast AI responses
- **Timeline navigation**: `Space + oT` → browse/undo/redo conversation history
- **Model switching**: `Space + op` → change AI provider or model
- **Permission control**: `a`/`A`/`d` keys to accept/deny file operations
- **Diff management**: `Space + od` → review and manage AI file changes

#### Context Injection
OpenCode automatically captures and injects:
- Current file path and content
- Selected text (visual mode)
- LSP diagnostics (errors/warnings)
- Cursor position and surrounding lines
- Mentioned files from conversation

#### Session Management
- **Persistent sessions** tied to workspace
- **Session picker**: `Space + os` → switch between conversations
- **Share sessions**: Generate shareable links
- **Child sessions**: Create sub-conversations for different tasks

This autocomplete system provides a seamless, context-aware coding experience with built-in safety controls! 🚀

### File & Buffer Management

| Key | Mode | Description |
|-----|------|-------------|
| **Control + n** | Normal | Toggle NvimTree file explorer |
| **Space + e** | Normal | Focus NvimTree |
| **Space + b** | Normal | Create new buffer |
| **Tab** | Normal | Go to next buffer |
| **Shift + Tab** | Normal | Go to previous buffer |
| **Space + x** | Normal | Close current buffer |

### Telescope (Fuzzy Finder)

| Key | Mode | Description |
|-----|------|-------------|
| **Space + ff** | Normal | Find files ( Telescope ) |
| **Space + fa** | Normal | Find all files ( including hidden ) |
| **Space + fw** | Normal | Live grep ( search in files ) |
| **Space + fb** | Normal | Find buffers |
| **Space + fh** | Normal | Help tags |
| **Space + fo** | Normal | Recent files |
| **Space + fz** | Normal | Search in current buffer |
| **Space + th** | Normal | Theme switcher |
| **Space + cm** | Normal | Git commits |
| **Space + gt** | Normal | Git status |
| **Space + pt** | Normal | Pick hidden terminal |
| **Space + ma** | Normal | Telescope marks ( bookmarks ) |

### LSP ( Python Development )

| Key | Mode | Description |
|-----|------|-------------|
| **g + d** | Normal | Go to definition |
| **g + D** | Normal | Go to declaration |
| **g + i** | Normal | Go to implementation |
| **g + r** | Normal | Find references |
| **K** | Normal | Hover documentation |
| **Space + ls** | Normal | LSP signature help |
| **Space + D** | Normal | LSP type definition |
| **Space + ca** | Normal | Code actions |
| **Space + ra** | Normal | LSP rename |
| **Space + fm** | Normal | LSP format code |
| **[ + d** | Normal | Go to previous diagnostic |
| **] + d** | Normal | Go to next diagnostic |
| **Space + lf** | Normal | Floating diagnostic |
| **Space + q** | Normal | Diagnostic setloclist |
| **Space + wa** | Normal | Add workspace folder |
| **Space + wr** | Normal | Remove workspace folder |
| **Space + wl** | Normal | List workspace folders |

### Git Integration

| Key | Mode | Description |
|-----|------|-------------|
| **[ + c** | Normal | Go to previous git hunk |
| **] + c** | Normal | Go to next git hunk |
| **Space + ph** | Normal | Preview git hunk |
| **Space + rh** | Normal | Reset git hunk |
| **Space + gb** | Normal | Git blame current line |
| **Space + td** | Normal | Toggle deleted files |

### Terminal Management

| Key | Mode | Description |
|-----|------|-------------|
| **Option + i** | Normal/Terminal | Toggle floating terminal |
| **Option + h** | Normal/Terminal | Toggle horizontal terminal |
| **Option + v** | Normal/Terminal | Toggle vertical terminal |
| **Space + h** | Normal | Create new horizontal terminal |
| **Space + v** | Normal | Create new vertical terminal |
| **Control + x** | Terminal | Escape terminal mode |

### Comments & Markdown

| Key | Mode | Description |
|-----|------|-------------|
| **Space + /** | Normal/Visual | Toggle comment |
| **Space + mg** | Normal | Preview markdown with Glow |

### Which-Key ( Help System )

| Key | Mode | Description |
|-----|------|-------------|
| **Space + wK** | Normal | Show all keymaps |
| **Space + wk** | Normal | Query specific keymap |

---

## Custom Debugging Commands

### Python Debugging ( DAP )

| Key | Mode | Description |
|-----|------|-------------|
| **Space + db** | Normal | Toggle breakpoint |
| **Space + dpr** | Normal | Run Python test method |

---

## AI Assistant (OpenCode) Commands

### Main AI Commands

| Key | Mode | Description |
|-----|------|-------------|
| **Space + aa** | Normal | Ask AI ( open chat ) |
| **Space + ae** | Normal | Edit with AI |
| **Space + ar** | Normal | Refresh AI response |
| **Space + af** | Normal | Focus AI sidebar |
| **Space + at** | Normal | Toggle AI sidebar |
| **Space + ad** | Normal | Toggle AI debug mode |
| **Space + ah** | Normal | Toggle AI hints |
| **Space + as** | Normal | Toggle AI suggestions |
| **Space + aR** | Normal | Toggle AI repomap |

### AI Sidebar Navigation

| Key | Mode | Description |
|-----|------|-------------|
| **A** | Normal | Apply all changes |
| **a** | Normal | Apply cursor change |
| **Tab** | Normal | Switch to next window |
| **Shift + Tab** | Normal | Switch to previous window |
| **d** | Normal | Remove file from chat |
| **@** | Normal | Add current file to chat |
| **Escape** | Normal | Close AI sidebar |
| **q** | Normal | Close AI sidebar |

### AI Diff Conflict Resolution

| Key | Mode | Description |
|-----|------|-------------|
| **c + o** | Normal | Choose ours ( keep your changes ) |
| **c + t** | Normal | Choose theirs ( accept AI changes ) |
| **c + a** | Normal | Choose all theirs |
| **c + b** | Normal | Choose both ( merge ) |
| **c + c** | Normal | Choose cursor position |
| **] + x** | Normal | Go to next conflict |
| **[ + x** | Normal | Go to previous conflict |

### AI Suggestion Management

| Key | Mode | Description |
|-----|------|-------------|
| **Option + l** | Normal | Accept AI suggestion |
| **Option + ]** | Normal | Next AI suggestion |
| **Option + [** | Normal | Previous AI suggestion |
| **Control + ]** | Normal | Dismiss AI suggestion |

### AI Navigation

| Key | Mode | Description |
|-----|------|-------------|
| **] + ]** | Normal | Jump to next result |
| **[ + [** | Normal | Jump to previous result |

---

## Python Development Workflow

### LSP Setup
- **Language Server**: pyright
- **Linter**: ruff
- **Formatter**: black ( auto-format on save )
- **Type Checker**: mypy

### Debugging Setup
- **Debugger**: debugpy
- **Interface**: nvim-dap-ui
- **Test Runner**: nvim-dap-python

### Development Commands
1. **Code Navigation**: Use `gd`, `gi`, `gr` to jump between definitions
2. **Documentation**: Press `K` for hover docs
3. **Code Actions**: `<leader>ca` for quick fixes and refactoring
4. **Formatting**: `<leader>fm` to format, or auto on save
5. **Diagnostics**: `[d`/`]d` to navigate issues
6. **Debugging**: `<leader>db` to set breakpoints, then use DAP UI
7. **Testing**: `<leader>dpr` to run current test method

---

## AI Assistant Configuration

### Providers
- **Primary**: OpenAI o3-mini
- **Auto-suggestions**: Claude
- **Support**: Image pasting, markdown rendering

### AI Features
- **Code Generation**: Ask AI to write code
- **Code Explanation**: Get explanations of selected code
- **Refactoring**: AI-assisted code improvements
- **Debugging**: AI help with error resolution
- **Documentation**: Generate docstrings and comments

### Enhanced Chat Formatting
Your config now includes **better chat rendering**:
- **render-markdown.nvim**: Enhanced markdown rendering with custom styling
- **markview.nvim**: Additional visual improvements for markdown content
- **nvim-notify**: Better notification system for AI responses
- **glow.nvim**: Beautiful markdown preview for longer content

### AI Workflow
1. **Ask Question**: **Space + aa** to open AI chat
2. **Edit Code**: **Space + ae** for AI-assisted editing
3. **Review Changes**: Use sidebar navigation to review AI suggestions
4. **Apply Changes**: `a` to apply cursor change, `A` for all changes
5. **Resolve Conflicts**: Use diff resolution keys if needed
6. **Preview Markdown**: **Space + mg** for beautiful markdown rendering

---

## Git Integration Features

### Git Blame
- Shows commit information in virtual text
- Format: `summary • date • author • sha`
- Toggle with git-blame.nvim settings

### Git Commands
- **Status**: `<leader>gt` for git status in Telescope
- **Commits**: `<leader>cm` for commit history
- **Hunks**: `[c`/`]c` to navigate changes
- **Actions**: `<leader>rh` to reset, `<leader>ph` to preview

### Git Workflow
1. **Check Status**: `<leader>gt` to see current changes
2. **Review Hunks**: Use `[c`/`]c` to navigate
3. **Preview Changes**: `<leader>ph` to see hunk details
4. **Get Info**: `<leader>gb` for line blame
5. **Stage/Commit**: Use vim-fugitive commands (`:Git`, `:Gcommit`)

---

## Quick Reference ( Most Used )

### Daily Workflow Essentials
```
Control + n          # Toggle file explorer
Space + ff           # Find files
Space + fw           # Search in files
g + d                # Go to definition
K                    # Get documentation
Space + ca           # Code actions
Space + /            # Toggle comment
Control + s          # Save file
Space + fm           # Format code
Space + aa           # Ask AI
Space + db           # Toggle breakpoint
Space + ch           # Show cheatsheet
```

### Buffer Management
```
Tab                  # Next buffer
Shift + Tab          # Previous buffer
Space + x            # Close buffer
Space + b            # New buffer
```

### Window Navigation
```
Control + h/j/k/l    # Navigate windows
Space + h            # New horizontal terminal
Space + v            # New vertical terminal
Option + i           # Toggle floating terminal
```

---

## Plugin Overview

### Core NvChad Plugins
- **base46**: Theme system
- **nvchad/ui**: UI components
- **telescope.nvim**: Fuzzy finder
- **nvim-tree.lua**: File explorer
- **which-key.nvim**: Key mapping help
- **nvim-treesitter**: Syntax highlighting
- **nvim-cmp**: Autocompletion

### Development Tools
- **pyright**: Python LSP
- **ruff**: Python linting
- **black**: Code formatting
- **mypy**: Type checking
- **nvim-dap**: Debugging
- **nvim-dap-python**: Python debugging

### AI & Productivity
- **avante.nvim**: AI coding assistant
- **img-clip.nvim**: Image pasting
- **render-markdown.nvim**: Markdown rendering
- **git-blame.nvim**: Git blame information
- **vim-fugitive**: Git commands

---

## Configuration Files Structure

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
│           ├── null-ls.lua     # Formatting/linting
│           └── avante.lua       # AI assistant config
└── NVIM_COMMANDS.md           # This documentation
```

---

## Tips & Tricks

### 1. Fast File Navigation
- Use `<leader>ff` for quick file access
- `<leader>fo` for recently opened files
- `<leader>fz` to search within current file

### 2. Code Development
- `<leader>ca` for quick fixes and refactoring
- `K` for instant documentation
- Auto-format on save with black

### 3. AI Assistance
- `<leader>aa` to ask questions about code
- Select code and use `<leader>ae` for AI editing
- Use image pasting for visual debugging

### 4. Debugging
- `<leader>db` to set breakpoints
- Use DAP UI for step-through debugging
- `<leader>dpr` to run specific test methods

### 5. Git Workflow
- `[c`/`]c` to quickly navigate changes
- `<leader>gb` to see who wrote what
- Use Telescope for git history and status

---

*This documentation covers all essential commands for your specific NvChad configuration. Keep it handy for quick reference!*