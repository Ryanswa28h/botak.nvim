return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		scroll = { enabled = true },
		bufdelete = { enabled = true },
		animate = { enabled = true },
		debug = { enabled = true },
		quickfile = { enabled = true },
		zen = { enabled = true },
		layout = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true, timeout = 4200 },
		indent = { enabled = true },
		bigfile = { enabled = true },
		statuscolumn = {
			enabled = true,
			git = { patterns = { "GitSigns*" } },
		},
	},
	keys = {
		-- Zen Mode: Focus on code
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		-- Debug: Inspect variables/state
		{
			"<leader>nd",
			function()
				Snacks.debug()
			end,
			desc = "Snacks Debug",
		},
		-- Bufdelete others
		{
			"<leader>xo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete Other Buffers",
		},
		-- Open Lazygit
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		-- Notification History
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		-- Dismiss All Notifications
		{
			"<leader>nd",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
	},
}
