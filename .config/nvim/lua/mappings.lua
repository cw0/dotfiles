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
-- keymap("n", "<leader>gg", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
-- keymap("n", "<Leader>gb", ":GBrowse<CR>", opts)
-- keymap("n", "<Leader>gc", ":G commit<CR>", opts)
-- keymap("n", "<Leader>gd", ":Gdiffsplit<CR>", opts)
-- keymap("n", "<Leader>gp", ":G push<CR>", opts)
-- keymap("n", "<Leader>gr", ":Gread<CR>", opts)
-- keymap("n", "<Leader>gs", ":G<CR>", opts)
-- keymap("n", "<Leader>gw", ":Gwrite<CR>", opts)

-- highlighting
keymap("n", "<leader>hg", ":TSHighlightCapturesUnderCursor <Return>")

-- Telescope
-- Find file
-- keymap("n", "<Leader>ff", ":lua require('config.telescope').project_files()<CR>", opts)
-- -- Find text
-- keymap("n", "<Leader>ft", ":Telescope live_grep<CR>", opts)
-- -- Find word
-- keymap("n", "<Leader>fw", ":Telescope grep_string<CR>", opts)
-- -- Find buffer
-- keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
-- -- Go to definition
-- keymap("n", "<Leader>fd", ":lua require('telescope.builtin').lsp_definitions({ jump_type='vsplit' })<CR>", opts)
-- keymap("n", "<Leader>fs", ":Telescope lsp_document_symbols<CR>", opts)
-- -- keymap("n", "<c-]>", ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)
-- -- keymap("n", "<c-w><c-]>", ":lua require('telescope.builtin').lsp_definitions({ jump_type='vsplit' })<CR>", opts)
-- keymap("n", "gs", ":lua require('telescope.builtin').lsp_definitions({ jump_type='split' })<CR>", opts)
-- -- Harpoon marks
-- keymap("n", "<Leader>fh", ":Telescope harpoon marks<CR>", opts)

-- Harpoon
keymap("n", "<Leader>hm", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<Leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Related buffer navigation
keymap("n", "<Leader>kk", ":Other<CR>", opts)
keymap("n", "<Leader>kv", ":OtherVSplit<CR>", opts)
keymap("n", "<Leader>kc", ":OtherClear<CR>", opts)
keymap("n", "<Leader>kt", ":OtherVSplit test<CR>", opts)
keymap("n", "<Leader>ks", ":OtherVSplit story<CR>", opts)
keymap("n", "<Leader>ki", ":OtherVSplit implementation<CR>", opts)
