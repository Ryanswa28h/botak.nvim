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

Before installing, ensure your system has the required core utilities and external dependencies installed.

### 1. Core Runtime (Required)

- **Neovim >= 0.10.0** (Built with LuaJIT)
- **Git** (For plugin management via `lazy.nvim`)
- **Curl** (For downloading LSP servers, linters, and Mason binaries)

### 2. External System Dependencies (Highly Recommended)

These binaries must be accessible in your system's `$PATH` for the respective plugins to function:

| Dependency                 | Required By                           | Purpose                                                  |
| :------------------------- | :------------------------------------ | :------------------------------------------------------- |
| `ripgrep` (`rg`)           | `fzf-lua`, `snacks.nvim`, `telescope` | Lightning-fast global text searching                     |
| `fzf`                      | `fzf-lua`                             | Command-line fuzzy finder engine                         |
| `fd`                       | `fzf-lua`, `snacks.nvim`              | Fast alternative to `find` for locating files            |
| `Node.js` (`node` & `npm`) | `mason.nvim`, `copilot.lua`           | Runtime for Copilot and various LSP/formatters           |
| `Python3` & `pip`          | `nvim-dap-python`                     | Debugging runtime and environment management             |
| `unzip` / `tar` / `gzip`   | `mason.nvim`                          | Decompressing downloaded language servers                |
| `xclip` / `wl-clipboard`   | Neovim System Clipboard               | Syncing Vim registers with system clipboard (Linux only) |

### 3. Advanced / AI Plugin Dependencies

Because this config leverages cutting-edge AI utilities (`avante.nvim`), you must install these compilation tools:

- **`make`** or **`cmake`** (Required to compile `avante.nvim` native code)
- **A C Compiler** (`gcc` or `clang`)
- **`luarocks`** (To manage Lua dependencies for Avante)
- **`xclip` / `wl-clipboard` / `pbcopy`** (Required by `img-clip.nvim` to grab screenshots into your Markdown notes)

---

### 📦 Quick Installation Commands

Choose the command for your operating system to fetch all dependencies at once:

#### MacOS (Homebrew)

```bash
brew install neovim git curl ripgrep fzf fd nodejs luarocks cmake
```

#### Linux

```bash
sudo apt update && sudo apt install -y neovim git curl ripgrep fzf fd-find nodejs luarocks cmake build-essential xclip # debian/ubuntu
sudo pacman -S neovim git curl ripgrep fzf fd nodejs luarocks cmake base-devel xclip # archlinux
```

#### Windows (Native)

For winget installation, run this command inside **PowerShell** (as Administrator):

```powershell
winget install -e --id Neovim.Neovim
winget install -e --id Git.Git
winget install -e --id BurntSushi.Ripgrep
winget install -e --id sharkdp.fd
winget install -e --id junegunn.fzf
winget install -e --id OpenJS.NodeJS
winget install -e --id LLVM.LLVM
winget install -e --id CMake.CMake
pip install luarocks
```

or Chocolatey:

```powershell
choco install neovim git ripgrep fd fzf nodejs luarocks cmake llvm -y
```

> [!NOTE]
>
> 1. **The C Compiler (`LLVM` / `gcc`)**: Because `avante.nvim` requires compiling native code, Windows users _must_ have a compiler in their system environment. Installing `LLVM` (which includes `clang`) or installing MinGW via `choco install mingw -y` ensures that `make` and compilation blocks won't crash during the lazy-load setup.
> 2. **Path Refresh**: Remind your users that after running these setup commands on Windows, they **must close and restart their terminal** for the newly installed tools to register in their environment `$PATH`.

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
| Toggle boolean/value                    | `gz`              |
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
