local theme_cache = vim.fn.stdpath("data") .. "/last_theme.lua"

local function save_state(theme, transparent)
	local file = io.open(theme_cache, "w")
	if file then
		file:write(string.format("return { theme = '%s', transparent = %s }", theme, tostring(transparent)))
		file:close()
	end
end

local function load_state()
	local f = loadfile(theme_cache)
	return f and f() or { theme = "onedark", transparent = false }
end

local state = load_state()

local function apply_theme_config(theme_name, transparent)
	local status, _ = pcall(function()
		if theme_name:find("onedark") then
			require("onedark").setup({ style = "darker", transparent = transparent })
		elseif theme_name:find("catppuccin") then
			require("catppuccin").setup({ transparent_background = transparent })
		elseif theme_name:find("tokyonight") then
			require("tokyonight").setup({ transparent = transparent })
		elseif theme_name:find("nord") then
			vim.g.nord_disable_background = transparent
		end
	end)
	return status
end

-- Persistence Autocmd
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		if vim.v.event.abort then
			return
		end
		save_state(vim.g.colors_name, state.transparent)
	end,
})

-- Global Toggle Keymap
vim.keymap.set("n", "<leader>bg", function()
	state.transparent = not state.transparent
	apply_theme_config(vim.g.colors_name, state.transparent)
	vim.cmd.colorscheme(vim.g.colors_name)
	save_state(vim.g.colors_name, state.transparent)
end, { desc = "Toggle Transparency" })

-- Final application logic run after Lazy loads the specs
local function finalize_theme()
	apply_theme_config(state.theme, state.transparent)
	-- pcall prevents Neovim from crashing if the 'state.theme' plugin is disabled
	pcall(vim.cmd.colorscheme, state.theme)
end

return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		enabled = true, -- Toggle this
		config = finalize_theme,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		enabled = true, -- Toggle this
		config = finalize_theme,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		enabled = false, -- Toggle this
		config = finalize_theme,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		enabled = false, -- Toggle this
		config = finalize_theme,
	},
}
