return {
  {
    "haydenmeade/neotest-jest",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          cwd = function(path)
            -- return vim.fn.getcwd()
            local cwd = require("neotest-jest.util").find_package_json_ancestor(path)
            return cwd
          end,
        })
      )
    end,
  },
}
