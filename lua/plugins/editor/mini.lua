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
		init = function(_, opts)
			require("mini.icons").setup(opts)
			MiniIcons.mock_nvim_web_devicons()
		end,
	},

	-- 2. Mini Ai & Surround (Load on text objects/editing)
	{ "nvim-mini/mini.ai", event = "VeryLazy", opts = {} },
	{ "nvim-mini/mini.surround", event = "VeryLazy", opts = {} },

	-- 3. Mini Move, Pairs, Operators
	{ "nvim-mini/mini.move", event = "VeryLazy", opts = {} },
	{ "nvim-mini/mini.operators", event = "VeryLazy", opts = {} },
	{ "nvim-mini/mini.pairs", event = "InsertEnter", opts = {} },

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

	-- 6. Mini Git
	{
		"nvim-mini/mini-git",
		event = "VeryLazy",
		version = false,
		opts = {
			job = { timeout = 5000 },
		},
		config = function(_, opts)
			require("mini.git").setup(opts)
		end,
		keys = {
			{ "<leader>g!", ":Git ", desc = "Git Command" },
			{ "<leader>gh", "<cmd>lua MiniGit.show_at_cursor()<cr>", desc = "Git History (Cursor)" },
		},
	},

	-- 7. Mini Hipatterns
	{
		"nvim-mini/mini.hipatterns",
		event = "VeryLazy",
		config = function()
			local hipatterns = require("mini.hipatterns")

			hipatterns.setup({
				highlighters = {
					-- 1. Standard Hex Colors (#aabbcc)
					hex_color = hipatterns.gen_highlighter.hex_color({ priority = 2000 }),

					-- 2. Shorthand Hex Colors (#abc)
					shorthand = {
						pattern = "()#%x%x%x()%f[^%x%w]",
						group = function(_, _, data)
							local match = data.full_match
							local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
							local hex_color = "#" .. r .. r .. g .. g .. b .. b
							return hipatterns.compute_hex_color_group(hex_color, "bg")
						end,
						extmark_opts = { priority = 2000 },
					},
				},
			})
		end,
	},
}
