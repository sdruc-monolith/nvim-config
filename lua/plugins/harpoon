local keys = function()
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harpoon Mark File",
    },
    {
      "<leader>h",
      -- function()
      --   require("harpoon.ui").toggle_quick_menu()
      -- end,
      "<cmd>Telescope harpoon marks<CR>",
      desc = "Harpoon Toggle Quick Menu",
    },
    {
      "<leader><Right>",
      function()
        require("harpoon.ui").nav_next()
      end,
      desc = "Harpoon Go To Next Mark",
    },
    {
      "<leader><Left>",
      function()
        require("harpoon.ui").nav_prev()
      end,
      desc = "Harpoon Go To Previous Mark",
    },
  }

  for i = 1, 4 do
    table.insert(keys, {
      "<leader>" .. i,
      function()
        require("harpoon.ui").nav_file(i)
      end,
      desc = "Harpoon to Mark " .. i,
    })
  end
  return keys
end

return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = keys(),
}
