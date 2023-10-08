return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({ delay = 200 })
  end,
  event = "BufReadPost",
  keys = {
    { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
    { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
  },
}
