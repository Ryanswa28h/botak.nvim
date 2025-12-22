return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				search = { enabled = true },
				char = { enabled = true },
			},
		},
		keys = {
			{
				"s",
				function()
					require("flash").jump()
				end,
				desc = "Flash Jump",
			},
		},
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
