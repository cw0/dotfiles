--[[
  MAPPINGS
--]]

vim.g.mapleader = " "

local map = vim.keymap.set

-- ALL OF THESE ARE NO REMAP

-- buffer mappings
map("n", "<Leader>l", ":bnext<CR>", { desc = "switch to next buffer" })
map("n", "<Leader>]", ":bnext<CR>", { desc = "switch to next buffer" })
map("n", "¬", ":bnext<CR>", { desc = "switch to next buffer (osx only)" })
map("i", "¬", ":bnext<CR>", { desc = "switch to next buffer (osx only)" })
map("v", "¬", ":bnext<CR>", { desc = "switch to next buffer (osx only)" })

map("n", "<Leader>h", ":bprevious<CR>", { desc = "switch to previous buffer" })
map("n", "<Leader>[", ":bprevious<CR>", { desc = "switch to previous buffer" })
map("n", "˙", ":bprevious<CR>", { desc = "switch to previous buffer (osx only)" })
map("i", "˙", ":bprevious<CR>", { desc = "switch to previous buffer (osx only)" })
map("v", "˙", ":bprevious<CR>", { desc = "switch to previous buffer (osx only)" })

map("n", "<Leader>bq", ":bp <BAR> bd #<CR>", { desc = "close the current buffer and move to the previous one" })

map("n", "<Leader>bl", ":ls<CR>", { desc = "show all buffers and their status" })

-- search mappings
map("n", "<CR>", ":noh<CR><CR>", { desc = "clear search highlighting" })

-- diff mappings
map("n", "gdh", ":diffget //2<CR>", { desc = "choose left side change" })
map("n", "gdl", ":diffget //3<CR>", { desc = "choose right side change" })

-- misc mappings
map("n", "<Leader>rl", ":r!<C-r><C-l><CR>", { desc = "run command on line and paste output in buffer" })
