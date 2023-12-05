return {
  "numToStr/Comment.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local status_ok, comment = pcall(require, "Comment")
    if not status_ok then
      return
    end

    local ft = require('Comment.ft')
    ft.hcl = { '#%s', '/*%s*/' }

    comment.setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
  lazy = false,
}
