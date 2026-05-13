require("core.autocmds")
require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.schedule(function()
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = "󰌵 ",
				[vim.diagnostic.severity.INFO] = " ",
			},
			priority = 1,
		},
	})
end)

vim.api.nvim_set_hl(0, "SnippetTabstop", { bg = "NONE", fg = "NONE" })

require("lazy").setup({
	spec = {
		{ import = "plugins.mininvim" },
		{ import = "plugins.snacks" },
		{ import = "plugins.colortheme" },
		{ import = "plugins.bufferline" }, -- NOTE: Disable if you're advanced enough with global marks, harpoon, telescope or other means of navigation
		{ import = "plugins.persistence" },
		{ import = "plugins.lualine" },
		-- { import = "plugins.telescope" }, -- NOTE: Replaced by Snacks.picker
		{ import = "plugins.misc" },
		{ import = "plugins.grug-far" },
		-- { import = "plugins.neotree" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.blink" },
		-- { import = "plugins.projects" },
		{ import = "plugins.dashboard" },
		{ import = "plugins.aerial" },
		{ import = "plugins.indent-blankline" },
		{ import = "plugins.harpoon" }, -- NOTE: Requires specific keybinds that may be taken by the OS/DE/WM
		{ import = "plugins.undotree" },
		{ import = "plugins.gitsigns" },
		{ import = "plugins.splits" },
		{ import = "plugins.comment" },
		{ import = "plugins.diffview" },
		-- { import = "plugins.jupyter" }, -- INFO: Enable if you want to use Neovim as a Jupyter notebook editor
		-- { import = "plugins.codeium" }, -- INFO: You could enable if you don't want to use copilot
		-- { import = "plugins.copilot" }, -- Ghost text autocompletion
		{ import = "plugins.supermaven" },
		{ import = "plugins.noice" }, -- Neovim UI overhaul
		-- { import = "plugins.comfy-num-lines" }, -- Makes number columns use left hand numbers only.  NOTE: Breaks line diagnostics respecting gitsigns
		{ import = "plugins.navigation" },
		{ import = "plugins.diagnostics" },
		{ import = "plugins.avante" }, -- NOTE: Requires a custom Avante server to be running so disabled by default
		-- { import = "plugins.opencode" }, -- NOTE: Requires a custom OpenCode server to be running, and is not yet fully functional, so disabled by default
		{ import = "plugins.debug" },
		{ import = "plugins.rainbowdelimiters" }, -- Rainbow parentheses, functions, statements and brackets
		{ import = "plugins.prelive" },
		{ import = "plugins.nvzone" },
		-- { import = "plugins.image" }, -- NOTE: Disabled by default because it requires a image loading terminal backend
		{ import = "plugins.fold" },
		{ import = "plugins.coderunner" },
		-- { import = "plugins.oil" }, -- Oil is a fullscreen file explorer where you edit your files as in a regular neovim buffer
		{ import = "plugins.mason" },
		{ import = "plugins.lsp" },
		{ import = "plugins.linters" },
		{ import = "plugins.neogit" },
		{ import = "plugins.conform" },
	},
	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
