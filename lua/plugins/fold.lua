return {
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			-- UFO needs a large foldlevel to start with everything open
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			require("ufo").setup({
				close_fold_kinds_for_ft = {
					default = {},
				},
				provider_selector = function(bufnr, filetype, buftype)
					return { "lsp", "indent" }
				end,
			})
		end,
	},
	-- {
	-- 	"chrisgrieser/nvim-origami",
	-- 	version = "v1.9",
	-- 	event = "BufReadPost",
	-- 	opts = {
	-- 		pauseFoldsOnSearch = true,
	-- 	},
	-- },
	{
		"jghauser/fold-cycle.nvim",
		event = "VeryLazy",
		opts = {},
		init = function()
			vim.keymap.set("n", "zr", function()
				return require("fold-cycle").open()
			end, { desc = "Fold-cycle: open next level" })
			vim.keymap.set("n", "zm", function()
				return require("fold-cycle").close()
			end, { desc = "Fold-cycle: close next level" })
			vim.keymap.set("n", "zC", function()
				return require("fold-cycle").close_all()
			end, { desc = "Fold-cycle: close everything in this block" })
		end,
	},
}
