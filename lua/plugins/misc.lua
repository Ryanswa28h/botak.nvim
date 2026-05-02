-- Standalone plugins with less than 20 lines of config go here
return {
	{
		-- autoclose tags
		"windwp/nvim-ts-autotag",
		config = true,
	},
	{
		-- detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		"RRethy/nvim-treesitter-endwise",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			win = {
				border = "rounded",
				padding = { 1, 2 },
				title_pos = "left",
			},
			layout = {
				align = "center",
			},
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
		},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},
	{
		-- high-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup(_, {
				DEFAULT_OPTIONS = {
					RGB = true,
					RRGGBB = true,
					names = true,
					RRGGBBAA = false,
					rgb_fn = false,
					hsl_fn = false,
					css = false,
					css_fn = false,
					mode = "background",
				},
			})
		end,
	},
	-- {
	-- 	-- Code header
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	config = function()
	-- 		vim.keymap.set("n", "co", function()
	-- 			require("treesitter-context").go_to_context(vim.v.count1)
	-- 		end, { silent = true })
	-- 	end,
	-- },
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
		opts = {
			lsp = {
				auto_attach = true,
				preference = { "lua_ls", "pyright", "clangd" },
			},
			highlight = true,
			separator = " > ",
			click_to_skip = true,
			depth_limit = 3,
			depth_limit_indicator = "..",
			filter_errors = true,
			filter_kinds = {
				"Class",
				-- "Constructor",
				-- "Enum",
				"Function",
				-- "Interface",
				"Method",
				-- "Module",
				"Struct",
			},
		},
		config = function(_, opts)
			local navic = require("nvim-navic")
			navic.setup(opts)

			-- Optional: If you want to EXCLUDE specific types globally
			-- (e.g., don't show Variables or Packages)
			vim.g.navic_silence = true -- Keeps it quiet if no LSP is attached
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"stevearc/quicker.nvim",
		ft = "qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {},
	},
	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
	},
	{ "nvzone/showkeys", cmd = "ShowkeysToggle", opts = { maxkeys = 5, timeout = 3 } },
	{
		"rainbowhxch/beacon.nvim",
		event = "CursorMoved",
		cond = function()
			-- Don't load in neovide
			return not vim.g.neovide
		end,
	},
	{
		"lewis6991/satellite.nvim",
		event = "BufWinEnter",
		opts = { excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" } },
	},
	{
		"Wansmer/treesj",
		keys = { { "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" } },
		cmd = { "TSJToggle" },
		opts = { use_default_keymaps = false },
		init = function()
			local map = vim.keymap.set
			map("n", "<leader>tt", "<CMD>TSJToggle<CR>", { desc = "Toggle Treesitter Join/Split" })
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			require("illuminate").configure({
				delay = 200,
				large_file_cutoff = 2000,
				providers = { "regex" },
				under_cursor = true,
			})
		end,
	},
	{
		"bngarren/checkmate.nvim",
		ft = "markdown",
		opts = {},
	},
	{
		"necrom4/calcium.nvim",
		cmd = { "Calcium" },
		opts = {},
	},
	{
		"sontungexpt/url-open",
		event = "VeryLazy",
		cmd = "URLOpenUnderCursor",
		config = function()
			local status_ok, url_open = pcall(require, "url-open")
			if not status_ok then
				return
			end
			url_open.setup({})
		end,
	},
	{
		"vidocqh/data-viewer.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kkharji/sqlite.lua", -- Optional, sqlite support
		},
	},
	{
		"emmanueltouzery/decisive.nvim",
		config = function()
			require("decisive").setup({})
		end,
		lazy = true,
		ft = { "csv" },
		keys = {
			{
				"<leader>cca",
				":lua require('decisive').align_csv({})<cr>",
				{ silent = true },
				desc = "Align CSV",
				mode = "n",
			},
			{
				"<leader>ccA",
				":lua require('decisive').align_csv_clear({})<cr>",
				{ silent = true },
				desc = "Align CSV clear",
				mode = "n",
			},
			{
				"[c",
				":lua require('decisive').align_csv_prev_col()<cr>",
				{ silent = true },
				desc = "Align CSV prev col",
				mode = "n",
			},
			{
				"]c",
				":lua require('decisive').align_csv_next_col()<cr>",
				{ silent = true },
				desc = "Align CSV next col",
				mode = "n",
			},
		},
	},
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled", -- or "VeryLazy"
		config = function()
			local neoscroll = require("neoscroll")

			neoscroll.setup({
				duration_multiplier = 0.5,
				easing = "quadratic",
			})

			local keymap = {
				["<C-u>"] = function()
					neoscroll.ctrl_u({ duration = 150 })
				end,
				["<C-d>"] = function()
					neoscroll.ctrl_d({ duration = 150 })
				end,
			}

			local modes = { "n", "v", "x" }
			for key, func in pairs(keymap) do
				vim.keymap.set(modes, key, func, { silent = true })
			end
		end,
	},
}
