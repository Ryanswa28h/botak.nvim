-- Simple config :)
return {
	{
		"mason-org/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonLog",
			"MasonUpdate",
			"MasonUninstallAll",
			"MasonToolsInstall",
			"MasonToolsInstallSync",
			"MasonToolsUpdate",
			"MasonToolsUpdateSync",
			"MasonToolsClean",
		},
		config = function()
			require("mason").setup()
		end,
	},
}
