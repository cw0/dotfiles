local M = {}

function M.setup()
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end

	navic.setup({
		highlight = true,
	})
end

return M
