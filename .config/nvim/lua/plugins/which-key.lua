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
        m = {
          ":NvimTreeToggle<CR>",
          "toggle file browser"
        },
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
      },
      m = {
        name = "mark",
      },
      l = {
        name = "lsp",
        D = {
          "<cmd>lua vim.lsp.buf.declaration()<CR>",
          "go to declaration",
        },
        F = {
          "<cmd>lua vim.lsp.buf.format()<CR>",
          "format buffer",
        },
        i = {
          "<cmd>lua vim.lsp.buf.implementation()<CR>",
          "go to implementation",
        },
        l = {
          "<cmd>lua vim.diagnostic.open_float()<CR>",
          "open floating diagnostic menu",
        },
        q = {
          "<cmd>LspRestart<CR>",
          "restart lsp",
        },
        r = {
          "<cmd>lua vim.lsp.buf.references()<CR>",
          "show references",
        },
        s = {
          name = "lsp saga"
        },
        t = {
          "<cmd>LSoutlineToggle<CR>",
          "toggle language server outline",
        },
        T = {
          "<cmd>lua vim.lsp.buf.type_definition()<CR>",
          "go to type definition",
        },
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
    }, {
      prefix = "<leader>",
      noremap = true,
      silent = true,
    })
  end,
}
