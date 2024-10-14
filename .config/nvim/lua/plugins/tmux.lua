return {
  "aserowy/tmux.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<C-h>", ":lua require('tmux').move_left()<cr>", desc = "move to left pane" },
    { "<C-j>", ":lua require('tmux').move_bottom()<cr>", desc = "move to bottom pane" },
    { "<C-k>", ":lua require('tmux').move_top()<cr>", desc = "move to top pane" },
    { "<C-l>", ":lua require('tmux').move_right()<cr>", desc = "move to right pane" },
  },
}
