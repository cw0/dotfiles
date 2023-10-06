-- TODO: figure out how to fix the black background

local lol = {
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",
  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
}

return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    "catppuccin/nvim",
  },
  config = function()
    local status_ok, bufferline = pcall(require, "bufferline")
    if not status_ok then
      print("bufferline failed to load")
      return
    end

    local mocha = require("catppuccin.palettes").get_palette "mocha"

    bufferline.setup({
      -- TODO: make this actually look pleasant
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        -- styles = { "bold" },
        -- custom = {
        --   mocha = {
        --     fill = {
        --       bg = mocha.base
        --     },
        --     background = {
        --       fg = mocha.text,
        --       bg = mocha.base
        --     },
        --   },
        -- }
      }),
      -- options = {
      --   separator_style = "slant"
      -- }
    })
  end,
  version = "*",
}
