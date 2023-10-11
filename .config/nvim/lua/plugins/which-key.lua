return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk_status_ok, wk = pcall(require, "which-key")
    if not wk_status_ok then
      return
    end

    -- TODO: remap popup scrolling for consistency
    wk.setup({})

    wk.register({
      name = "global mappings",
      ["<CR>"] = {
        ":noh<CR><CR>",
        "clear search highlighting",
      },
    })

    wk.register({
      b = {
        name = "buffer",
        l = {
          ":ls<CR>",
          "show all buffers and their status",
        },
        q = {
          ":bp <BAR> bd #<CR>",
          "close current buffer and move to previous",
        },
      },
      d = {
        name = "dap",
        m = {
          name = "debug nearest method",
        },
      },
      f = {
        name = "find / file manager",
      },
      g = {
        name = "git",
        d = {
          name = "diff",
          h = {
            ":diffget //2<CR>",
            "choose left side change",
          },
          l = {
            ":diffget //3<CR>",
            "choose right side change",
          },
        },
        h = {
          name = "octo",
          i = {
            name = "issue"
          },
          p = {
            name = "pr"
        }
      },
      m = {
        name = "mark",
      },
      l = {
        name = "lsp",
      },
      r = {
        name = "run",
        l = {
          ":r!<C-r><C-l><CR>",
          "run command on line and paste output in buffer",
        },
      },
      t = {
        name = "test",
      },
      ["["] = {
        ":bprevious<CR>",
        "switch to previous buffer",
      },
      ["]"] = {
        ":bnext<CR>",
        "switch to next buffer",
      },
    },
    {
      prefix = "<leader>",
      noremap = true,
      silent = true,
    }
  })
  end,
}
