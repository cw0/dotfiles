local set = vim.opt

-- enable fast plugin loading
vim.loader.enable()

--[[
  BASIC CONFIGURATION
--]]
-- map leader to space
vim.g.mapleader = " "

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.termguicolors = true
-- set.syntax = 'on' -- this is disabled for treesitter
-- set.syn = "auto"

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.number = true
set.numberwidth = 4
set.ruler = true
set.signcolumn = "yes"

set.fillchars:append("vert:│")

set.wildmenu = true
set.ttyfast = true
set.lazyredraw = false -- NOTE: set to false for noice.nvim
set.updatetime = 300

set.mouse = "a"

set.autoindent = true
set.cindent = true
set.smartindent = true
set.preserveindent = true
set.copyindent = true

set.swapfile = false

set.compatible = false

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false
set.foldlevel = 99

set.ignorecase = true
set.smartcase = true
set.hlsearch = true
set.incsearch = true

set.clipboard = "unnamedplus"

set.backspace = { "indent", "eol", "start" }

set.display:append("lastline")

set.errorbells     = false
set.visualbell     = false
set.tm             = 500

set.history        = 1000

-- refresh buffer on external file write
set.autoread       = true

-- show matching parenthesis
set.showmatch      = true

-- highlight current line numbers
set.cursorline     = true

-- set hidden characters
set.list.listchars = { tab = "> ", trail = "-", eol = "$" }
set.list           = true

-- add a colored column
-- set.colorcolumn = "120"

-- disable backup files
set.backup         = false
set.writebackup    = false

set.updatetime     = 300
