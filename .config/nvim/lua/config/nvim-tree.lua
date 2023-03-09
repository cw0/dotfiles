local map = vim.keymap.set

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
})

map("n", "<Leader>fm", ":NvimTreeToggle<CR>", { desc = "toggle NvimTree" })
