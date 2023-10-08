return {
  "nvim-neorg/neorg",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "nvim-neorg/neorg-telescope",
    "hrsh7th/nvim-cmp",
  },
  event = "VeryLazy",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.dirman"] = {
        config = {
          work = "~/notes/work",
          home = "~/notes/home",
        },
        index = "index.norg",
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.concealer"] = {
        config = {},
      },
      ["core.integrations.telescope"] = {},
    },
  }
}
