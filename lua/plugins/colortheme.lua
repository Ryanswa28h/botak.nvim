-- THEME CONFIGS
local default_theme = "tokyonight-night" -- Options: Put your default theme here
local bg_transparent = false -- Default background state (false = solid)

local apply_transparency = function(state)
	bg_transparent = state
	local current_theme = vim.g.colors_name or default_theme

	if current_theme:find("catppuccin") then
		require("catppuccin").setup({ transparent_background = bg_transparent })
	elseif current_theme:find("tokyonight") then
		require("tokyonight").setup({ transparent = bg_transparent })
	elseif current_theme:find("nord") then
		vim.g.nord_disable_background = bg_transparent
	else
		print("Background transparency has not been implemented with the current theme.")
	end

	vim.cmd.colorscheme(current_theme)

	local status = bg_transparent and "Enabled" or "Disabled"
	vim.notify("Transparency " .. status, vim.log.levels.INFO, { title = "Theme" })
end

local enable_bg = function()
	apply_transparency(true)
end
local disable_bg = function()
	apply_transparency(false)
end

return {
	-- NORD
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_disable_background = bg_transparent
		end,
	},

	-- CATPPUCCIN
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = bg_transparent,
			integrations = {
				notify = true,
				mini = { enabled = true, indentscope_color = "sky" },
			},
		},
	},

	-- TOKYONIGHT
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			style = "night",
			transparent = bg_transparent,
			styles = { sidebars = "transparent", floats = "transparent" },
			on_highlights = function(hl, c)
				hl.MiniCursorword = {
					bg = "none",
					underline = true,
				}
				hl.MiniCursorwordCurrent = {
					bg = "none",
					underline = true,
				}
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			-- Load the default theme choice
			vim.cmd.colorscheme(default_theme)

			-- Keybinds (Placed here so they are active once themes load)
			vim.keymap.set("n", "<leader>bg", enable_bg, { desc = "UI: Enable Transparency" })
			vim.keymap.set("n", "<leader>dbg", disable_bg, { desc = "UI: Disable Transparency" })
		end,
	},
}
