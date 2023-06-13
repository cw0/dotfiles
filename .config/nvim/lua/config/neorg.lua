local M = {}

function M.setup()
	local status_ok, neorg = pcall(require, "neorg")
	if not status_ok then
		print("neorg didn't load")
		return
	end

	neorg.setup({
		load = {
			["core.defaults"] = {},
			["core.dirman"] = {
				config = {
					work = "~/notes/work",
					home = "~/notes/home",
				},
				index = "index.norg",
			},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.concealer"] = {
				config = {},
			},
			["core.integrations.telescope"] = {},
		},
	})
end

return M
