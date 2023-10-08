return {
  "glepnir/lspsaga.nvim", -- shows a popup for things like code actions
  config = function()
    local saga_status, saga = pcall(require, "lspsaga")
    if not saga_status then
      return
    end

    saga.setup({
      -- TODO: Move bindings to lazy keys
      -- keybinds for navigation in lspsaga window
      move_in_saga = { prev = "<C-k>", next = "<C-j>" },
      -- use enter to open file with finder
      finder_action_keys = {
        open = "<CR>",
      },
      -- use enter to open file with definition preview
      definition_action_keys = {
        edit = "<CR>",
      },
      lightbulb = {
        enable = false
      },
      symbol_in_winbar = {
        enable = false
      },
      ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      },
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
    { "catppuccin/nvim" },
  },
  event = "LspAttach",
  keys = {
    { "<leader>lsa", "<cmd>Lspsaga code_action<cr>",          desc = "execute code action" },
    { "<leader>lsd", "<cmd>Lspsaga peek_definition<cr>",      desc = "see definitions and make edits in window" },
    { "<leader>lsf", "<cmd>Lspsaga lsp_finder<cr>",           desc = "show definition & references" },
    { "<leader>lsj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "jump to next diagnostic message" },
    { "<leader>lsk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "jump to previous diagnostic message" },
    { "<leader>lsK", "<cmd>Lspsaga hover_doc<cr>",            desc = "open hover doc" },
    { "<leader>lsr", "<cmd>Lspsaga rename<cr>",               desc = "rename" },
    { "<leader>lss", "<cmd>Lspsaga signature_help<cr>",       desc = "signature help" },
  },
}
