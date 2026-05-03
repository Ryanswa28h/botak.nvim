![botak.nvim logo](https://i.imgur.com/PdJICJN.png)
![Screenshot of code editing interface](https://i.imgur.com/QubJfee.png)
![Screenshot of file explorer interface](https://i.imgur.com/vUNurJv.png)

A minimal and modern Neovim configuration focused on productivity, and minimalism.
Designed for speed, ease of use, and out-of-the-box functionality with a curated plugin set.

Note: This config contains some configuration from other open-source git repositories.

---

## 🌟 Features

- **nvim-cmp** for autocompletion
- **Built-in LSP configurations** (Lua, Python, C/C++, JSON, YAML, Bash, Docker, etc.)
- **Treesitter** for advanced syntax highlighting
- **Telescope** for fuzzy finding files, symbols, and references
- Optional animations support via `animations.lua`
- Custom dashboard (`dashboard.lua`) and prelive setup (`prelive.lua`)
- File explorer (`neotree.lua`), statusline (`lualine.lua`), and bufferline (`bufferline.lua`)
- Git integration (`gitsigns.lua`) and commenting utilities (`comment.lua`)

---

## 📋 Requirements

Before installing botak.nvim, make sure you have the following installed:

- **Neovim 0.9+**
- **Git**
- A **Nerd Font** (optional, for icons)
- **Python 3** (optional, for `pyright` LSP)
- **Node.js / npm** (optional, for some LSPs and plugins)
- **fzf** (optional, for fuzzy searchin
- **make** (optional, for building some plugins)

Optional LSPs and tools installed via Mason.nvim (`mason.lua`):

- Lua: `lua-language-server`
- Python: `pyright`, `ruff`
- C/C++: `clangd`
- JSON: `json-lsp`
- SQL: `sqlls`
- YAML: `yaml-language-server`
- Bash: `bash-language-server`
- Docker: `docker-language-server`, `docker-compose-language-service`
- HTML: `html-lsp`
- Formatter: `stylua`

Lazy.nvim + Mason.nvim will automatically install most of these.

## 📦 Install Requirements

<details>
<summary>Linux / macOS</summary>

### Requirements

**1. Git**

Linux:

```bash
sudo pacman -S git        # Arch
sudo apt install git      # Debian/Ubuntu
```

macOS:

```bash
brew install git
```

---

**2. Neovim (0.9+)**

Linux:

```bash
sudo pacman -S neovim    # Arch
sudo apt install neovim  # Debian/Ubuntu
```

macOS:

```bash
brew install neovim
```

Verify:

```bash
nvim --version
```

---

**3. (Optional) Python 3**

Linux:

```bash
sudo pacman -S python    # Arch
sudo apt install python3 # Debian/Ubuntu
```

macOS:

```bash
brew install python
```

---

**4. (Optional) Node.js**

Linux:

```bash
sudo pacman -S nodejs npm    # Arch
sudo apt install nodejs npm  # Debian/Ubuntu
```

macOS:

```bash
brew install node
```

---

**5. (Optional) fzf**

Linux:

```bash
sudo pacman -S fzf    # Arch
sudo apt install fzf  # Debian/Ubuntu
```

macOS:

```bash
brew install fzf
```

</details>

<details>
<summary>Windows</summary>

### Requirements

Install the following before using botak.nvim:

**1. Git**

Using Winget (recommended):

```powershell
winget install --id Git.Git -e
```

Or download manually from:
[https://git-scm.com/download/win](https://git-scm.com/download/win)

---

**2. Neovim (0.9+)**

Using Winget:

```powershell
winget install Neovim.Neovim
```

Or download manually:
[https://neovim.io](https://neovim.io)

Make sure `nvim` is available in PowerShell:

```powershell
nvim --version
```

---

**3. (Optional) Python 3**

Required only if you want Python LSP (`pyright`).

```powershell
winget install --id Python.Python.3.11 --scope machine -e
```

---

**4. (Optional) Node.js**

Needed for some LSP servers and plugins.

```powershell
winget install OpenJS.NodeJS
```

---

**5. (Optional) fzf**

Required only if you want fuzzy finding.

```powershell
winget install junegunn.fzf
```

---

**4. (Optional) Node.js**

Needed for some LSP servers and plugins.

```powershell
winget install OpenJS.NodeJS
```

</details>

---

## 💻 Installation

<details>
<summary>Linux / macOS</summary>

### 1. Backup old Neovim config (optional)

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

### 2. Clone the botak.nvim repository

```bash
git clone https://github.com/Ryanswa28h/botak.nvim.git ~/.config/nvim
```

### 3. Open Neovim

```bash
nvim
```

- Lazy.nvim will automatically install all plugins and LSP servers defined in your config.
- Wait for the plugin installation to finish.

### 4. Verify plugin installation

Run inside Neovim:

```vim
:Lazy sync
```

### 5. Setup Copilot Autocomplete (Optional)

Command:

```
:Copilot Setup
```

If you don't want to use Copilot autocomplete, you can delete `copilot` in the `plugins/blink.lua > return > opts > sources > default` table.

### 6. Delete `lazy-lock.json` (Optional)

Deleting the `lazy-lock.json` file will allow Neovim to update plugins.

As a result, you will get newer features at the price of stability.

</details>

<details>
<summary>Windows</summary>

### 1. Backup old Neovim config (optional)

Open **PowerShell**:

```powershell
Rename-Item $env:LOCALAPPDATA\nvim nvim_backup
```

### 2. Clone the botak.nvim repository

```powershell
git clone https://github.com/Ryanswa28h/botak.nvim.git $env:LOCALAPPDATA\nvim
```

### 3. Open Neovim

```powershell
nvim
```

- Lazy.nvim will automatically install all plugins and LSP servers defined in your config.
- First startup may take a few minutes.

### 4. Verify plugin installation

Inside Neovim:

```vim
:Lazy sync
```

### 5. Setup Copilot Autocomplete (Optional)

Command:

```
:Copilot Setup
```

If you don't want to use Copilot autocomplete, you can delete `copilot` in the `plugins/blink.lua > return > opts > sources > default` table.

### 6. Delete `lazy-lock.json` (Optional)

Deleting the `lazy-lock.json` file will allow Neovim to update plugins.

As a result, you will get newer features at the price of stability.

</details>

---

## 🚀 Usage

- Open files as usual:

```bash
nvim filename
```

- Use **`<leader>`** keymaps for LSP, snippets, navigation, and code execution.
- Default leader key: `SPACE`
- Common keymaps:

| Action                       | Keymap        |
| ---------------------------- | ------------- |
| Close nvim                   | `<leader>qq`  |
| Close buffer (Terminal mode) | `<ctrl>q`     |
| Save file                    | `<ctrl>s`     |
| Show all keymaps             | `<leader>lm`  |
| Go to definition             | `gd`          |
| Find references              | `gr`          |
| Rename symbol                | `<leader>rn`  |
| Execute code in file         | `<leader>r`   |
| Toggle inlay hints           | `<leader>th`  |
| Fuzzy find workspace symbols | `<leader>ws`  |
| Accept autocomplete          | `<ctrl>y`     |
| Accept AI autocomplete       | `<ctrl>g`     |
| Enable background            | `<leader>bg`  |
| Disable background           | `<leader>dbg` |
| Persistent theme selector    | `<leader>sth` |
| Open diagnostics list        | `<leader>q`   |
| View diagnostics             | `<leader>d`   |
| Open git status menu         | `<leader>gs`  |
| Toggle keystroke overlay     | `<leader>sk`  |
| Open neo-tree                | `<leader>e`   |
| Start mini.jump2d jumping    | `<leader>j`   |
| Start flash jumping          | `'`           |
| Toggle opencode              | `<F4>`        |
| Toggle terminal              | `<ctrl>\`     |
| Open neotree                 | `<leader>E`   |

_(Refer to `lua/core/keymaps.lua` and the `lua/plugins/` modules for full keymap and plugin details.)_

---

## 📝 License

This configuration is open-source under the **MIT License**.

Copyright (c) 2025 Ryan Alvaro Emmyson
