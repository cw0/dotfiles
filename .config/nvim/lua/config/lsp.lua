-- Mason
local mason_status, mason = pcall(require, 'mason')
if (not mason_status) then return end

mason.setup()

-- Mason LSP Config
local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not mason_lspconfig_status) then return end

mason_lspconfig.setup({
  ensure_installed = {
    'sumneko_lua',
    'tsserver'
  },
  automatic_installation = true
})

local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if (not lspconfig_status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  --formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('Format', { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false
      },
    },
  },
}

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not cmp_nvim_lsp_status) then return end

local capabilities = cmp_nvim_lsp.default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

lspconfig.tsserver.setup {
  on_attach = on_attach,
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = {
    'javascript',
    'typescript',
    'typescriptreact',
    'typescript.tsx'
  },
  root_dir = function() return vim.loop.cwd() end
}

local cmp_status, cmp = pcall(require, "cmp")
if (not cmp_status) then return end

local lspkind = require('lspkind') -- TODO convert to pcall

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  window = {
    documentation = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:String",
      max_width = 10,
    }),
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:String",
      side_padding = 1,
      col_offset = 3,
      scrollbar = false,
    }),
  },

  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  },
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})
