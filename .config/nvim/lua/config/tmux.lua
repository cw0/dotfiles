local M = {}

function M.setup()
  local tmux_status, tmux = pcall(require, "tmux")
  if not tmux_status then
    return
  end

  tmux.setup()
end

return M
