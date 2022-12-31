vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local map = vim.keymap.set

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- tmux navigation" packer
  use { "alexghergh/nvim-tmux-navigation" }

  -- file management
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  -- git management
  use 'tpope/vim-fugitive'

  -- syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- dap & lsp management
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim', -- automatic setup for lsp
    'neovim/nvim-lspconfig',
  }

  -- completion
  use {
    'hrsh7th/cmp-buffer', -- buffer completions
    'hrsh7th/cmp-nvim-lsp', --lsp completions
    'hrsh7th/cmp-path', --path completions
    'hrsh7th/nvim-cmp',
    'onsails/lspkind.nvim',
  }

  -- language server
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- unit testing
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'haydenmeade/neotest-jest'
    },
  }

  -- dap ui
  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap'
    }
  }
  -- dap: the joys of javascript
  use {
    "mxsdev/nvim-dap-vscode-js",
    requires = {
      "mfussenegger/nvim-dap"
    }
  }
  use 'jay-babu/mason-nvim-dap.nvim' -- automatic setup for dap

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
