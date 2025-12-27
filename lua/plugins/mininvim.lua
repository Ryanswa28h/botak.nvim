return {
	"nvim-mini/mini.nvim",
	version = false,
	lazy = false,
	priority = 1001,
	config = function()
		require("mini.icons").setup()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.cursorword").setup()
		require("mini.bracketed").setup()
		require("mini.clue").setup()
		require("mini.pairs").setup()
		require("mini.indentscope").setup()
		require("mini.bufremove").setup()
		require("mini.move").setup()
		require("mini.operators").setup()
		require("mini.jump").setup()
		require("mini.visits").setup()
		-- require("mini.animate").setup()

		require("mini.files").setup({
			windows = {
				preview = true,
				width_preview = 65,
			},
		})

		local jump2d = require("mini.jump2d")
		jump2d.setup({
			allowed_lines = { blank = false, cursor_before = true, cursor_after = true },
			allowed_windows = { current = true, not_current = true },
			mappings = {
				start_jumping = "<leader>j",
			},
			view = {
				dim = false,
			},
			spotlight = { enabled = true },
		})

		local diff = require("mini.diff")
		diff.setup({
			view = {
				style = "sign",
				-- Thick vertical bars look great with modern fonts
				signs = { add = "+", change = "~", delete = "-" },
			},
		})

		-- Hijack nvim-web-devicons
		MiniIcons.mock_nvim_web_devicons()

		-- Keymaps: mini.visits
		local visits = require("mini.visits")
		vim.keymap.set("n", "<leader>vr", function()
			visits.select_path()
		end, { desc = "Recent Files (Smart)" })
		vim.keymap.set("n", "<leader>va", function()
			visits.add_label()
		end, { desc = "Add Visit Label" })
		vim.keymap.set("n", "<leader>vl", function()
			visits.select_label()
		end, { desc = "Select Visit Label" })
		vim.keymap.set("n", "<leader>vd", function()
			visits.remove_label()
		end, { desc = "Remove Visit Label" })

		-- Keymaps: mini.jump2d
		vim.keymap.set("n", "<leader>L", function()
			jump2d.start(jump2d.builtin_opts.line_start)
		end, { desc = "Jump to Line Start" })

		-- Keymaps: mini.diff
		vim.keymap.set("n", "<leader>gd", diff.toggle_overlay, { desc = "Toggle Diff Overlay" })
		vim.keymap.set("n", "]h", function()
			diff.goto_hunk("next")
		end, { desc = "Next Hunk" })
		vim.keymap.set("n", "[h", function()
			diff.goto_hunk("prev")
		end, { desc = "Prev Hunk" })
	end,
}
