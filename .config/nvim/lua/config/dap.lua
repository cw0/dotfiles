local mason_nvim_dap_status, mason_nvim_dap = pcall(require, 'mason-nvim-dap')
if not mason_nvim_dap_status then return end

-- todo update this repo to work for this adapter
mason_nvim_dap.setup({
  ensure_installed = {
    'js-debug-adapter'
  },
  automatic_installation = true,
})

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

local dap_vscode_js_status_ok, dap_vscode_js = pcall(require, "dap-vscode-js")
if not dap_vscode_js_status_ok then
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

dap_vscode_js.setup({
  adapters = { "pwa-node" },
  debugger_path = path.concat({ vim.fn.stdpath("data"), "mason", "packages", "js-debug-adapter" }),
})


-- Debugging
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require('dap').terminate()<cr>", opts)
