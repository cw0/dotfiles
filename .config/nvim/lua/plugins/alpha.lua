return {
  "goolord/alpha-nvim",
  priority = 1000,
  config = function()
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      return
    end

    local dashboard = require("alpha.themes.dashboard")

    math.randomseed(os.time())

    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl = "Function"
      b.opts.hl_shortcut = "Type"
      return b
    end

    local function pick_color()
      local colors = { "String", "Identifier", "Keyword", "Number" }
      return colors[math.random(#colors)]
    end

    local function footer()
      local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
      return datetime .. "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
    end

    dashboard.section.header.val = {
      "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
      "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
      "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
      "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
      "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
      "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
      "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
      " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
      " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
      "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
      "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
    }
    dashboard.section.header.opts = {
      position = "center",
      hl = pick_color(),
    }

    -- dashboard.section.header.opts.hl = pick_color()

    dashboard.section.buttons.val = {
      button("f", " " .. " Find file", ":lua require('telescope.builtin').find_files()<CR>"),
      button("e", " " .. " New file", ":ene <BAR> startinsert<CR>"),
      button("r", " " .. " Recent files", ":Telescope oldfiles<CR>"),
      button("t", " " .. " Find text", ":Telescope live_grep<CR>"),
      button("h", " " .. " Open Home Neorg", ":e ~/notes/home/index.norg<CR>"),
      button("w", " " .. " Open Work Neorg", ":e ~/notes/work/index.norg<CR>"),
      button("c", " " .. " Config", ":e ~/.config/nvim/init.lua<CR>"),
      button("u", " " .. " Update plugins", ":Lazy sync<CR>"),
      button("q", " " .. " Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = pick_color()

    alpha.setup(dashboard.opts)
  end,
}
