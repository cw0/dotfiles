local M = {}

function M.setup()
	local mason_nvim_dap_status, mason_nvim_dap = pcall(require, "mason-nvim-dap")
	if not mason_nvim_dap_status then
		return
	end

	mason_nvim_dap.setup({
		ensure_installed = {
			"debugpy",
			"js-debug-adapter",
			"go-debug-adapter",
		},
		automatic_installation = true,
	})
end

return M
