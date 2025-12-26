-- Do <leader>sth to set a new theme
local theme_cache = vim.fn.stdpath("data") .. "/last_theme.lua"

local function save_theme_state(theme, transparent)
	local file = io.open(theme_cache, "w")
	if file then
		file:write(string.format("return { theme = '%s', transparent = %s }", theme, tostring(transparent)))
		file:close()
	end
end

local function load_theme_state()
	local f = loadfile(theme_cache)
	if f then
		return f()
	end
	return { theme = "tokyonight-night", transparent = false }
end

local saved_state = load_theme_state()
local bg_transparent = saved_state.transparent
local current_theme = saved_state.theme

local apply_transparency = function(state)
	bg_transparent = state
	local theme = vim.g.colors_name or current_theme

	if theme:find("catppuccin") then
		require("catppuccin").setup({ transparent_background = bg_transparent })
	elseif theme:find("tokyonight") then
		require("tokyonight").setup({ transparent = bg_transparent })
	elseif theme:find("nord") then
		vim.g.nord_disable_background = bg_transparent
	end

	vim.cmd.colorscheme(theme)
	save_theme_state(theme, bg_transparent)
end

local enable_bg = function()
	apply_transparency(false)
end
local disable_bg = function()
	apply_transparency(true)
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Prevent saving during the "preview" phase of Telescope
		if vim.v.event.abort then
			return
		end

		local new_theme = vim.g.colors_name
		save_theme_state(new_theme, bg_transparent)
	end,
})

return {
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

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			style = "night",
			transparent = bg_transparent,
			styles = { sidebars = "transparent", floats = "transparent" },
			on_highlights = function(hl, c)
				-- hl.MiniCursorword = { bg = "none", underline = true }
				-- hl.MiniCursorwordCurrent = { bg = "none", underline = true }
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)

			vim.cmd.colorscheme(current_theme)

			vim.keymap.set("n", "<leader>bg", enable_bg, { desc = "UI: Enable Transparency" })
			vim.keymap.set("n", "<leader>dbg", disable_bg, { desc = "UI: Disable Transparency" })
			vim.keymap.set(
				"n",
				"<leader>sth",
				"<cmd>Telescope colorscheme enable_preview=true<CR>",
				{ desc = "UI: Theme Selector" }
			)

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					if vim.v.event.abort then
						return
					end
					local new_theme = vim.g.colors_name
					if new_theme then
						save_theme_state(new_theme, bg_transparent)
					end
				end,
			})
		end,
	},
}
