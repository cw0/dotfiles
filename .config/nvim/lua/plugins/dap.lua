return {
  "rcarriga/nvim-dap-ui",
  config = function()
    local dap_status_ok, dap = pcall(require, "dap")
    if not dap_status_ok then
      return
    end

    local dap_ui_status_ok, dapui = pcall(require, "dapui")
    if not dap_ui_status_ok then
      return
    end

    local dap_go_status_ok, dap_go = pcall(require, "dap-go")
    if not dap_go_status_ok then
      return
    end

    local dap_python_status_ok, dap_python = pcall(require, "dap-python")
    if not dap_python_status_ok then
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

    dap_go.setup({})

    dap_python.setup("~/.venv/debugpy/bin/python")
  end,
  dependencies = {
    "mfussenegger/nvim-dap",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
  },
  event = "VeryLazy",
  keys = {
    { "<leader>db",  "<cmd>lua require('dap').toggle_breakpoint()<cr>",  desc = "toggle breakpoint" },
    { "<leader>dc",  "<cmd>lua require('dap').continue()<cr>",           desc = "continue" },
    { "<leader>di",  "<cmd>lua require('dap').step_into()<cr>",          desc = "step into" },
    { "<leader>dl",  "<cmd>lua require('dap').run_last()<cr>",           desc = "run last" },
    { "<leader>dmg", "<cmd>lua require('dap-go').debug_test()<cr>",      desc = "go: test nearest method" },
    { "<leader>dmp", "<cmd>lua require('dap-python').test_method()<cr>", desc = "python: test nearest method" },
    { "<leader>do",  "<cmd>lua require('dap').step_over()<cr>",          desc = "step over" },
    { "<leader>dO",  "<cmd>lua require('dap').step_out()<cr>",           desc = "step out" },
    { "<leader>dr",  "<cmd>lua require('dap').repl.toggle()<cr>",        desc = "toggle repl" },
    { "<leader>dt",  "<cmd>lua require('dap').terminate()<cr>",          desc = "terminate dap" },
    { "<leader>du",  "<cmd>lua require('dapui').toggle()<cr>",           desc = "toggle dapui" },
  },
}
