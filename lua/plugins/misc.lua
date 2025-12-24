-- Standalone plugins with less than 20 lines of config go here
return {
	{
		-- autoclose tags
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				per_filetype = {
					["html"] = {
						enable_close = true,
					},
				},
			})
		end,
	},
	{
		-- detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		"RRethy/nvim-treesitter-endwise",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			win = {
				border = "rounded",
				padding = { 1, 2 },
				title_pos = "center",
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
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
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
			require("colorizer").setup()
		end,
	},
}
