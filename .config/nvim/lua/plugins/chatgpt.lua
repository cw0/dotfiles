return {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local status_ok, chatgpt = pcall(require, "chatgpt")
    if not status_ok then
      return
    end

    local api_key = os.getenv("OPENAI_API_KEY")

    if api_key then
      chatgpt.setup()
    end
  end,
}
