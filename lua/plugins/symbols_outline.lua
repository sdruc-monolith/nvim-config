return {
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    enabled = false,
    lazy = false,
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
      autofold_depth = 0,
    },
  },
}
