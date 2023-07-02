local M = {}

function M.setup()
	-- get neotest namespace (api call creates or returns namespace)
	vim.diagnostic.config({
		-- virtual_text = {
		-- 	format = function(diagnostic)
		-- 		local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
		-- 		return message
		-- 	end,
		-- },
		virtual_text = false,
		float = {
			border = "rounded",
		},
	})

	require("neotest").setup({
		adapters = {
			require("neotest-jest")({
				env = { CI = true },
				cwd = function(path)
					-- return vim.fn.getcwd()
					local cwd = require("neotest-jest.util").find_package_json_ancestor(path)
					return cwd
				end,
			}),
		},
		output = {
			enable = true,
			open_on_run = true,
		},
		quickfix = {
			enable = false,
			open = false,
		},
	})
end

return M
