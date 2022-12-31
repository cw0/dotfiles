local map = vim.keymap.set

map('n', '<Leader>tn', function() require('neotest').run.run() end, { desc = 'test nearest' })
map('n', '<Leader>tf', function() require('neotest').run.run(vim.fn.expand("%")) end, { desc = 'test file' })
map('n', '<Leader>to', function() require('neotest').output.open({ enter = true }) end, { desc = 'open test results' })
map('n', '<Leader>td', function() require('neotest').run.run({ strategy = 'dap' }) end, { desc = 'debug test' })
map('n', '<Leader>ts', function() require('neotest').run.stop() end, { desc = 'stop test' })
map('n', '<Leader>ta', function() require('neotest').run.attach() end, { desc = 'attach to test' })

require('neotest').setup({
  adapters = {
    require("neotest-jest"),
  },
  output = {
    enable = true,
    open_on_run = true,
  },
})
