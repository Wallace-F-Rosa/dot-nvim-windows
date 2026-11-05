# ⚡ My Neovim Configuration for Windows

This repository contains my personal, modular, and modern **Neovim** configuration optimized for Windows and fine-tuned for **Angular** (TypeScript) and **Spring Boot** (Java) development.

---

## 🛠️ What's Included?

- **Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim) (ultra-fast lazy loading).
- **Theme**: [Tokyo Night](https://github.com/folke/tokyonight.nvim) (Moon style).
- **Code Intelligence (LSP)**: Native autocompletion, linting, and formatting for Java, TypeScript, HTML, and CSS.
- **Fuzzy Finder**: [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for lightning-fast file and text searches.
- **Debugging**: [nvim-dap](https://github.com/mfussenegger/nvim-dap) ecosystem integration for stepping through Java and Web applications.
- **Statusline**: [Lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) displaying active Git Branch, editing mode, and real-time Date/Time.

---

## 🚀 Installation Guide for Windows

Run the following commands in a **PowerShell** window to install system dependencies and deploy this configuration.

### 1. Install System Dependencies
Open PowerShell as Administrator and run the following command to install Neovim and required CLI utilities via `winget`:

```powershell
winget install Neovim.Neovim Git.Git OpenJS.NodeJS.LTS BurntSushi.Ripgrep.MSVC Python.Python.3.11
```

> 💡 **Java / Spring Boot Note**: Make sure you have **JDK 17 or higher** installed on your system and mapped correctly to your `JAVA_HOME` environment variable.

### 2. Install a Nerd Font (Required for Icons)
To display icons correctly in the statusline, file picker, and debugger, you must use a patched font:
1. Download and install [JetBrainsMono Nerd Font](https://github.com/jetbrains/jetbrainsmono).
2. Configure your terminal (e.g., **Windows Terminal**) to use the newly installed font.

### 3. Clone This Repository
Navigate to the default Neovim configuration directory on Windows and clone your repository:

```powershell
# Navigate to system local app data
cd \$env:LOCALAPPDATA

# Safely remove any existing default nvim directory
Remove-Item -Recurse -Force .\nvim

# Clone this configuration (Replace with YOUR actual repository URL)
git clone <YOUR_REPOSITORY_URL> nvim
```

### 4. Initialize the Editor
Launch Neovim from your terminal:

```powershell
nvim
```
**Lazy.nvim** will boot up, scan your modular files, and automatically download all core plugins.

### 5. Install Language Servers (LSP) & Debuggers (DAP)
Once Neovim is open, type the following command to open the package installer UI:
```vim
:Mason
```
Ensure the following packages successfully finish installing in the background:
- **LSP**: `angularls`, `ts_ls`, `jdtls`, `html`, `cssls`
- **DAP (Tab 4)**: `js-debug-adapter`, `java-debug-adapter`

---

## ⌨️ Keybindings Reference

### 🔍 Search & Discovery (Telescope)
- `<Space> + f + f` : Find files by name across the project workspace.
- `<Space> + f + g` : Live grep text strings inside files (powered by `ripgrep`).
- `<Space> + f + b` : Browse and switch between actively open file buffers.

### 🐛 Code Debugging (DAP)
- `<Space> + b` : Toggle a Ponto de Parada (Breakpoint 🔴) on the current line.
- `<F5>` : Start or Continue a debug session.
- `<F10>` : Step Over the current line.
- `<F11>` : Step Into a method/function call.
- `<F12>` : Step Out of a method/function call.
- `<Space> + u + i` : Toggle the debugging visual panel dashboard manually.
