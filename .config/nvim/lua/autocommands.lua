--[[
  AUTOCOMMANDS
--]]
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })
