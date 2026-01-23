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

return {
	"folke/snacks.nvim",
	event = "VimEnter",
	---@type snacks.Config
	opts = {
		-- You need this picker section to fix the "no root box" error
		picker = {
			layout = { preset = "telescope" },
		},
		dashboard = {
			width = 80,
			row = nil,
			col = nil,
			pane_gap = 2,
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
			preset = {
				pick = nil,
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = telescope("find_files") },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Live Grep",
						action = telescope("live_grep"),
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = telescope("oldfiles"),
					},
					{
						icon = " ",
						key = "p",
						desc = "Projects",
						action = ":lua require('telescope').extensions.projects.projects{}",
					},
					{
						icon = " ",
						key = "t",
						desc = "ToDo List",
						action = function()
							require("utils.todo")()
						end,
					},
					{
						icon = " ",
						key = "b",
						desc = "Journal / Braindump",
						action = function()
							require("utils.journal")()
						end,
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = function()
							require("telescope.builtin").find_files({
								cwd = vim.fn.stdpath("config"),
							})
						end,
					},
					{
						icon = " ",
						key = "s",
						desc = "Restore Session",
						action = ":lua require('persistence').load({ last = true })",
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
██████╗  ██████╗ ████████╗ █████╗ ██╗  ██╗     ███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗██║ ██╔╝     ████╗  ██║██║   ██║██║████╗ ████║
██████╔╝██║   ██║   ██║   ███████║█████╔╝      ██╔██╗ ██║██║   ██║██║██╔████╔██║
██╔══██╗██║   ██║   ██║   ██╔══██║██╔═██╗      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝╚██████╔╝   ██║   ██║  ██║██║  ██╗ ██╗ ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
	]],
			},
			formats = {
				icon = function(item)
					if item.file and item.icon == "file" or item.icon == "directory" then
						return Snacks.dashboard.icon(item.file, item.icon)
					end
					return { item.icon, width = 2, hl = "icon" }
				end,
				footer = { "%s", align = "center" },
				header = { "%s", align = "center" },
				file = function(item, ctx)
					local fname = vim.fn.fnamemodify(item.file, ":~")
					fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
					if #fname > ctx.width then
						local dir = vim.fn.fnamemodify(fname, ":h")
						local file = vim.fn.fnamemodify(fname, ":t")
						if dir and file then
							file = file:sub(-(ctx.width - #dir - 2))
							fname = dir .. "/…" .. file
						end
					end
					local dir, file = fname:match("^(.*)/(.+)$")
					return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
				end,
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
	keys = {
		{
			"<leader>ss",
			function()
				Snacks.dashboard.open()
			end,
			desc = "Open Dashboard",
		},
	},
}
