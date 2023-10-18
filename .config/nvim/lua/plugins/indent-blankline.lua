return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    exclude = {
      filetypes = { "dashboard" }
    },
    scope = {
      enabled = false,
      show_start = false,
      show_end = false,
      highlight = { "Function", "Label" },
    },
  }
}
