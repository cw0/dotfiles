local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"css",
		"fish",
		"html",
		"javascript",
		"json",
		"lua",
		"tsx",
		"typescript",
		"yaml",
		"vim",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
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
