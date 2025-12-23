return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.completion").setup()
		require("mini.surround").setup()
		require("mini.files").setup()
	end,
}
