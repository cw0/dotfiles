return {
  "aserowy/tmux.nvim",
  priority = 1000,
  config = function()
    local tmux_status, tmux = pcall(require, "tmux")
    if not tmux_status then
      return
    end

    tmux.setup()
  end,
}
