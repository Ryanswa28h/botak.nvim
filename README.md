![botak.nvim logo](https://i.imgur.com/PdJICJN.png)
![Screenshot of code editing interface](https://i.imgur.com/QubJfee.png)
![Screenshot of file explorer interface](https://i.imgur.com/vUNurJv.png)

A minimal and modern Neovim configuration focused on productivity, and minimalism.
Designed for speed, ease of use, and out-of-the-box functionality with a curated plugin set.

> [!NOTE]
> This isn't a neovim ditribution, which means it won't be auto updated. After installing, you'll have to manage the configuration yourself.

> [!NOTE]
> This config contains some configuration from other open-source git repositories.

---

## 🌟 Features

- **blink-cmp** for autocompletion
- **Built-in LSP configurations** (Lua, Python, C/C++, JSON, YAML, Bash, Docker, etc.)
- **Treesitter** for advanced syntax highlighting
- **Snacks Picker** for fuzzy finding files, symbols, and references
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

> [!IMPORTANT]
> Make sure your terminal is using a nerd font, otherwise icons will not display correctly.

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

### 5. Setup supermaven (Optional)

To setup supermaven for free,
Command:

```
:SupermavenUseFree
```

If you don't want to use Supermaven autocomplete, you can disable the spec in the `init.lua` file.

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

### 5. Setup supermaven (Optional)

To setup supermaven for free,
Command:

```
:SupermavenUseFree
```

If you don't want to use Supermaven autocomplete, you can disable the spec in the `init.lua` file.

### 6. Delete `lazy-lock.json` (Optional)

Deleting the `lazy-lock.json` file will allow Neovim to update plugins.

As a result, you will get newer features at the price of stability.

</details>

---

## 🗿 Post-Installation

### Add More Plugins

To add more plugins, you can add plugin specs to one of the subdirectories in `lua/plugins` (except `lua/plugins/disabled`).
The `init.lua` file is already configured to load all plugins in the `lua/plugins` except `lua/plugins/disabled` directory.
Example plugin spec:

```lua
return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
        -- Config goes here
    end,
}
```

### Modify/Add Keybinds

First, check if a keybind is already taken by using `:verbose map <key>`.
If it is not taken, you can add a keymap to the `lua/core/keymaps.lua` file.

### Remove Plugins

To remove a plugin, you can delete the plugin spec from one of the subdirectories in `lua/plugins`.
Or if you want to preserve the spec, but disable it for now, either add the `disabled = true` flag to the spec or move the spec to `lua/plugins/unused`.

---

## 🚀 Usage

- Open files as usual:

```bash
nvim filename
```

- Use **`<leader>`** keymaps for LSP, snippets, navigation, and code execution.
- Default leader key: `SPACE`
- Common keymaps:

| Action                                  | Keymap            |
| --------------------------------------- | ----------------- |
| Close nvim                              | `<leader>qq`      |
| Close buffer (Terminal mode)            | `<ctrl>q`         |
| Legendary (VSCode like command pallete) | `<ctrl>p`         |
| Save file                               | `<ctrl>s`         |
| Save file without formatting            | `<leader>sn`      |
| Show all keymaps                        | `<leader>sk`      |
| Go to definition                        | `gd`              |
| Find references                         | `<leader>gr`      |
| Rename symbol                           | `<leader>rn`      |
| Execute code in file                    | `<leader>r`       |
| Accept autocomplete                     | `<ctrl>y` / `tab` |
| Accept AI autocomplete                  | `<ctrl>g`         |
| Persistent theme selector               | `<leader>sth`     |
| Open git status menu                    | `<leader>gs`      |
| Toggle keystroke overlay                | `<leader>lm`      |
| Open mini.files                         | `-`               |
| Start flash jumping                     | `zk`              |
| Split horizontally                      | `<leader>wh`      |
| Split vertically                        | `<leader>wv`      |
| Toggle terminal                         | `<ctrl>\`         |
| Open Snacks Explorer                    | `<leader>e`       |

Picker Keybinds:

| Action                  | Keymap                    |
| ----------------------- | ------------------------- |
| Find files in CWD       | `<leader><leader>`        |
| Grep files in CWD       | `<leader>fw`              |
| Search buffers          | `<leadersb` / `<leader>,` |
| Search oldfiles         | `<leader>so`              |
| Search help             | `<leader>sh`              |
| Search diagnostics      | `<leader>sd`              |
| Search todos            | `<leader>st`              |
| Search keymaps          | `<leader>sk`              |
| Search marks            | `<leadersm`               |
| Search symbols (aerial) | `<leader>ss`              |
| Search registers        | `<leader>sx`              |

_(Refer to `lua/core/keymaps.lua` and the `lua/plugins/` modules for full keymap and plugin details.)_

> [!TIP]
> You can use legendary.nvim (`<ctrl>p`) to search for commands and further explore keymaps.

---

## 📝 License

This configuration is open-source under the **MIT License**.

Copyright (c) 2025 Ryan Alvaro Emmyson
