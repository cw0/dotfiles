local M = {}

function M.setup()
	local path_status_ok, path = pcall(require, "mason-core.path")
	if not path_status_ok then
		return
	end

	local dap_status_ok, dap = pcall(require, "dap")
	if not dap_status_ok then
		return
	end

	local dap_ui_status_ok, dapui = pcall(require, "dapui")
	if not dap_ui_status_ok then
		return
	end

	dapui.setup()

	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

	-- We need to wait for execution to stop at the first breakpoint before showing the UI to give the source maps time to generate.
	-- If we don't, the UI will close because the source maps haven't generated in time.
	dap.listeners.after.event_breakpoint["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "js-debug-adapter", -- As I'm using mason, this will be in the path
			args = { "${port}" },
		},
	}

	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to node",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}
	end

	-- Debugging
	local opts = { noremap = true, silent = true }
	local keymap = vim.keymap.set
	keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>", opts)
	keymap("n", "<leader>dc", ":lua require('dap').continue()<cr>", opts)
	keymap("n", "<leader>di", ":lua require('dap').step_into()<cr>", opts)
	keymap("n", "<leader>do", ":lua require('dap').step_over()<cr>", opts)
	keymap("n", "<leader>dO", ":lua require('dap').step_out()<cr>", opts)
	keymap("n", "<leader>dr", ":lua require('dap').repl.toggle()<cr>", opts)
	keymap("n", "<leader>dl", ":lua require('dap').run_last()<cr>", opts)
	keymap("n", "<leader>du", ":lua require('dapui').toggle()<cr>", opts)
	keymap("n", "<leader>dt", ":lua require('dap').terminate()<cr>", opts)
end

return M
