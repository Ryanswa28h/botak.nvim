return {
	"christoomey/vim-tmux-navigator",
	init = function()
		vim.g.tmux_navigator_no_mappings = 1
	end,
	config = function()
		vim.api.nvim_set_keymap("n", "<C-h>", [[<cmd>TmuxNavigateLeft<cr>]], { silent = true, noremap = true })
		vim.api.nvim_set_keymap("n", "<C-j>", [[<cmd>TmuxNavigateDown<cr>]], { silent = true, noremap = true })
		vim.api.nvim_set_keymap("n", "<C-k>", [[<cmd>TmuxNavigateUp<cr>]], { silent = true, noremap = true })
		vim.api.nvim_set_keymap("n", "<C-l>", [[<cmd>TmuxNavigateRight<cr>]], { silent = true, noremap = true })

		vim.api.nvim_set_keymap(
			"t",
			"<C-h>",
			[[<C-\><C-n><cmd>TmuxNavigateLeft<cr>]],
			{ silent = true, noremap = true }
		)
		vim.api.nvim_set_keymap(
			"t",
			"<C-j>",
			[[<C-\><C-n><cmd>TmuxNavigateDown<cr>]],
			{ silent = true, noremap = true }
		)
		vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><cmd>TmuxNavigateUp<cr>]], { silent = true, noremap = true })
		vim.api.nvim_set_keymap(
			"t",
			"<C-l>",
			[[<C-\><C-n><cmd>TmuxNavigateRight<cr>]],
			{ silent = true, noremap = true }
		)
	end,
}
