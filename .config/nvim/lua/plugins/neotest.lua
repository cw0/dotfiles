return {
  "nvim-neotest/neotest",
  config = function()
    local neotest_status_ok, neotest = pcall(require, "neotest")
    if not neotest_status_ok then
      print("neotest failed to load")
      return
    end

    -- TODO: swap to pcall for stability
    neotest.setup({
      adapters = {
        require("neotest-go"),
        require("neotest-jest")({
          env = { CI = true },
          cwd = function(path)
            -- return vim.fn.getcwd()
            local cwd = require("neotest-jest.util").find_package_json_ancestor(path)
            return cwd
          end,
        }),
        require("neotest-python"),
      },
      output = {
        enable = true,
        open_on_run = true,
      },
      quickfix = {
        enable = false,
        open = false,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
  },
  event = "VeryLazy",
  keys = {
    { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>",                  desc = "attach to test" },
    { "<leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", desc = "debug test" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",   desc = "test file" },
    { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>",                     desc = "test nearest" },
    { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "open test output" },
    { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>",                    desc = "stop neotest" },
  },
}
