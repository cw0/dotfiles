local map = vim.keymap.set

map('n', '<Leader>gs', ':G<CR>', {desc = 'fugitive: open git status'})
map('n', '<Leader>gb', ':G blame<CR>', {desc = 'fugitive: open git blame'})
map('n', '<Leader>gd', ':Gvdiff<CR>', {desc = 'fugitive: open Gvdiff'})
map('n', '<Leader>gm', ':G mergetool<CR>', {desc = 'fugitive: open git mergetool'})
map('n', '<Leader>gl', ':G log<CR>', {desc = 'fugitive: open git log'})

