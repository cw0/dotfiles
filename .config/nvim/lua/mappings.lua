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

-- plugin mappings
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<Leader>gb", "<cmd>GBrowse<CR>", opts)
keymap("n", "<Leader>gc", "<cmd>G commit<CR>", opts)
keymap("n", "<Leader>gd", "<cmd>Gdiffsplit<CR>", opts)
keymap("n", "<Leader>gp", "<cmd>G push<CR>", opts)
keymap("n", "<Leader>gr", "<cmd>Gread<CR>", opts)
keymap("n", "<Leader>gs", "<cmd>G<CR>", opts)
keymap("n", "<Leader>gw", "<cmd>Gwrite<CR>", opts)

-- Telescope
-- Find file
keymap("n", "<Leader>ff", "<cmd>lua require('user.plugins.configs.telescope').project_files()<CR>", opts)
-- Find text
keymap("n", "<Leader>ft", "<cmd>Telescope live_grep<CR>", opts)
-- Find word
keymap("n", "<Leader>fw", "<cmd>Telescope grep_string<CR>", opts)
-- Find buffer
keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", opts)
-- Go to definition
keymap("n", "<Leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions({ jump_type='vsplit' })<CR>", opts)
keymap("n", "<Leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<c-]>", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
keymap("n", "<c-w><c-]>", "<cmd>lua require('telescope.builtin').lsp_definitions({ jump_type='vsplit' })<CR>", opts)
keymap("n", "gs", "<cmd>lua require('telescope.builtin').lsp_definitions({ jump_type='split' })<CR>", opts)
-- Harpoon marks
keymap("n", "<Leader>fh", "<cmd>Telescope harpoon marks<CR>", opts)

-- Harpoon
keymap("n", "<Leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<Leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Related buffer navigation
keymap("n", "<Leader>kk", "<cmd>Other<CR>", opts)
keymap("n", "<Leader>kv", "<cmd>OtherVSplit<CR>", opts)
keymap("n", "<Leader>kc", "<cmd>OtherClear<CR>", opts)
keymap("n", "<Leader>kt", "<cmd>OtherVSplit test<CR>", opts)
keymap("n", "<Leader>ks", "<cmd>OtherVSplit story<CR>", opts)
keymap("n", "<Leader>ki", "<cmd>OtherVSplit implementation<CR>", opts)
