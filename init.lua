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

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.persistence"),
	require("plugins.lualine"),
	require("plugins.telescope"),
	require("plugins.mininvim"),
	require("plugins.treesitter"),
	require("plugins.autocompletion"),
	require("plugins.gitsigns"),
	require("plugins.dashboard"),
	require("plugins.indent-blankline"),
	require("plugins.comment"),
	require("plugins.misc"),
	require("plugins.codeium"),
	-- require("plugins.animations"),
	require("plugins.prelive"),
	require("plugins.mason"),
	require("plugins.lsp"),
	require("plugins.autoformatting"),
	require("plugins.coderunner").setup(),
})
