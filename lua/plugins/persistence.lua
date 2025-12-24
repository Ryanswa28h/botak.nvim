return {
	"folke/persistence.nvim",
	lazy = false,
	opts = function()
		return {
			dir = vim.fn.stdpath("state") .. "/sessions/",
			options = { "buffers", "curdir", "tabpages", "winsize" },
		}
	end,
}
