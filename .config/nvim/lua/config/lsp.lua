local M = {}

M.setup = function()
  local lspconfig_status, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status then
    print("lspconfig died")
    return
  end

  local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not cmp_nvim_lsp_status then
    print("cmp_nvim_lsp died")
    return
  end

  -- local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local capabilities = cmp_nvim_lsp.default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local on_attach = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end

  lspconfig.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.docker_compose_language_service.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.dockerls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.golangci_lint_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.gopls.setup({
    capabilities = capabilities,
    cmd = { "gopls", "--remote=auto" },
    on_attach = on_attach,
  })

  lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
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

  lspconfig.marksman.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  --configure pyright
  lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- configure terraformls
  lspconfig.terraformls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- configure tflint
  lspconfig.tflint.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  lspconfig.yamlls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
  vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
  vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
  vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
  vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

  vim.cmd([[let g:terraform_fmt_on_save=1]])
  vim.cmd([[let g:terraform_align=1]])

  -- Show line diagnostics automatically in hover window
  vim.o.updatetime = 250
  vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
end

return M
