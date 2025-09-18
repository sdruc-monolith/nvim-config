return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    "mason.nvim",
    { "mason-org/mason-lspconfig.nvim", config = function() end },
  },
  opts = {
    ---@type lspconfig.options
    servers = {
      pyright = {},
      -- ruff = {},
      clangd = {},
      texlab = {},
    },
  },
}
