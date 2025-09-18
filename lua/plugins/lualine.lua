return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "skwee357/nvim-prose",
  },
  opts = function()
    local prose = require("nvim-prose")
    return {
      sections = {
        lualine_x = {
          { prose.word_count, cond = prose.is_available },
        },
      },
      --[[add your custom lualine config here]]
    }
  end,
}
