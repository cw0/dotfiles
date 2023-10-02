local plugins = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("config.which-key").setup()
    end,
  },
  -- appearance
  {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("config.navic").setup()
    end,
  }, -- winbar for code navigation
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.lualine").setup()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("config.colorizer").setup()
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("config.nvim-notify").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("config.alpha").setup()
    end,
  }, -- Dashboard
  -- colorschemes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("config.colorscheme").setup()
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("config.tmux").setup()
    end,
  }, -- tmux navigation" packer
  -- file management
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("config.nvim-tree").setup()
    end,
  },
  -- editing
  {
    "kylechui/nvim-surround",
    config = function()
      require("config.surround").setup()
    end,
  }, -- Surround text objects
  {
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs").setup()
    end,
  }, -- Autopairs, integrates with both cmp and treesitter
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter" },
  }, -- autoclose tags
  -- commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("config.comment").setup()
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  -- git management
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.gitsigns").setup()
    end,
  }, -- Git integration for buffers
  {
    "tpope/vim-fugitive",
  },
  {
    "shumphrey/fugitive-gitlab.vim",
    dependencies = {
      "tpope/vim-fugitive",
    }
  },
  {
    -- syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
      require("config.treesitter").setup()
    end,
  },
  -- linting
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("config.nvim-lint").setup()
    end,
  },
  -- Chat GPT
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("config.chatgpt").setup()
    end,
  },
  -- telescope
  {
    "ThePrimeagen/harpoon"
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.telescope").setup()
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("config.typescript-tools").setup()
    end,
  },
  {
    "glepnir/lspsaga.nvim", -- shows a popup for things like code actions
    event = "LspAttach",
    config = function()
      require("config.lspsaga").setup()
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- dap & lsp management
  {
    "williamboman/mason.nvim",
    config = function()
      require("config.mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("config.mason-tool-installer").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", --lsp completions
    },
    -- PROBABLY GONNA BREAK CUZ IT NEEDS TO LOAD AFTER NVIM CMP
    config = function()
      require("config.lsp").setup()
    end,
  },
  -- unit testing
  {
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
      require("config.neotest").setup()
    end,
  },
  -- dap ui
  {

    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("config.dap").setup()
    end,
  },
  --	neorg
  {
    "nvim-neorg/neorg",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "nvim-neorg/neorg-telescope",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("config.neorg").setup()
    end,
    -- MIGHT BREAK BECAUSE NVIM CMP
  },
  -- completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",   --buffer completions
      "hrsh7th/cmp-nvim-lsp", --lsp completions
      "hrsh7th/cmp-path",     --path completions
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "friendly-snippets" },
        config = function()
          require("config.luasnip").setup()
        end,
      },
      "rafamadriz/friendly-snippets", -- snippets collection
    },
    config = function()
      require("config.nvim-cmp").setup()
    end,
  }
}

return plugins
