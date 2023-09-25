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

	lspconfig.cssls.setup({
		capabilities = capabilities,
	})

	lspconfig.docker_compose_language_service.setup({})

	lspconfig.dockerls.setup({})

	lspconfig.golangci_lint_ls.setup({})

	lspconfig.gopls.setup({
		cmd = { "gopls", "--remote=auto" },
	})

	lspconfig.html.setup({
		capabilities = capabilities,
	})

	lspconfig.jsonls.setup({})

	lspconfig.lua_ls.setup({
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
end

return M
