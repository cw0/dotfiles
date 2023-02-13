local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				work = "~/notes/work",
				home = "~/notes/home",
			},
			index = "index.norg",
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.norg.concealer"] = {
			config = {},
		},
		["core.integrations.telescope"] = {},
	},
})
