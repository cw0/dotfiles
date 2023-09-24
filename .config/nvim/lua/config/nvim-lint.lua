local M = {}

function M.setup()
  local status_ok, lint = pcall(require, "lint")
  if not status_ok then
    return
  end

  lint.linters_by_ft = {
    go = {"golangcilint"},
    javascript = {"eslint_d"},
    javascriptreact = {"eslint_d"},
    json = {"jsonlint"},
    markdown = {"markdownlint"},
    python = {"pylint"},
    typescript = {"eslint_d"},
    typescriptreact = {"eslint_d"},
    yaml = {"yamllint"},
  }

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
end

return M
