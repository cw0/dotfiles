return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup({
      context_commentstring = {
        enable = true,
        enable_autocmd = false
      },
      ensure_installed = {
        "bash",
        "css",
        "gitcommit",
        "gitignore",
        "go",
        "hcl",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "norg",
        "regex",
        "python",
        "sql",
        "terraform",
        "tsx",
        "typescript",
        "yaml",
        "vim",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      autopairs = {
        enable = true,
      },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        disable = {},  -- optional, list of language that will be disabled
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
              ["<leader>lpd"] = "@function.outer",
              ["<leader>lpD"] = "@class.outer",
            },
          },
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          -- TODO: mappings
          -- move = {
          --   enable = true,
          --   set_jumps = true, -- whether to set jumps in the jumplist
          --   goto_next_start = {
          --     ["]m"] = "@function.outer",
          --     ["]]"] = { query = "@class.outer", desc = "Next class start" },
          --     --
          --     -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
          --     ["]o"] = "@loop.*",
          --     -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          --     --
          --     -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          --     -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          --     ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          --     ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          --   },
          --   goto_next_end = {
          --     ["]M"] = "@function.outer",
          --     ["]["] = "@class.outer",
          --   },
          --   goto_previous_start = {
          --     ["[m"] = "@function.outer",
          --     ["[["] = "@class.outer",
          --   },
          --   goto_previous_end = {
          --     ["[M"] = "@function.outer",
          --     ["[]"] = "@class.outer",
          --   },
          --   -- Below will go to either the start or the end, whichever is closer.
          --   -- Use if you want more granular movements
          --   -- Make it even more gradual by adding multiple queries and regex.
          --   goto_next = {
          --     ["]d"] = "@conditional.outer",
          --   },
          --   goto_previous = {
          --     ["[d"] = "@conditional.outer",
          --   }
          -- },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- TODO: mappings
          -- swap = {
          --   enable = true,
          --   swap_next = {
          --     ["<leader>a"] = "@parameter.inner",
          --   },
          --   swap_previous = {
          --     ["<leader>A"] = "@parameter.inner",
          --   },
          -- },
          include_surrounding_whitespace = true,
        },
      },
    })

    require('ts_context_commentstring').setup({})
  end,
  dependencies = {
    {
      'andymass/vim-matchup',
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
}
