local M = {}

function M.setup()
	local status_ok, colorizer = pcall(require, "colorizer")
	if not status_ok then
		return
	end

	colorizer.setup({
		filtypes = { "*" },
		user_default_options = {
			names = false, -- "Name" codes like "Blue" or "blue"
		},
	})
end

return M
