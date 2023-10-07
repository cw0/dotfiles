--[[
  AUTOCOMMANDS
--]]
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })
vim.api.nvim_create_autocmd({ "BufEnter" },
  { pattern = { "*" }, command = ":lua require('lazygit.utils').project_root_dir()", })
