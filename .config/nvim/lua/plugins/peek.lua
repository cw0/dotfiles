-- NOTE: This Plugin Requires Deno
return {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  keys = {
    {
      "<leader>vm",
      function()
        local peek = require("peek")
        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end,
      desc = "Markdown",
    },
  },
  opts = {
    -- theme = "light"
  },
}
