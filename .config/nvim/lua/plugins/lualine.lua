return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
      return
    end

    lualine.setup({
      options = {
        theme = "catppuccin",
        component_separators = "│",
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "█", right = "█" },
        -- section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "alpha",
        },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" } },
          -- { "mode", separator = { left = "█" }, right_padding = 2 },
        },
        lualine_c = {
          { "filename" },
        },
      },
      inactive_winbar = {},
      tabline = {},
      winbar = {}
      -- winbar = {
      --   lualine_a = {
      --     { "filename" },
      --   },
      -- },
      -- inactive_winbar = {
      --   lualine_a = {
      --     { "filename" },
      --   },
      -- },
    })
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim",
  },
  event = "VeryLazy",
}
