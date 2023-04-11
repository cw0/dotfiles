local M = {}

function M.setup()
	local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not mason_lspconfig_status then
		return
	end

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"lua_ls",
			"tsserver",
			"jsonls",
			"tailwindcss",
			"terraformls",
			"yamlls",
		},
		-- auto-install configured servers (with lspconfig)
		automatic_installation = true, -- not the same as ensure_installed
	})
end

return M
