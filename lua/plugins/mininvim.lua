return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons() -- Hijack nvim-web-devicons
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.files").setup()
		require("mini.cursorword").setup()
		require("mini.bracketed").setup()
		require("mini.clue").setup()
		require("mini.indentscope").setup()
		require("mini.move").setup()
		require("mini.operators").setup()
	end,
}
