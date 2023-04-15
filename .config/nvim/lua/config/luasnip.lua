local M = {}

function M.setup()
	local luasnip_status, luasnip = pcall(require, "luasnip")
	if not luasnip_status then
		return
	end

	luasnip.config.set_config({
		history = false,
		updateevents = "TextChanged,TextChangedI",
	})

	require("luasnip/loaders/from_vscode").load()
end

return M
