return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bufdelete = { enabled = true },
		-- animate = { enabled = true },
		-- scroll = { enabled = true },
		debug = { enabled = true },
		quickfile = { enabled = true },
		-- zen = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					trash = true,
				},
			},
		},
		-- layout = { enabled = true },
		-- lazygit = { enabled = true },
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
		-- {
		-- 	"<leader>z",
		-- 	function()
		-- 		Snacks.zen()
		-- 	end,
		-- 	desc = "Toggle Zen Mode",
		-- },
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
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete Other Buffers",
		},
		-- Bufdelete (Force)
		{
			"<leader>bD",
			function()
				Snacks.bufdelete.delete()
			end,
			desc = "Force Delete Buffer",
		},
		-- Bufdelete
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
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
		{
			"<leader>np",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History (Picker)",
		},
		-- Dismiss All Notifications
		{
			"<leader>nn",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		-- Basic Navigation
		{
			"<leader>,",
			function()
				Snacks.picker.buffers({ layout = "default" })
			end,
			desc = "Search Buffers",
		},
		{
			"<leader><tab>",
			function()
				Snacks.picker.buffers({ layout = "default" })
			end,
			desc = "Search existing Buffers",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.files({ layout = "default" })
			end,
			desc = "Find Files",
		},
		{
			"<leader>sf",
			function()
				Snacks.picker.files({ layout = "default" })
			end,
			desc = "Search Files",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ layout = "default" })
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>so",
			function()
				Snacks.picker.recent({ layout = "default" })
			end,
			desc = "Search Oldfiles",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent({ layout = "default" })
			end,
			desc = "[F]ind [R]ecents",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks({ layout = "default" })
			end,
			desc = "Search Marks",
		},

		-- Git Operations
		{
			"<leader>gf",
			function()
				Snacks.picker.git_files({ layout = "default" })
			end,
			desc = "Search Git Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files({ layout = "default" })
			end,
			desc = "[F]ind [G]it",
		},
		{
			"<leader>gcc",
			function()
				Snacks.picker.git_log({ layout = "default" })
			end,
			desc = "Search Git Commits",
		},
		{
			"<leader>gcf",
			function()
				Snacks.picker.git_log_file({ layout = "default" })
			end,
			desc = "Search Git Commits (File)",
		},
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches({ layout = "default" })
			end,
			desc = "Search Git Branches",
		},
		{
			"<leader>sgs",
			function()
				Snacks.picker.git_status({ layout = "default" })
			end,
			desc = "Search Git Status",
		},

		-- Search/Grep
		{
			"<leader>sh",
			function()
				Snacks.picker.help({ layout = "default" })
			end,
			desc = "Search Help",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word({ layout = "default" })
			end,
			desc = "Search current Word",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep({ layout = "default" })
			end,
			desc = "Search by Grep",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep({ layout = "default" })
			end,
			desc = "[F]ind [W]ords (Grep)",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics({ layout = "default" })
			end,
			desc = "Search Diagnostics",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.resume({ layout = "default" })
			end,
			desc = "Search Resume",
		},
		{
			'<leader>"',
			function()
				Snacks.picker.registers({ layout = "default" })
			end,
			desc = "Search Register",
		},
		{
			"<leader>sx",
			function()
				Snacks.picker.registers({ layout = "default" })
			end,
			desc = "Search Register",
		},

		-- UI / Theme
		{
			"<leader>sth",
			function()
				Snacks.picker.colorschemes({ layout = "default" })
			end,
			desc = "Search Colorschemes",
		},

		-- Todo Comments (requires todo-comments.nvim)
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments({ layout = "default" })
			end,
			desc = "[T]odo Picker",
		},
		{
			"<leader>sT",
			function()
				Snacks.picker.todo_comments({ layout = "default", keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
		},

		-- Specialized Search
		{
			"<leader>s/",
			function()
				Snacks.picker.lines({ layout = "default" })
			end,
			desc = "Search in Open Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.lines({ layout = "default" })
			end,
			desc = "Fuzzily search in current buffer",
		},

		-- LSP Symbols
		-- {
		-- 	"<leader>sds",
		-- 	function()
		-- 		Snacks.picker.lsp_symbols()
		-- 	end,
		-- 	desc = "Search LSP document Symbols",
		-- },

		-- Search and Replace
		{
			"<leader>gr",
			mode = { "n", "v" },
			function()
				vim.ui.input({ prompt = "Search for: " }, function(search)
					if not search or search == "" then
						return
					end
					vim.ui.input({ prompt = "Replace with: " }, function(replace)
						if replace == nil then
							return
						end
						local cmd = string.format("%%s/%s/%s/g", search, replace)
						local success, err = pcall(vim.cmd, cmd)
						if success then
							print(string.format("Replaced '%s' with '%s'", search, replace))
						else
							print("Error: " .. err)
						end
					end)
				end)
			end,
			desc = "Go Search and Replace",
		},
		-- Todo Picker (Replaces TodoTelescope)
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments({ layout = "default" })
			end,
			desc = "[T]odo Picker",
		},
		-- Todo/Fix/Fixme (Replaces TodoTelescope with specific keywords)
		{
			"<leader>sT",
			function()
				Snacks.picker.todo_comments({
					layout = "default",
					keywords = { "TODO", "FIX", "FIXME" },
				})
			end,
			desc = "Todo/Fix/Fixme",
		},
		{
			"<leader>sth",
			function()
				Snacks.picker.colorschemes({ layout = "default" })
			end,
			desc = "Search Colorschemes",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps({ layout = "default" })
			end,
			desc = "Search Keymaps",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects({ layout = "default" })
			end,
			desc = "Projects",
		},
		{
			"<leader>e",
			function()
				Snacks.picker.explorer()
			end,
			desc = "Snacks Explorer",
		},
	},
}
