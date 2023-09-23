local M = {}

function M.setup()
	local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not mason_lspconfig_status then
		return
	end

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"cssls", -- css language server
			"docker_compose_language_service", -- docker compose language server
			"dockerls", -- docker language server
			"golangci_lint_ls", -- go language server
			"html", -- html language server
			"jsonls", -- json language server
			"lua_ls", -- lua language server
			"marksman", -- markdown language server
			"pyright", -- python language server
			"tsserver", -- typescript language server
			"terraformls", -- terraform language server
			"yamlls", -- yaml language server
		},
		-- auto-install configured servers (with lspconfig)
		automatic_installation = true, -- not the same as ensure_installed
	})
end

return M
