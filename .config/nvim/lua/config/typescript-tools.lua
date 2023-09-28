local M = {}

function M.setup()
	local typescript_tools_status, typescript_tools = pcall(require, "typescript-tools")
	if not typescript_tools_status then
		return
	end
	typescript_tools.setup({})
end

return M
