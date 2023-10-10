return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { "<leader>gha", "<cmd>Octo actions<cr>", desc = "Actions" },
    { "<leader>ghil", "<cmd>Octo issue list<cr>", desc = "List" },
    { "<leader>ghic", "<cmd>Octo issue create<cr>", desc = "Create" },
    { "<leader>ghis", "<cmd>Octo issue search<cr>", desc = "Search" },
    { "<leader>ghpl", "<cmd>Octo pr list<cr>", desc = "List" },
    { "<leader>ghps", "<cmd>Octo pr search<cr>", desc = "Search" },
    { "<leader>ghpc", "<cmd>Octo pr create<cr>", desc = "Create" },
    { "<leader>ghr", "<cmd>Octo repo list<cr>", desc = "List Repos" },
    { "<leader>ghg", "<cmd>Octo gist list<cr>", desc = "List Gists" },
  },
  opts = {}
}
