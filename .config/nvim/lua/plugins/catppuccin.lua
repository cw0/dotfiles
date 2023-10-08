return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
    if not catppuccin_status_ok then
      return
    end

    local colors = require("catppuccin.palettes").get_palette()
    colors.none = "NONE"

    vim.g.catppuccin_flavour = "mocha"
    -- vim.g.catppuccin_flavour = "macchiato"

    catppuccin.setup({
      -- TODO: investigate integration with todo comments
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dap = {
          enabled = true,
          enable_ui = true,
        },
        flash = true,
        gitsigns = true,
        harpoon = true,
        indent_blankline = {
          enabled = true,
          scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        lsp_trouble = true,
        mason = true,
        markdown = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
        neotest = true,
        noice = true,
        notify = true,
        octo = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    })

    local colorscheme = "catppuccin"

    local colorscheme_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not colorscheme_status_ok then
      vim.notify("colorscheme " .. colorscheme .. " not found!")
      return
    end
  end,
}
