local M = {}

function M.setup()
	local status_ok, gitsigns = pcall(require, "gitsigns")
	if not status_ok then
		return
	end

	gitsigns.setup()
end

return M
