return {
	---------------------------------------------------------------------------
	-- Cursor + scroll animations (fast, no window anims)
	---------------------------------------------------------------------------
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = {
			-- cursor = {
			-- 	enable = true,
			-- 	timing = function(_, n)
			-- 		return 50
			-- 	end,
			-- },
			--
			-- scroll = {
			-- 	enable = true,
			-- 	timing = function(_, n)
			-- 		return 10
			-- 	end,
			-- },

			-- Disabled
			resize = { enable = false },
			open = { enable = false },
			close = { enable = false },
			scroll = { enable = false },
			cursor = { enable = false },
		},
	},

	---------------------------------------------------------------------------
	-- Yank animation (highlight flash)
	---------------------------------------------------------------------------
	{
		"echasnovski/mini.hipatterns",
		event = "VeryLazy",
		config = function()
			vim.api.nvim_create_autocmd("TextYankPost", {
				callback = function()
					vim.highlight.on_yank({
						higroup = "IncSearch",
						timeout = 120,
					})
				end,
			})
		end,
	},

	---------------------------------------------------------------------------
	-- Notifications only
	---------------------------------------------------------------------------
	{
		"folke/snacks.nvim",
		event = "VeryLazy",
		opts = {
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			animate = { enabled = false },
			dashboard = { enabled = false },
		},
	},
}
