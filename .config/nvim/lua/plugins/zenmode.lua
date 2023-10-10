return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  dependencies = {
    "folke/twilight.nvim"
  },
  opts = {
    plugins = {
      gitsigns = true,
      tmux = true,
      twilight = { enabled = true },
      kitty = { enabled = false, font = "+2" },
    },
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" }
  },
}
