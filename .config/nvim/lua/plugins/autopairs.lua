-- TODO: probably should add treesitter to requirements
return {
  "windwp/nvim-autopairs",
  config = function()
    local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
    if not autopairs_setup then
      return
    end

    autopairs.setup({
      check_ts = true,                      -- enable treesitter
      ts_config = {
        lua = { "string" },                 -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
      },
    })
  end,
}
