return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk_status_ok, wk = pcall(require, "which-key")
    if not wk_status_ok then
      return
    end

    -- TODO: remap popup scrolling for consistency
    wk.setup({
      window = {
        border = "rounded"
      }
    })

    wk.register({
      name = "global mappings",
      ["<CR>"] = {
        ":noh<CR><CR>",
        "clear search highlighting",
      },
    })

    wk.register(
      {
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
        c = {
          name = "chat gpt"
        },
        d = {
          name = "dap",
          m = {
            name = "debug method",
          },
          f = {
            name = "find"
          }
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
        },
        h = {
          name = "help"
        },
        l = {
          name = "lsp",
          p = {
            name = "swap next parameter"
          },
          P = {
            name = "swap prev parameter"
          }
        },
        m = {
          name = "mark",
        },
        r = {
          name = "run",
          l = {
            ":r!<C-r><C-l><CR>",
            "run command on line and paste output in buffer",
          },
        },
        s = {
          name = "search"
        },
        t = {
          name = "test",
        },
        v = {
          name = "view",
          d = {
            name = "docker"
          },
          t = {
            name = "terraform docs"
          }
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
    )
  end,
}
