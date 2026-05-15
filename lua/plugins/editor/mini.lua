local open_mini_files = function()
	local buf_name = vim.api.nvim_buf_get_name(0)
	local path = vim.fs.dirname(buf_name)
	if path == nil or path == "." or path == "" then
		path = vim.uv.os_homedir()
	end
	require("mini.files").open(path)
end

return {
	{
		"nvim-mini/mini.nvim",
		lazy = false,
		priority = 1000,
		keys = {
			{ "-", open_mini_files, desc = "Open MiniFiles at Current Buffer" },
			{
				"<leader>E",
				function()
					require("mini.files").open()
				end,
				desc = "Open MiniFiles",
			},
		},
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()

			require("mini.files").setup({
				windows = { preview = true, width_preview = 65 },
				options = { use_as_default_explorer = true },
			})

			-- Equivalent to VeryLazy
			vim.schedule(function()
				require("mini.ai").setup({})
				require("mini.surround").setup({})
				require("mini.move").setup({})
				require("mini.operators").setup({})
				require("mini.bracketed").setup({})
				require("mini.pairs").setup({})
				require("mini.git").setup({ job = { timeout = 5000 } })
				-- require("mini.statusline").setup({})

				local hipatterns = require("mini.hipatterns")
				hipatterns.setup({
					highlighters = {
						hex_color = hipatterns.gen_highlighter.hex_color({ priority = 2000 }),
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
			end)
		end,
	},
}
