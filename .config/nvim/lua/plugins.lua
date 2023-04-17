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
	use({
		"SmiteshP/nvim-navic",
		config = function()
			require("config.navic").setup()
		end,
	}) -- winbar for code navigation
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine").setup()
		end,
	}) -- Status line
	use({
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("config.colorizer").setup()
		end,
	}) -- highlight hex/css colors
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("config.nvim-notify").setup()
		end,
	}) -- notification manager
	use({
		"goolord/alpha-nvim",
		config = function()
			require("config.alpha").setup()
		end,
	}) -- Dashboard

	-- speed up loading plugins
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("config.impatient").setup()
		end,
	})

	-- colorschemes
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("config.colorscheme").setup()
		end,
	})

	-- tmux navigation" packer
	use({
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("config.tmux").setup()
		end,
	})

	-- file management
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("config.nvim-tree").setup()
		end,
	})

	-- editing
	use({
		"kylechui/nvim-surround",
		config = function()
			require("config.surround").setup()
		end,
	}) -- Surround text objects
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs").setup()
		end,
	}) -- Autopairs, integrates with both cmp and treesitter
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	}) -- autoclose tags
	use({
		"rgroli/other.nvim",
		config = function()
			require("config.other").setup()
		end,
	}) -- Open related files in another buffer

	-- commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("config.comment").setup()
		end,
	}) -- Commenting
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- TSX support for commenting

	-- git management
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns").setup()
		end,
	}) -- Git integration for buffers
	use({
		"tpope/vim-fugitive",
		config = function()
			require("config.fugitive").setup()
		end,
	}) -- Git wrapper
	use({ "shumphrey/fugitive-gitlab.vim" }) -- support GitLab in fugitive

	-- syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("config.treesitter").setup()
		end,
	})

	-- telescope
	use({ "ThePrimeagen/harpoon" }) -- mark files to navigate between
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- better sorting performance
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.telescope").setup()
		end,
	}) -- fuzzy finder

	use({
		"jose-elias-alvarez/typescript.nvim",
	}) -- for TypeScript LSP commands

	use({
		"glepnir/lspsaga.nvim", -- shows a popup for things like code actions
		opt = true,
		branch = "main",
		event = "LspAttach",
		config = function()
			require("config.lspsaga").setup()
		end,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- dap & lsp management
	use({
		"williamboman/mason.nvim",
		config = function()
			require("config.mason").setup()
		end,
	})

	-- this is the most likely next broken thing
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp").setup()
		end,
	})

	-- linting an formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config.null-ls").setup()
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim", -- automatic setup for lsp
		requires = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("config.mason-lspconfig").setup()
		end,
	})

	use({
		"jayp0521/mason-null-ls.nvim",
		requires = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("config.mason-null-ls").setup()
		end,
	})

	use({
		"jay-babu/mason-nvim-dap.nvim",
		requires = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("config.mason-nvim-dap").setup()
		end,
	}) -- automatic setup for dap

	-- unit testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("config.neotest").setup()
		end,
	})

	-- dap: the joys of javascript
	use({
		"mxsdev/nvim-dap-vscode-js",
		requires = {
			"mfussenegger/nvim-dap",
		},
	})

	-- dap ui
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("config.dap").setup()
		end,
	})

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
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("config.neorg").setup()
		end,
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		-- opt = true,
		wants = { "LuaSnip", "lspkind.nvim" },
		requires = {
			"hrsh7th/cmp-buffer", --buffer completions
			"hrsh7th/cmp-nvim-lsp", --lsp completions
			"hrsh7th/cmp-path", --path completions
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				wants = "friendly-snippets",
				config = function()
					require("config.luasnip").setup()
				end,
			},
			"rafamadriz/friendly-snippets", -- snippets collection
		},
		config = function()
			require("config.nvim-cmp").setup()
		end,
		disable = false,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
