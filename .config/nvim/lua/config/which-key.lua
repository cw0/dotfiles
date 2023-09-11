local M = {}

function M.setup()
	local wk_status_ok, wk = pcall(require, "which-key")
	if not wk_status_ok then
		return
	end

	vim.o.timeout = true
	vim.o.timeoutlen = 300

	-- TODO remap popup scrolling for consistency
	wk.setup({})

	wk.register({
		b = {
			name = "buffer",
			l = {
				":ls<CR>",
				"show all buffers and their status",
			},
			q = {
				":bp <BAR> bd #<CR>",
				"close current buffer and move to previous",
			},
		},
		d = {
			name = "dap",
			b = {
				":lua require('dap').toggle_breakpoint()<cr>",
				"toggle breakpoint",
			},
			c = {
				":lua require('dap').continue()<cr>",
				"continue",
			},
			i = {
				":lua require('dap').step_into()<cr>",
				"step into",
			},
			l = {
				":lua require('dap').run_last()<cr>",
				"run last",
			},
			o = {
				":lua require('dap').step_over()<cr>",
				"step over",
			},
			O = {
				":lua require('dap').step_out()<cr>",
				"step out",
			},
			r = {
				":lua require('dap').repl.toggle()<cr>",
				"toggle repl",
			},
			t = {
				":lua require('dap').terminate()<cr>",
				"terminate dap",
			},
			u = {
				":lua require('dapui').toggle()<cr>",
				"toggle dapui",
			},
		},
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
				":Gvdiffsplit!<CR>",
				"git diff split",
			},
			g = {
				":lua _LAZYGIT_TOGGLE()<CR>",
				"lazygit toggle",
			},
			m = {
				":G mergetool<CR>",
				"open git mergetool",
			},
			l = {
				":G log<CR>",
				"open git log",
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
		h = {
			name = "harpoon",
			h = {
				":lua require('harpoon.ui').toggle_quick_menu()<CR>",
				"toggle harpoon menu",
			},
			m = {
				":lua require('harpoon.mark').add_file()<CR>",
				"harpoon add file",
			},
		},
		o = {
			name = "related buffers/files (other)",
			c = {
				":OtherClear<CR>",
				"clear other",
			},
			i = {
				":OtherVSplit implementation<CR>",
				"open implementation in vsplit",
			},
			k = {
				":Other<CR>",
				"other",
			},
			s = {
				":OtherVSplit story<CR>",
				"open stories in vsplit",
			},
			t = {
				":OtherVSplit test<CR>",
				"open tests in vsplit",
			},
			v = {
				":OtherVSplit<CR>",
				"other vsplit",
			},
		},
		r = {
			name = "run",
			l = {
				":r!<C-r><C-l><CR>",
				"run command on line and paste output in buffer",
			},
		},
		t = {
			name = "neotest",
			a = {
				":lua require('neotest').run.attach()<CR>",
				"attach to test",
			},
			d = {
				":lua require('neotest').run.run({ strategy = 'dap' })<CR>",
				"debug test",
			},
			f = {
				":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
				"test file",
			},
			n = {
				":lua require('neotest').run.run()<CR>",
				"test nearest",
			},
			o = {
				":lua require('neotest').output.open({ enter = true })<CR>",
				"open test output",
			},
			s = {
				":lua require('neotest').run.stop()<CR>",
				"stop neotest",
			},
		},
	}, {
		prefix = "<leader>",
		noremap = true,
		silent = true,
	})
end

return M
