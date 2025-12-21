return {
	{
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "kitty", -- or "ueberzugpp", "wezterm"
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
				},
			},
			max_width = 100,
			max_height = 12,
		},
	},
}
