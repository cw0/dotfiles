return {
  "nvim-telescope/telescope.nvim",
  command = "Telescope",
  config = function()
    local telescope_setup, telescope = pcall(require, "telescope")
    if not telescope_setup then
      return
    end

    local actions_setup, actions = pcall(require, "telescope.actions")
    if not actions_setup then
      return
    end

    telescope.setup({
      defaults = {
        -- TODO: move to keys for lazy
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<C-i>"] = function()
              telescope("find_files", { no_ignore = true })()
            end,
            ["<C-h>"] = function()
              telescope("find_files", { hidden = true })()
            end,
            ["<C-Down>"] = function(...)
              return actions.cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return actions.cycle_history_prev(...)
            end,
          },
        },
      },
      pickers = {
        live_grep = {
          additional_args = function()
            -- Dotfiles are getting hidden because they're technically hidden files.
            -- If we set ripgrep to include hidden files, we see too many files that we don't care about.
            -- But ripgrep doesn't seem to support searching hidden files that are tracked by git.
            -- We can filter out git repos though.
            return { "--hidden", "-g", "!.git" }
          end,
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("harpoon")
    telescope.load_extension("notify")
    telescope.load_extension("lazygit")
    telescope.load_extension("terraform_doc")
  end,
  dependencies = {
    {
      "ThePrimeagen/harpoon"
    },
    {
      "kdheepak/lazygit.nvim",
    },
    {
      "rcarriga/nvim-notify",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    { "ANGkeith/telescope-terraform-doc.nvim" },
  },
  keys = {
    { "<leader>/",   "<cmd>Telescope live_grep<cr>",                             desc = "Find in Files (Grep)" },
    { "<leader>fb",  "<cmd>Telescope buffers<cr>",                               desc = "Buffers" },
    { "<leader>fd",  "<cmd>Telescope builtin lsp_definitions<cr>" },
    { "<leader>ff",  "<cmd>Telescope find_files<cr>",                            desc = "Find Files (root dir)" },
    { "<leader>fF",  "<cmd>Telescope find_files cwd=false<cr>",                  desc = "Find Files (cwd)" },
    { "<leader>fr",  "<cmd>Telescope oldfiles<cr>",                              desc = "Recent" },
    { "<leader>ft",  "<cmd>Telescope live_grep<cr>",                             desc = "Find Text In Files" },
    { "<leader>fw",  "<cmd>Telescope grep_string<cr>",                           desc = "Find Word In Files" },
    { "<leader>gc",  "<cmd>Telescope git_commits<cr>",                           desc = "commits" },
    { "<leader>gs",  "<cmd>Telescope git_status<cr>",                            desc = "status" },
    { "<leader>ha",  "<cmd>Telescope autocommands<cr>",                          desc = "Auto Commands" },
    { "<leader>hc",  "<cmd>Telescope commands<cr>",                              desc = "Commands" },
    { "<leader>hf",  "<cmd>Telescope filetypes<cr>",                             desc = "File Types" },
    { "<leader>hh",  "<cmd>Telescope help_tags<cr>",                             desc = "Help Pages" },
    { "<leader>hk",  "<cmd>Telescope keymaps<cr>",                               desc = "Key Maps" },
    { "<leader>hm",  "<cmd>Telescope man_pages<cr>",                             desc = "Man Pages" },
    { "<leader>ho",  "<cmd>Telescope vim_options<cr>",                           desc = "Options" },
    { "<leader>hs",  "<cmd>Telescope highlights<cr>",                            desc = "Search Highlight Groups" },
    { "<leader>ht",  "<cmd>Telescope builtin<cr>",                               desc = "Telescope" },
    { "<leader>ota", "<cmd>Telescope terraform_doc full_name=hashicorp/aws<cr>", desc = "Terraform AWS Provider Docs" },
    { "<leader>otm", "<cmd>Telescope terraform_doc modules<cr>",                 desc = "Terraform Docs Modules" },
    { "<leader>ott", "<cmd>Telescope terraform_doc<cr>",                         desc = "Terraform Docs" },
    { "<leader>sb",  "<cmd>Telescope current_buffer_fuzzy_find<cr>",             desc = "Buffer" },
    { "<leader>sc",  "<cmd>Telescope command_history<cr>",                       desc = "Command History" },
    { "<leader>sg",  "<cmd>Telescope live_grep<cr>",                             desc = "Grep (root dir)" },
    { "<leader>sG",  "<cmd>Telescope live_grep cwd=false<cr>",                   desc = "Grep (cwd)" },
    { "<leader>sh",  "<cmd>Telescope harpoon marks<cr>" },
    { "<leader>sm",  "<cmd>Telescope marks<cr>",                                 desc = "Jump to Mark" },
    {
      "<leader>ss",
      "Telescope lsp_document_symbols<cr>",
      desc = "Goto Symbol",
    },

    { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>:", "<cmd>Telescope command_history<cr>",               desc = "Command History" },
  }
}
