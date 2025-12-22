return {
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			render = "compact",
		},
		init = function()
			vim.notify = require("notify").setup({
				background_colour = "#303030",
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			cmdline = { view = "cmdline_popup" },
			messages = { view = "mini" },
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
	},
}
