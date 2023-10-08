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
        name = "lsp and lsp saga",
        a = {
          "<cmd>Lspsaga code_action<CR>",
          "execute code action",
        },
        d = {
          "<cmd>Lspsaga peek_definition<CR>",
          "see definitions and make edits in window",
        },
        D = {
          "<cmd>lua vim.lsp.buf.declaration()<CR>",
          "go to declaration",
        },
        f = {
          "<cmd>Lspsaga lsp_finder<CR>",
          "show definition & references",
        },
        F = {
          "<cmd>lua vim.lsp.buf.format()<CR>",
          "format buffer",
        },
        i = {
          "<cmd>lua vim.lsp.buf.implementation()<CR>",
          "go to implementation",
        },
        j = {
          "<cmd>Lspsaga diagnostic_jump_next<CR>",
          "jump to next diagnostic message",
        },
        k = {
          "<cmd>Lspsaga diagnostic_jump_prev<CR>",
          "jump to previous diagnostic message",
        },
        l = {
          "<cmd>lua vim.diagnostic.open_float()<CR>",
          "open floating diagnostic menu",
        },
        K = {
          "<cmd>Lspsaga hover_doc<CR>",
          "open hover doc",
        },
        q = {
          "<cmd>LspRestart<CR>",
          "restart lsp",
        },
        r = {
          "<cmd>lua vim.lsp.buf.references()<CR>",
          "show references",
        },
        R = {
          "<cmd>Lspsaga rename<CR>",
          "rename",
        },
        s = {
          "<cmd>Lspsaga signature_help<CR>",
          "signature help",
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
