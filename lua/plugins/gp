return {
  "robitx/gp.nvim",
  lazy = false,
  keys = {
    { "<leader>cqa", "<cmd>GpAppend<CR>", desc = "Append (after)" },
    { "<leader>cqb", "<cmd>GpPrepend<CR>", desc = "Prepend (before)" },
    { "<leader>cqc", "<cmd>GpChatNew<CR>", desc = "New Chat" },
    { "<leader>cqf", "<cmd>GpChatFinder<CR>", desc = "Chat Finder" },
  },
  config = function()
    local conf = {
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      default_command_agent = "ChatGPT5",
      default_chat_agent = "GPT5-mini",
      agents = {
        {
          provider = "openai",
          name = "ChatGPT5",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-5" },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "openai",
          name = "GPT5-mini",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-5-mini" },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
      },
    }
    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
