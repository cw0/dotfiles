local M = {}

function M.setup()
	local wk_status_ok, wk = pcall(require, "which-key")
	if not wk_status_ok then
		return
	end

	vim.o.timeout = true
	vim.o.timeoutlen = 300

	-- TODO remap popup srolling for consistency
	wk.setup({})

	wk.register({
		f = {
			name = "find / file manager",
			b = {
				":Telescope buffers<CR>",
				"Find Buffer",
			},
			d = {
				":lua require('telescope.builtin').lsp_definitions()<CR>",
				"Find Definition",
			},
			f = {
				"lua require('config.telescope').project_files()<CR>",
				"Find Files in Project",
			},
			h = {
				":Telescope harpoon marks<CR>",
				"Find Harpoon Marks in Files",
			},
			s = {
				":Telescope lsp_document_symbols<CR>",
				"Find Symbols in Files",
			},
			t = {
				":Telescope live_grep<CR>",
				"Find Text in Files",
			},
			w = {
				":Telescope grep_string<CR>",
				"Find Word in Files",
			},
		},
		g = {
			name = "git integration",
			b = {
				":GBrowse<CR>",
				"git browse",
			},
			c = {
				":G commit<CR>",
				"git commit",
			},
			d = {
				":Gdiffsplit<CR>",
				"git diff split",
			},
			g = {
				":lua _LAZYGIT_TOGGLE()<CR>",
				"lazygit toggle",
			},
			p = {
				":G push<CR>",
				"git push",
			},
			r = {
				":Gread<CR>",
				"git read",
			},
			s = {
				":G<CR>",
				"git status (open fugitive.vim)",
			},
			w = {
				":Gwrite<CR>",
				"git write",
			},
		},
	}, {
		prefix = "<leader>",
		noremap = true,
		silent = true,
	})
end

return M
