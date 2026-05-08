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
	require("plugins.mininvim"),
	require("plugins.snacks"),
	require("plugins.colortheme"),
	require("plugins.bufferline"), -- NOTE: Disable if you're advanced enough with global marks, harpoon, telescope or other means of navigation
	require("plugins.persistence"),
	require("plugins.lualine"),
	require("plugins.telescope"),
	require("plugins.misc"),
	require("plugins.neotree"),
	require("plugins.treesitter"),
	require("plugins.blink"),
	require("plugins.projects"),
	require("plugins.dashboard"),
	require("plugins.indent-blankline"),
	require("plugins.harpoon"), -- NOTE: Requires specific keybinds that may be taken by the OS/DE/WM
	require("plugins.undotree"),
	require("plugins.gitsigns"),
	require("plugins.comment"),
	require("plugins.diffview"),
	-- require("plugins.jupyter"), -- INFO: Enable if you want to use Neovim as a Jupyter notebook editor
	-- require("plugins.codeium"), -- INFO: You could enable if you don't want to use copilot
	require("plugins.copilot"), -- Ghost text autocompletion
	require("plugins.noice"), -- Neovim UI overhaul
	require("plugins.tmux"), -- NOTE: Requires tmux (Disable if you don't use tmux or don't want the integration)
	-- require("plugins.comfy-num-lines"), -- Makes number columns use left hand numbers only.  NOTE: Breaks line diagnostics respecting gitsigns
	require("plugins.navigation"),
	require("plugins.diagnostics"),
	require("plugins.avante"), -- NOTE: Requires a custom Avante server to be running so disabled by default
	-- require("plugins.opencode"), -- NOTE: Requires a custom OpenCode server to be running, and is not yet fully functional, so disabled by default
	require("plugins.debug"),
	require("plugins.rainbowdelimiters"), -- Rainbow parentheses, functions, statements and brackets
	require("plugins.prelive"),
	require("plugins.nvzone"),
	-- require("plugins.image"), -- NOTE: Disabled by default because it requires a image loading terminal backend
	-- require("plugins.fold"),
	-- require("plugins.oil"), -- Oil is a fullscreen file explorer where you edit your files as in a regular neovim buffer
	require("plugins.mason"),
	require("plugins.lsp"),
	require("plugins.linters"),
	require("plugins.neogit"),
	require("plugins.conform"),
	require("plugins.coderunner"),
})
