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

local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.api.nvim_set_hl(0, "SnippetTabstop", { bg = "NONE", fg = "NONE" })

require("lazy").setup({
	require("plugins.mininvim"),
	require("plugins.snacks"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
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
	require("plugins.harpoon"),
	require("plugins.undotree"),
	require("plugins.gitsigns"),
	require("plugins.comment"),
	require("plugins.diffview"),
	require("plugins.jupyter"),
	-- require("plugins.codeium"),
	require("plugins.copilot"), -- Inline autocomplete with copilot
	require("plugins.ui"),
	require("plugins.tmux"),
	require("plugins.navigation"),
	require("plugins.diagnostics"),
	-- require("plugins.avante"),
	require("plugins.opencode"),
	require("plugins.debug"),
	require("plugins.rainbowdelimiters"),
	require("plugins.prelive"),
	require("plugins.nvzone"),
	-- require("plugins.image"),
	require("plugins.mason"),
	require("plugins.lsp"),
	require("plugins.neogit"),
	require("plugins.conform"),
	require("plugins.coderunner"),
})
