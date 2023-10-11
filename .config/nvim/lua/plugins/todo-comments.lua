return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTelescope" },
  config = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPost",
  keys = {
    { "]t",        function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t",        function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>x", "<cmd>TodoTelescope<cr>",                            desc = "Todo Telescope" },
  },
  opts = {
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--hidden",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
  }
}
