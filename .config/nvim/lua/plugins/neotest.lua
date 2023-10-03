return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local neotest_status_ok, neotest = pcall(require, "neotest")
    if not neotest_status_ok then
      print("neotest failed to load")
      return
    end
    vim.diagnostic.config({
      -- virtual_text = {
      -- 	format = function(diagnostic)
      -- 		local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      -- 		return message
      -- 	end,
      -- },
      virtual_text = false,
      float = {
        border = "rounded",
      },
    })

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
}
