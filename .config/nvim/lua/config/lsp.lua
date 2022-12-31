local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap.set("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	keymap.set("n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", "<leader>lq", "<cmd>LspRestart<CR>", opts)
	keymap.set("n", "<leader>ls", "<cmd>Lspsaga signature_help<CR>", opts)
	keymap.set("n", "<leader>lt", "<cmd>LSoutlineToggle<CR>", opts)

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>lo", "<cmd>TypescriptOrganizeImports<CR>", opts)
		keymap.set("n", "<leader>li", "<cmd>TypescriptAddMissingImports<CR>", opts)
		keymap.set("n", "<leader>lrf", "<cmd>TypescriptRenameFile<CR>", opts)
		keymap.set("n", "<leader>lu", "<cmd>TypescriptRemoveUnused<CR>", opts)
	end
end

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
	filetypes = {
		"javascript",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = function()
		return vim.loop.cwd()
	end,
})
