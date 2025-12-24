return {
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			render = "compact",
		},
		init = function()
			vim.notify = require("notify").setup({
				background_colour = "#303030",
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			cmdline = { view = "cmdline_popup" },
			messages = { view = "mini" },
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		},
		config = function()
			require("noice").setup({
				routes = {
					{
						filter = {
							event = "msg_show",
							any = {
								{ find = "is deprecated" },
								{ find = "nvim_buf_set_option" },
							},
						},
						opts = { skip = true },
					},
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"nvim-mini/mini.hipatterns",
		event = "VeryLazy",
		config = function()
			vim.api.nvim_create_autocmd("TextYankPost", {
				callback = function()
					vim.highlight.on_yank({
						higroup = "IncSearch",
						timeout = 120,
					})
				end,
			})
		end,
	},
}
