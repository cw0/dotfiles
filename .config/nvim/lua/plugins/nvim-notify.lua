return {
  "rcarriga/nvim-notify",
  config = function()
    local status_ok, notify = pcall(require, "notify")
    if not status_ok then
      return
    end

    notify.setup({
      on_open = function(win)
        -- TODO: see if there is a way to do this system wide
        local config = vim.api.nvim_win_get_config(win)
        config.border = "single"
        vim.api.nvim_win_set_config(win, config)
      end
    })

    vim.notify = notify
  end,
}
