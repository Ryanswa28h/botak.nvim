return {
	"nvim-mini/mini.nvim",
	version = false,
	lazy = false,
	priority = 1001,
	config = function()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons() -- Hijack nvim-web-devicons
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.files").setup({
			windows = {
				preview = true,
				width_preview = 65,
			},
		})
		require("mini.cursorword").setup()
		require("mini.bracketed").setup()
		require("mini.clue").setup()
		require("mini.pairs").setup()
		require("mini.indentscope").setup()
		require("mini.bufremove").setup()
		require("mini.move").setup()
		require("mini.operators").setup()
		-- require("mini.animate").setup()
	end,
}
