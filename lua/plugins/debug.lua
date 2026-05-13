return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			ensure_installed = { "python", "cpptools", "js-debug-adapter" },
			automatic_installation = true,
		})

		dapui.setup()
		require("dap-python").setup("python3")

		-- 1. DEFINE THE JS ADAPTER
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
					"${port}",
				},
			},
		}

		-- 2. CONFIGURATIONS
		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch Current File (pwa-node)", -- THIS WAS MISSING
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to Process",
				processId = require("dap.utils").pick_process,
				cwd = vim.fn.getcwd(),
			},
		}
		dap.configurations.typescript = dap.configurations.javascript

		-- Config for C++
		dap.configurations.cpp = {
			{
				name = "Launch file", -- Included name here too
				type = "cpptools",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
		}

		-- 3. LISTENERS
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- 4. KEYMAPS
		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "Run or continue the debugger" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		-- ... rest of your keymaps
	end,
}
