return {
  "SmiteshP/nvim-navic",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig"
  },
  config = function()
    local status_ok, navic = pcall(require, "nvim-navic")
    if not status_ok then
      return
    end

    navic.setup({
      highlight = true,
    })
  end,
}
