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

-- search mappings
map("n", "<CR>", ":noh<CR><CR>", { desc = "clear search highlighting" })

-- diff mappings
map("n", "gdh", ":diffget //2<CR>", { desc = "choose left side change" })
map("n", "gdl", ":diffget //3<CR>", { desc = "choose right side change" })
