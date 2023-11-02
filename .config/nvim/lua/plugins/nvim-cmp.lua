return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",   --buffer completions
    "hrsh7th/cmp-nvim-lsp", --lsp completions
    "hrsh7th/cmp-path",     --path completions
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "friendly-snippets" },
      config = function()
        -- TODO: this is gross
        local luasnip_status, luasnip = pcall(require, "luasnip")
        if not luasnip_status then
          return
        end

        luasnip.config.set_config({
          history = false,
          updateevents = "TextChanged,TextChangedI",
        })

        require("luasnip/loaders/from_vscode").load()
      end,
    },
    "rafamadriz/friendly-snippets", -- snippets collection
  },
  config = function()
    local cmp_status, cmp = pcall(require, "cmp")
    if not cmp_status then
      return
    end

    local lspkind_status, lspkind = pcall(require, "lspkind")
    if not lspkind_status then
      return
    end

    local luasnip_status, luasnip = pcall(require, "luasnip")
    if not luasnip_status then
      return
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item(),   -- next suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(),   -- next suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(),   -- previous suggestion
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-y>"] = cmp.mapping.confirm({ select = false }),
        ["<C-l>"] = cmp.mapping.complete(), -- show completion suggestions
      },
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "luasnip" },  -- snippets
        -- { name = "copilot" },
        { name = "nvim_lsp" }, -- lsp
        { name = "path" },     -- file system paths
      }, {
        { name = "buffer" },
      }),
      -- configure lspkind for vs-code like icons
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = { Copilot = "" },
        }),
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      cmdline = {
        ":",
        {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            { name = "buffer" },
          }),
        },
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
    })
  end,
}
