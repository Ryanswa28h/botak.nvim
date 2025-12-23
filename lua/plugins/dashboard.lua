return {
	"echasnovski/mini.starter",
	version = false,
	event = "VimEnter",
	config = function()
		local starter = require("mini.starter")

		-- Helper: Startup Stats Footer
		local function get_footer()
			if package.loaded.lazy then
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
			end
			return "⚡ Neovim loaded"
		end

		-- Helper: Telescope Wrapper
		local function telescope(picker)
			return function()
				local ok, builtin = pcall(require, "telescope.builtin")
				if ok then
					builtin[picker]()
				else
					print("Telescope not found")
				end
			end
		end

		starter.setup({
			evaluate_single = true,
			header = [[
 Botak ██████╗  ██████╗ ████████╗ █████╗ ██╗  ██╗     ███╗   ██╗██╗   ██╗██╗███╗   ███╗ Botak
 Botak ██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗██║ ██╔╝     ████╗  ██║██║   ██║██║████╗ ████║ Botak
 Botak ██████╔╝██║   ██║   ██║   ███████║█████╔╝      ██╔██╗ ██║██║   ██║██║██╔████╔██║ Botak
 Botak ██╔══██╗██║   ██║   ██║   ██╔══██║██╔═██╗      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ Botak
 Botak ██████╔╝╚██████╔╝   ██║   ██║  ██║██║  ██╗ ██╗ ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ Botak
 Botak ╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ Botak
			]],
			-- Keybindings are the first letter of the name (e.g., 'f' for Find File)
			items = {
				{ name = "f  Find File", action = telescope("find_files"), section = "Files" },
				{ name = "n  New File", action = "ene | startinsert", section = "Files" },
				{ name = "r  Recent Files", action = telescope("oldfiles"), section = "Files" },
				{
					name = "p  Projects",
					action = "lua require'telescope'.extensions.projects.projects{}",
					section = "Files",
				},
				{ name = "g  Find Text", action = telescope("live_grep"), section = "Search" },
				{
					name = "c  Config",
					action = function()
						require("telescope.builtin").find_files({
							cwd = vim.fn.stdpath("config"),
						})
					end,
					section = "Config",
				},
				{
					name = "s  Restore Session",
					action = function()
						require("persistence").load({ last = true })
					end,
					section = "Search",
				},
				{ name = "l  Lazy", action = "Lazy", section = "Config" },
				{ name = "q  Quit", action = "qa", section = "Quit" },
			},
			content_hooks = {
				starter.gen_hook.adding_bullet(""),
				starter.gen_hook.aligning("center", "center"),
			},
			footer = get_footer(),
		})

		-- Colors
		vim.api.nvim_set_hl(0, "MiniStarterHeader", { fg = "#89b4fa" })
		vim.api.nvim_set_hl(0, "MiniStarterSection", { fg = "#fab387", bold = true })
		vim.api.nvim_set_hl(0, "MiniStarterItem", { fg = "#cdd6f4" })
		vim.api.nvim_set_hl(0, "MiniStarterFooter", { fg = "#f38ba8" })
	end,
}
