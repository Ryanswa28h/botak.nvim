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
	-- require("plugins.harpoon"), -- NOTE: Requires specific keybinds that may be taken by the OS/DE/WM
	require("plugins.undotree"),
	require("plugins.gitsigns"),
	require("plugins.comment"),
	require("plugins.diffview"),
	require("plugins.jupyter"),
	-- require("plugins.codeium"), -- INFO: Enable if you don't want to use copilot
	-- require("plugins.copilot"), -- INFO: Replaced by blink-cmp copilot integration
	require("plugins.noice"),
	require("plugins.tmux"),
	-- require("plugins.comfy-num-lines"), -- Makes number columns use left hand numbers only.  NOTE: Breaks line diagnostics respecting gitsigns
	require("plugins.navigation"),
	require("plugins.diagnostics"),
	-- require("plugins.avante"), -- NOTE: Requires a custom Avante server to be running so disabled by default
	-- require("plugins.opencode"), -- NOTE: Requires a custom OpenCode server to be running, and is not yet fully functional, so disabled by default
	require("plugins.debug"),
	require("plugins.rainbowdelimiters"),
	require("plugins.prelive"),
	require("plugins.nvzone"),
	-- require("plugins.image"), -- NOTE: Disabled by default because it requires a image loading terminal backend
	require("plugins.fold"),
	require("plugins.mason"),
	require("plugins.lsp"),
	require("plugins.linters"),
	require("plugins.neogit"),
	require("plugins.conform"),
	require("plugins.coderunner"),
})
