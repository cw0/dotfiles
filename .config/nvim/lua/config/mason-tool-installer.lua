local M = {}

function M.setup()
	local mason_tool_installer_status, mason_tool_installer = pcall(require, "mason-tool-installer")
	if not mason_tool_installer_status then
		return
	end

	mason_tool_installer.setup({
		ensure_installed = {
			"css-lsp",
			"delve", -- for go
			"docker-compose-language-service",
			"dockerfile-language-server",
			"eslint_d",
			"golangci-lint",
			"golangci-lint-langserver",
			"gopls",
			"html-lsp",
			"js-debug-adapter",
			"json-lsp",
			"jsonlint",
			"lua-language-server",
			"markdownlint",
			"marksman",
			"prettier",
			"pylint",
			"pyright",
			"stylua",
			"terraform-ls",
			"tflint",
			"typescript-language-server",
			"yaml-language-server",
			"yamllint",
		},
		auto_update = false,
		run_on_start = true,
		-- debounce_hours = 5,
	})
end

return M
