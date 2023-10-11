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
  keys = {
    { "<leader>ca", "<cmd>ChatGPTActAs<cr>", desc = "Open Chat GPT with Awesome Prompts" },
    { "<leader>cc", "<cmd>ChatGPT<cr>",      desc = "Open Chat GPT Prompt" },
    {
      "<leader>cC",
      "<cmd>ChatGPTRun complete_code<cr>",
      desc = "Chat GPT Complete Code",
      mode = { "n", "v" }
    },
    {
      "<leader>cd",
      "<cmd>ChatGPTRun docstring<cr>",
      desc = "Chat GPT Docstring",
      mode = { "n", "v" }
    },
    {
      "<leader>ce",
      "<cmd>ChatGPTEditWithInstructions<cr>",
      desc = "Chat GPT Edit With Instructions",
      mode = { "n", "v" }
    },
    {
      "<leader>cE",
      "<cmd>ChatGPTRun explain_code<cr>",
      desc = "Chat GPT Explain Code",
      mode = { "n", "v" }
    },
    {
      "<leader>cf",
      "<cmd>ChatGPTRun fix_bugs<cr>",
      desc = "Chat GPT Fix Bugs",
      mode = { "n", "v" }
    },
    {
      "<leader>cg",
      "<cmd>ChatGPTRun grammar_correction<cr>",
      desc = "Chat GPT Correct Grammar",
      mode = { "n", "v" }
    },
    {
      "<leader>ck",
      "<cmd>ChatGPTRun keywords<cr>",
      desc = "Chat GPT Keywords",
      mode = { "n", "v" }
    },
    {
      "<leader>co",
      "<cmd>ChatGPTRun optimize_code<cr>",
      desc = "Chat GPT Optimize Code",
      mode = { "n", "v" }
    },
    {
      "<leader>cr",
      "<cmd>ChatGPTRun code_readability_analysis<cr>",
      desc = "Chat GPT Code Readability Analysis",
      mode = { "n", "v" }
    },
    {
      "<leader>cR",
      "<cmd>ChatGPTRun roxygen_edit<cr>",
      desc = "Chat GPT Roxygen Edit",
      mode = { "n", "v" }
    },
    {
      "<leader>cs",
      "<cmd>ChatGPTRun summarize<cr>",
      desc = "Chat GPT Summarize",
      mode = { "n", "v" }
    },
    {
      "<leader>ct",
      "<cmd>ChatGPTRun add_tests<cr>",
      desc = "Chat GPT Add Tests",
      mode = { "n", "v" }
    },
    {
      "<leader>cT",
      "<cmd>ChatGPTRun translate<cr>",
      desc = "Chat GPT Translate",
      mode = { "n", "v" }
    },
  }
}
