return {
	"NStefan002/screenkey.nvim",
	lazy = false,
	config = function()
		require("screenkey").setup({
			win_opts = {
				row = vim.o.lines - 2,
				col = vim.o.columns - 1,
				anchor = "SE",
				border = "rounded",
			},
			show_leader = true,
			group_mappings = true,
		})

		vim.keymap.set("n", "<leader>sk", "<cmd>Screenkey<CR>", { desc = "Toggle Screenkey" })
	end,
}
