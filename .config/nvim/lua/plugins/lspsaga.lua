return {
  "glepnir/lspsaga.nvim", -- shows a popup for things like code actions
  event = "LspAttach",
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
      }
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
  },
}
