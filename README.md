# botak.nvim

A minimal and modern Neovim configuration focused on productivity, LSP, autocompletion, animations, and a clean Lua-based setup.
Designed for speed, ease of use, and out-of-the-box functionality with a curated plugin set.

---

## 🌟 Features

* **nvim-cmp** for autocompletion
* **Built-in LSP configurations** (Lua, Python, C/C++, JSON, YAML, Bash, Docker, etc.)
* **Treesitter** for advanced syntax highlighting
* **Telescope** for fuzzy finding files, symbols, and references
* Optional animations support via `animations.lua`
* Custom dashboard (`dashboard.lua`) and prelive setup (`prelive.lua`)
* File explorer (`neotree.lua`), statusline (`lualine.lua`), and bufferline (`bufferline.lua`)
* Git integration (`gitsigns.lua`) and commenting utilities (`comment.lua`)
* Indent guides (`indent-blankline.lua`) and miscellaneous tweaks (`misc.lua`)

---

## 📋 Requirements

Before installing Botakvim, make sure you have the following installed:

* **Neovim 0.9+**
* **Git**
* **Python 3** (for `pyright` LSP)
* **Node.js / npm** (optional, for some LSPs and plugins)
* **make** (optional, for building some plugins)

Optional LSPs and tools installed via Mason.nvim (`mason.lua`):

* Lua: `lua-language-server`
* Python: `pyright`, `ruff`
* C/C++: `clangd`
* JSON: `json-lsp`
* SQL: `sqlls`
* YAML: `yaml-language-server`
* Bash: `bash-language-server`
* Docker: `docker-language-server`, `docker-compose-language-service`
* HTML: `html-lsp`
* Formatter: `stylua`

Lazy.nvim + Mason.nvim will automatically install most of these.

---

## 💻 Installation

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

* Lazy.nvim will automatically install all plugins and LSP servers defined in your config.
* Wait for the plugin installation to finish.

### 4. Verify plugin installation

Run inside Neovim:

```vim
:Lazy sync
```

This ensures all plugins and LSP servers are correctly installed.

### 5. Codeium Auth

Command:
```
:Codeium Auth
```
A browser page will be opened and you are required to enter the auth token.

Optionally, if you don't want AI features, you can comment:
```
require("plugins.codeium")
```
inside of ```init.lua```.

---

### 6. Delete ```lazy-lock.json``` (Optional)

Deleting the ```lazy-lock``` file will allow Neovim to update plugins.

As a result, you will get newer features at the price of stability.

## 🚀 Usage

* Open files as usual:

```bash
nvim filename
```

* Use **`<leader>`** keymaps for LSP, snippets, navigation, and code execution.
* Common keymaps:

| Action                         | Keymap       |
| ------------------------------ | ------------ |
| Go to definition               | `gd`         |
| Find references                | `gr`         |
| Rename symbol                  | `<leader>rn` |
| Execute code action            | `<leader>r ` |
| Toggle inlay hints             | `<leader>th` |
| Fuzzy find files               | `<leader>ff` |
| Fuzzy find workspace symbols   | `<leader>ws` |
| Toggle background (Nord theme) | `<leader>bg` |

*(Refer to `lua/core/keymaps.lua` and the `lua/plugins/` modules for full keymap and plugin details.)*

---

## 📝 License

This configuration is open-source under the **MIT License**.

Copyright (c) 2025 Ryan Alvaro Emmyson
