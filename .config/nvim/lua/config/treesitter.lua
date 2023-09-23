local M = {}

function M.setup()
	local status_ok, configs = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end

	configs.setup({
		ensure_installed = {
			"bash",
			"css",
			"fish",
			"go",
			"hcl",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"python",
			"terraform",
			"tsx",
			"typescript",
			"yaml",
			"vim",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		autopairs = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})
end

return M
