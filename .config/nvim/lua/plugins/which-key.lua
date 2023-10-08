return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk_status_ok, wk = pcall(require, "which-key")
    if not wk_status_ok then
      return
    end

    vim.o.timeout = true
    vim.o.timeoutlen = 300

    -- TODO remap popup scrolling for consistency
    wk.setup({})

    wk.register({
      name = "global mappings",
      ["<CR>"] = {
        ":noh<CR><CR>",
        "clear search highlighting",
      },
    })

    wk.register({
      a = {
        name = "aerial",
        "<cmd>AerialToggle!<CR>",
        "toggle aerial",
      },
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
        b = {
          ":lua require('dap').toggle_breakpoint()<cr>",
          "toggle breakpoint",
        },
        c = {
          ":lua require('dap').continue()<cr>",
          "continue",
        },
        i = {
          ":lua require('dap').step_into()<cr>",
          "step into",
        },
        l = {
          ":lua require('dap').run_last()<cr>",
          "run last",
        },
        m = {
          name = "debug nearest method",
          g = {
            ":lua require('dap-go').debug_test()<cr>",
            "go: test nearest method",
          },
          p = {
            ":lua require('dap-python').test_method()<cr>",
            "python: test nearest method",
          },
        },
        o = {
          ":lua require('dap').step_over()<cr>",
          "step over",
        },
        O = {
          ":lua require('dap').step_out()<cr>",
          "step out",
        },
        r = {
          ":lua require('dap').repl.toggle()<cr>",
          "toggle repl",
        },
        t = {
          ":lua require('dap').terminate()<cr>",
          "terminate dap",
        },
        u = {
          ":lua require('dapui').toggle()<cr>",
          "toggle dapui",
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
        name = "git integration",
        b = {
          ":GBrowse<CR>",
          "git browse",
        },
        c = {
          ":G commit<CR>",
          "git commit",
        },
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
          v = {
            ":Gvdiffsplit!<CR>",
            "git diff split",
          },
        },
        m = {
          ":G mergetool<CR>",
          "open git mergetool",
        },
        l = {
          ":G log<CR>",
          "open git log",
        },
        p = {
          ":G push<CR>",
          "git push",
        },
        r = {
          ":Gread<CR>",
          "git read",
        },
        s = {
          ":G<CR>",
          "git status (open fugitive.vim)",
        },
        w = {
          ":Gwrite<CR>",
          "git write",
        },
      },
      h = {
        name = "harpoon",
        h = {
          ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
          "toggle harpoon menu",
        },
        m = {
          ":lua require('harpoon.mark').add_file()<CR>",
          "harpoon add file",
        },
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
        name = "neotest",
        a = {
          ":lua require('neotest').run.attach()<CR>",
          "attach to test",
        },
        d = {
          ":lua require('neotest').run.run({ strategy = 'dap' })<CR>",
          "debug test",
        },
        f = {
          ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
          "test file",
        },
        n = {
          ":lua require('neotest').run.run()<CR>",
          "test nearest",
        },
        o = {
          ":lua require('neotest').output.open({ enter = true })<CR>",
          "open test output",
        },
        s = {
          ":lua require('neotest').run.stop()<CR>",
          "stop neotest",
        },
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
