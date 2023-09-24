local M = {}

M.setup = function()
	local lspconfig_status, lspconfig = pcall(require, "lspconfig")
	if not lspconfig_status then
		print("lspconfig died")
		return
	end

	local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not cmp_nvim_lsp_status then
		print("cmp_nvim_lsp died")
		return
	end

	-- local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
	local capabilities = cmp_nvim_lsp.default_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local keymap = vim.keymap

	-- enable keybinds only for when lsp server available
	local on_attach = function(client, bufnr)
		-- keybind options
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- set keybinds
		-- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
		-- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
		-- keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		-- keymap.set("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		-- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		-- keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		-- keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		-- keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		-- keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
		-- keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
		-- keymap.set("n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		-- keymap.set("n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		-- keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts)
		-- keymap.set("n", "<leader>lq", "<cmd>LspRestart<CR>", opts)
		-- keymap.set("n", "<leader>ls", "<cmd>Lspsaga signature_help<CR>", opts)
		-- keymap.set("n", "<leader>lt", "<cmd>LSoutlineToggle<CR>", opts)

		-- typescript specific keymaps (e.g. rename file and update imports)
		if client.name == "tsserver" then
			keymap.set("n", "<leader>lo", "<cmd>TypescriptOrganizeImports<CR>", opts)
			keymap.set("n", "<leader>li", "<cmd>TypescriptAddMissingImports<CR>", opts)
			keymap.set("n", "<leader>lrf", "<cmd>TypescriptRenameFile<CR>", opts)
			keymap.set("n", "<leader>lu", "<cmd>TypescriptRemoveUnused<CR>", opts)
		end
	end

	lspconfig.cssls.setup({
		capabilities = capabilities,
	})

	lspconfig.docker_compose_language_service.setup({})

	lspconfig.dockerls.setup({})

	lspconfig.golangci_lint_ls.setup({})

	lspconfig.html.setup({
		capabilities = capabilities,
	})

	lspconfig.jsonls.setup({})

	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
			},
		},
	})

	-- lspconfig.lua_ls.setup({
	-- 	on_init = function(client)
	-- 		local path = client.workspace_folders[1].name
	-- 		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
	-- 			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
	-- 				Lua = {
	-- 					runtime = {
	-- 						-- Tell the language server which version of Lua you're using
	-- 						-- (most likely LuaJIT in the case of Neovim)
	-- 						version = "LuaJIT",
	-- 					},
	-- 					-- Make the server aware of Neovim runtime files
	-- 					workspace = {
	-- 						checkThirdParty = false,
	-- 						library = {
	-- 							vim.env.VIMRUNTIME,
	-- 							-- "${3rd}/luv/library"
	-- 							-- "${3rd}/busted/library",
	-- 						},
	-- 						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
	-- 						-- library = vim.api.nvim_get_runtime_file("", true)
	-- 					},
	-- 				},
	-- 			})
	--
	-- 			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
	-- 		end
	-- 		return true
	-- 	end,
	-- })

	lspconfig.marksman.setup({})

	--configure pyright
	lspconfig.pyright.setup({})

	-- configure terraformls
	lspconfig.terraformls.setup({})

	-- configure tflint
	lspconfig.tflint.setup({})

	lspconfig.yamlls.setup({})

	vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
	vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
	vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
	vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
	vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

	vim.cmd([[let g:terraform_fmt_on_save=1]])
	vim.cmd([[let g:terraform_align=1]])

	-- Show line diagnostics automatically in hover window
	vim.o.updatetime = 250
	vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

	-- removed for now

	-- lspconfig.tsserver.setup({
	-- 	on_attach = on_attach,
	-- 	cmd = { "typescript-language-server", "--stdio" },
	-- 	capabilities = capabilities,
	-- 	filetypes = {
	-- 		"javascript",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 		"typescript.tsx",
	-- 	},
	-- 	root_dir = function()
	-- 		return vim.loop.cwd()
	-- 	end,
	-- })
end

return M
