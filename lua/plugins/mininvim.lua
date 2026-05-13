local open_mini_files = function()
	local buf_name = vim.api.nvim_buf_get_name(0)
	local path = vim.fs.dirname(buf_name)

	-- If path is nil/empty or it's a special buffer, use home directory
	if path == nil or path == "." or path == "" then
		path = vim.uv.os_homedir()
	end

	require("mini.files").open(path)
end

return {
	-- 1. Mini Icons (Load early for UI)
	{
		"nvim-mini/mini.icons",
		lazy = true,
		opts = {},
		config = function(_, opts)
			require("mini.icons").setup(opts)
			MiniIcons.mock_nvim_web_devicons()
		end,
	},

	-- 2. Mini Ai & Surround (Load on text objects/editing)
	{ "nvim-mini/mini.ai", event = "VeryLazy", opts = {} },
	{ "nvim-mini/mini.surround", event = "VeryLazy", opts = {} },

	-- 3. Mini Move & Operators
	{ "nvim-mini/mini.move", event = "VeryLazy", opts = {} },
	{ "nvim-mini/mini.operators", event = "VeryLazy", opts = {} },

	-- 4. Mini Bracketed
	{ "nvim-mini/mini.bracketed", event = "VeryLazy", opts = {} },

	-- 5. Mini Files (Load only on keypress)
	{
		"nvim-mini/mini.files",
		lazy = false,
		keys = {
			{
				"-",
				open_mini_files,
				desc = "Open MiniFiles at Current Buffer",
			},
			{
				"<leader>E",
				function()
					require("mini.files").open()
				end,
				desc = "Open MiniFiles",
			},
		},
		opts = {
			windows = { preview = true, width_preview = 65 },
			options = { use_as_default_explorer = true },
		},
	},
}
