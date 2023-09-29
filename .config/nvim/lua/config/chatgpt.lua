local M = {}

function M.setup()
  local status_ok, chatgpt = pcall(require, "chatgpt")
  if not status_ok then
    return
  end

  local api_key = os.getenv("OPENAI_API_KEY")

  if api_key then
    chatgpt.setup()
  end
end

return M
