return {
	"stevearc/conform.nvim",
	event = "VeryLazy",

	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({
					lsp_format = "fallback",
					async = false,
					timeout_ms = 1000,
				})
			end,
			mode = { "n", "v" },
			desc = "Format buffer or range",
		},
	},

	opts = {
		formatters = {
			biome = {
				require_cwd = false,
			},

			shfmt = {
				prepend_args = { "-i", "4" },
			},
		},

		formatters_by_ft = {
			lua = { "stylua" },

			python = {
				"ruff_format",
				"ruff_organize_imports",
			},

			javascript = { "biome" },
			javascriptreact = { "biome" },
			typescript = { "biome" },
			typescriptreact = { "biome" },

			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },

			sh = { "shfmt" },
			bash = { "shfmt" },

			c = { "clang-format" },
			cpp = { "clang-format" },
		},

		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
	},
}
