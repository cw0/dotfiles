local M = {}

function M.setup()
	local nvim_tmux_nav_status, nvim_tmux_nav = pcall(require, "nvim-tmux-navigation")
	if not nvim_tmux_nav_status then
		return
	end

	nvim_tmux_nav.setup({
		disable_when_zoomed = true, -- defaults to false
	})
end

return M
