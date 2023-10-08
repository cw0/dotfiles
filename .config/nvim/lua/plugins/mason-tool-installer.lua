return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      "css-lsp",
      "delve",   -- for go
      "docker-compose-language-service",
      "dockerfile-language-server",
      "eslint_d",
      "golangci-lint",
      "golangci-lint-langserver",
      "gopls",
      "html-lsp",
      "js-debug-adapter",
      "json-lsp",
      "jsonlint",
      "lua-language-server",
      "markdownlint",
      "marksman",
      "prettier",
      "pylint",
      "pyright",
      "stylua",
      "terraform-ls",
      "tflint",
      "typescript-language-server",
      "yaml-language-server",
      "yamllint",
    },
    auto_update = false,
    run_on_start = true,
    debounce_hours = 4,
  }
}
