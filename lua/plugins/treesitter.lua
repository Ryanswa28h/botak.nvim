return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"dockerfile",
				"html",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = false,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = {
				enable = true,
				disable = { "ruby" },
			},
		},
	},
}
