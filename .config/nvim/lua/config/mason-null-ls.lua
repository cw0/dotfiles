local M = {}

function M.setup()
	local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
	if not mason_null_ls_status then
		return
	end

	mason_null_ls.setup({
		-- list of formatters & linters for mason to install
		ensure_installed = {
			"eslint_d", -- ts/js linter
			"golangci-lint", -- go linter
			"jsonlint", -- json linter
			"markdownlint", -- markdown linter
			"prettier", -- ts/js formatter
			"pylint", -- python linter
			"stylua", -- lua formatter
			"tflint", -- terraform linting
			"yamllint", -- yaml linting
		},
		-- auto-install configured formatters & linters (with null-ls)
		automatic_installation = true,
	})
end

return M
