local set_hl = vim.api.nvim_set_hl

set_hl(0, "BlinkCmpSourceCopilot", { fg = "#6CC644", italic = true })
set_hl(0, "BlinkCmpSourceLsp", { fg = "#7AA2F7", bold = true })
set_hl(0, "BlinkCmpSourceSnippets", { fg = "#f38ba8" })
set_hl(0, "BlinkCmpSourceBuffer", { fg = "#9ECE6A" })
set_hl(0, "BlinkCmpSourcePath", { fg = "#E0AF68" })

return {
	"saghen/blink.cmp",
	lazy = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			config = function()
				require("copilot").setup({
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
			end,
		},
		{
			"giuxtaposition/blink-cmp-copilot",
		},
	},
	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "super-tab",
			["<C-y>"] = { "accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			-- ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			-- ["<CR>"] = {},
			-- ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			-- ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			-- ["<C-l>"] = { "snippet_forward", "fallback" },
			-- ["<C-h>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿",
				Method = "m",
				Function = "󰊕",
				Constructor = "",
				Field = "",
				Variable = "󰆧",
				Class = "󰌗",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰇽",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰊄",
				Copilot = "",
			},
		},

		sources = {
			default = {
				--"copilot",
				"snippets",
				"lsp",
				"path",
				"buffer",
			},
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},

		completion = {
			menu = {
				border = "rounded", -- "single", "rounded", "double", "solid", "shadow"
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					components = {
						source_name = {
							text = function(ctx)
								local source_names = {
									Copilot = " AI",
									LSP = "󰌵 LSP",
									Snippets = " Snippet",
									Buffer = "󰉿 Buffer",
									Path = "󰈙 Path",
									-- Copilot = "[AI]",
									-- LSP = "[LSP]",
									-- Snippets = "[Snip]",
									-- Buffer = "[Buffer]",
									-- Path = "[Path]",
								}
								-- return source_names[ctx.source_name] or "[" .. ctx.source_name .. "]"
								local display = source_names[ctx.source_name] or ctx.source_name
								return display
							end,
							highlight = function(ctx)
								return "BlinkCmpSource"
									.. ctx.source_name:sub(1, 1):upper()
									.. ctx.source_name:sub(2):lower()
							end,
						},
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = "rounded", -- "single", "rounded", "double", "solid", "shadow"
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
				},
			},
			ghost_text = {
				enabled = false, -- Matching your ghost_text = false
			},
			trigger = {
				show_in_snippet = false,
			},
		},

		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},

		cmdline = {
			enabled = true,
			keymap = {
				preset = "super-tab", -- Disable super-tab
				["<C-y>"] = { "accept", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				-- ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				-- ["<Tab>"] = { "select_next", "fallback" },
				-- ["<S-Tab>"] = { "select_prev", "fallback" },
			},
			completion = {
				menu = {
					auto_show = true,
				},
				trigger = {
					show_in_snippet = false,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
