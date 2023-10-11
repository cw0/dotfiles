return {
  "nvim-telescope/telescope.nvim",
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
        border = true,
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            -- ["<C-i>"] = function()
            --   telescope("find_files", { no_ignore = true })()
            -- end,
            -- ["<C-h>"] = function()
            --   telescope("find_files", { hidden = true })()
            -- end,
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
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          mappings = {
            -- TODO: see if this can be used elsewhere
            n = {
              ["cd"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                require("telescope.actions").close(prompt_bufnr)
                -- Depending on what you want put `cd`, `lcd`, `tcd`
                vim.cmd(string.format("silent cd %s", dir))
              end
            }
          }
        },
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

    telescope.load_extension("dap")
    telescope.load_extension("docker")
    telescope.load_extension("fzf")
    telescope.load_extension("harpoon")
    telescope.load_extension("notify")
    telescope.load_extension("lazy")
    telescope.load_extension("lazygit")
    telescope.load_extension("luasnip")
    telescope.load_extension("media_files")
    telescope.load_extension("refactoring")
    telescope.load_extension('telescope-alternate')
    telescope.load_extension("terraform_doc")
  end,
  dependencies = {
    {
      "otavioschwanck/telescope-alternate"
      -- TODO: configure this for golang
      -- TODO: configure this for python
      -- TODO: configure this for javascript
      -- TODO: configure this for typescript
    },
    { "nvim-telescope/telescope-dap.nvim" },
    { "lpoto/telescope-docker.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    { "ThePrimeagen/harpoon" },
    { "tsakirist/telescope-lazy.nvim" },
    { "kdheepak/lazygit.nvim" },
    { "benfowler/telescope-luasnip.nvim" },
    {
      "nvim-telescope/telescope-media-files.nvim"
      -- NOTE: requires chafa, imagemagick, fd, ripgrep, find, ffmpegthumbnailer, poppler, epub-thumbnailer, fontpreview
    },
    { "rcarriga/nvim-notify" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-lua/popup.nvim" },
    { "ThePrimeagen/refactoring.nvim" },
    { "ANGkeith/telescope-terraform-doc.nvim" },
  },
  keys = {
    {
      "<leader>/",
      "<cmd>Telescope live_grep<cr>",
      desc =
      "Find in Files (Grep)"
    },
    { "<leader>dfb", "<cmd>Telescope dap list_breakpoints<cr>",               desc = "List Breakpoints" },
    { "<leader>dfc", "<cmd>Telescope dap commands<cr>",                       desc = "Dap Commands" },
    { "<leader>dfo", "<cmd>Telescope dap configurations<cr>",                 desc = "Dap Configurations" },
    { "<leader>dfv", "<cmd>Telescope dap variables<cr>",                      desc = "Dap Variables" },
    { "<leader>dff", "<cmd>Telescope dap frames<cr>",                         desc = "Dap Frames" },
    { "<leader>fa",  "<cmd>Telescope telescope-alternate alternate_file<cr>", desc = "Alternate Files" },
    { "<leader>fb",  "<cmd>Telescope buffers<cr>",                            desc = "Buffers" },
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc =
      "Find Files (root dir)"
    },
    { "<leader>fF", "<cmd>Telescope find_files cwd=false<cr>", desc = "Find Files (cwd)" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",             desc = "Recent" },
    { "<leader>fs", "<cmd>Telescope luasnip<cr>",              desc = "Luasnip" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>",            desc = "Find Text In Files" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>",          desc = "Find Word In Files" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>",          desc = "commits" },
    { "<leader>gs", "<cmd>Telescope lazygit<cr>",              desc = "lazygit" },
    { "<leader>ha", "<cmd>Telescope autocommands<cr>",         desc = "Auto Commands" },
    { "<leader>hc", "<cmd>Telescope commands<cr>",             desc = "Commands" },
    { "<leader>hf", "<cmd>Telescope filetypes<cr>",            desc = "File Types" },
    { "<leader>hh", "<cmd>Telescope help_tags<cr>",            desc = "Help Pages" },
    { "<leader>hk", "<cmd>Telescope keymaps<cr>",              desc = "Key Maps" },
    { "<leader>hm", "<cmd>Telescope man_pages<cr>",            desc = "Man Pages" },
    {
      "<leader>ho",
      "<cmd>Telescope vim_options<cr>",
      desc = "Options",
    },
    {
      "<leader>hs",
      "<cmd>Telescope highlights<cr>",
      desc = "Search Highlight Groups"
    },
    {
      "<leader>ht",
      "<cmd>Telescope builtin<cr>",
      desc = "Telescope",
    },
    {
      "<leader>ls",
      "<cmd>Telescope lsp_document_symbols symbols=Class,Function,Method,Interface,Constructor,Module,Struct,Trait,Field,Property,Variable<cr>",
      desc = "Lsp Symbols",
    },
    {
      "<leader>ma",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      desc = "harpoon add file",
    },
    {
      "<leader>rc",
      function() require('refactoring').debug.cleanup({}) end,
      desc = "Clear Print Statements",
    },
    {
      "<leader>rp",
      function() require('refactoring').debug.print_var() end,
      desc = "Add Print Statement",
      mode = { "n", "x" }
    },
    {
      "<leader>rr",
      function() require('telescope').extensions.refactoring.refactors() end,
      desc = "Refactor Selection",
      mode = { "n", "x" }
    },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>",                 desc = "Grep (root dir)" },
    { "<leader>sG", "<cmd>Telescope live_grep cwd=false<cr>",       desc = "Grep (cwd)" },
    { "<leader>sh", "<cmd>Telescope harpoon marks<cr>" },
    {
      "<leader>sl",
      "<cmd>Telescope lsp_document_symbols symbols=Class,Function,Method,Interface,Constructor,Module,Struct,Trait,Field,Property,Variable<cr>",
      desc = "Lsp Symbols",
    },
    { "<leader>sm",  "<cmd>Telescope marks<cr>",             desc = "Jump to Mark" },
    { "<leader>ss",  "<cmd>Telescope luasnip<cr>",           desc = "Luasnip" },
    { "<leader>vdd", "<cmd>Telescope docker<cr>",            desc = "Docker" },
    { "<leader>vdc", "<cmd>Telescope docker containers<cr>", desc = "Containers" },
    { "<leader>vdi", "<cmd>Telescope docker images<cr>",     desc = "Images" },
    { "<leader>vdn", "<cmd>Telescope docker networks<cr>",   desc = "Networks" },
    { "<leader>vdv", "<cmd>Telescope docker volumes<cr>",    desc = "Volumes" },
    { "<leader>vdx", "<cmd>Telescope docker contexts<cr>",   desc = "Contexts" },
    { "<leader>vds", "<cmd>Telescope docker swarm<cr>",      desc = "Swarm" },
    { "<leader>vdm", "<cmd>Telescope docker machines<cr>",   desc = "Machines" },
    { "<leader>vdo", "<cmd>Telescope docker compose<cr>",    desc = "Compose" },
    { "<leader>vdf", "<cmd>Telescope docker files<cr>",      desc = "Files" },
    { "<leader>vl",  "<cmd>Telescope lazy<cr>",              desc = "Lazy Plugins" },
    { "<leader>vM",  "<cmd>Telescope media_files<cr>",       desc = "Media Files" },
    {
      "<leader>vta",
      "<cmd>Telescope terraform_doc full_name=hashicorp/aws<cr>",
      desc = "AWS Provider Docs",
    },
    {
      "<leader>vtm",
      "<cmd>Telescope terraform_doc modules<cr>",
      desc = "Modules",
    },
    {
      "<leader>vtt",
      "<cmd>Telescope terraform_doc<cr>",
      desc = "Docs",
    },
    { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>:", "<cmd>Telescope command_history<cr>",               desc = "Command History" },
  }
}
