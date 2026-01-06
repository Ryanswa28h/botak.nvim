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
		opts = { signs = false },
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
				auto_attach = true, -- Automatically attach to any LSP that supports symbols
			},
			highlight = true, -- Uses colors for icons (Class is different color than Function)
			separator = " > ",
		},
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
		"kevinhwang91/nvim-ufo",
		event = "BufReadPost",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		opts = {
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		},
	},
}
