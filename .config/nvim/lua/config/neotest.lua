local map = vim.keymap.set

map("n", "<Leader>tn", function()
	require("neotest").run.run()
end, { desc = "test nearest" })
map("n", "<Leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "test file" })
map("n", "<Leader>to", function()
	require("neotest").output.open({ enter = true })
end, { desc = "open test results" })
map("n", "<Leader>td", function()
	require("neotest").run.run({ strategy = "dap" })
end, { desc = "debug test" })
map("n", "<Leader>ts", function()
	require("neotest").run.stop()
end, { desc = "stop test" })
map("n", "<Leader>ta", function()
	require("neotest").run.attach()
end, { desc = "attach to test" })

-- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
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
}, neotest_ns)

require("neotest").setup({
	adapters = {
		require("neotest-jest")({
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
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
