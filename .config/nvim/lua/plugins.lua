vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- have packer manage itself

	-- appearance
	use({ "kyazdani42/nvim-web-devicons" }) -- Icons
	use({ "SmiteshP/nvim-navic" }) -- winbar for code navigation
	use({ "nvim-lualine/lualine.nvim" }) -- Status line
	use({ "NvChad/nvim-colorizer.lua" }) -- highlight hex/css colors
	use({ "rcarriga/nvim-notify" }) -- notification manager
	use({ "goolord/alpha-nvim" }) -- Dashboard

	-- speed up loading plugins
	use({ "lewis6991/impatient.nvim" })

	-- colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- tmux navigation" packer
	use({ "alexghergh/nvim-tmux-navigation" })

	-- file management
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- editing
	use({ "kylechui/nvim-surround" }) -- Surround text objects
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	use({ "rgroli/other.nvim" }) -- Open related files in another buffer

	-- commenting
	use({ "numToStr/Comment.nvim" }) -- Commenting
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- TSX support for commenting

	-- git management
	use({ "lewis6991/gitsigns.nvim" }) -- Git integration for buffers
	use({ "tpope/vim-fugitive" }) -- Git wrapper
	use({ "shumphrey/fugitive-gitlab.vim" }) -- support GitLab in fugitive

	-- syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- dap & lsp management
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim", -- automatic setup for lsp
		"neovim/nvim-lspconfig",
	})

	-- telescope
	use({ "ThePrimeagen/harpoon" }) -- mark files to navigate between
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- better sorting performance
	use({ "nvim-telescope/telescope.nvim" }) -- fuzzy finder

	-- completion
	use({
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-nvim-lsp", --lsp completions
		"hrsh7th/cmp-path", --path completions
		"hrsh7th/nvim-cmp",
		"onsails/lspkind.nvim",
		"glepnir/lspsaga.nvim", -- shows a popup for things like code actions
		"jose-elias-alvarez/typescript.nvim", -- for TypeScript LSP commands
	})

	-- linting an formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("jayp0521/mason-null-ls.nvim")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use({ "rafamadriz/friendly-snippets" }) -- snippets collection

	-- unit testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
	})

	-- dap ui
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
		},
	})
	-- dap: the joys of javascript
	use({
		"mxsdev/nvim-dap-vscode-js",
		requires = {
			"mfussenegger/nvim-dap",
		},
	})
	use("jay-babu/mason-nvim-dap.nvim") -- automatic setup for dap

	-- neorg
	use({
		"nvim-neorg/neorg",
		run = {
			":Neorg sync-parsers",
		},
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"nvim-neorg/neorg-telescope",
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
