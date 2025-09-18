-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- Comment
map("n", "<m-/>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<m-/>", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>Neotree<CR>", { desc = "nvimtree focus window", remap = true })

-- buffers
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "go to next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "go to next buffer" })

map("n", "[p", "<CMD>call search('[(]', 'bW')<CR>b", { desc = "go to calling function", remap = true })

-- local harpoon = require("harpoon")
--
-- -- REQUIRED
-- harpoon:setup()
-- -- REQUIRED
--
-- map("n", "<leader>ha", function()
--   harpoon:list():add()
-- end)
-- map("n", "<leader>hm", function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)

-- map("n", "<C-h>", function()
--   harpoon:list():select(1)
-- end)
-- map("n", "<C-t>", function()
--   harpoon:list():select(2)
-- end)
-- map("n", "<C-n>", function()
--   harpoon:list():select(3)
-- end)
-- map("n", "<C-s>", function()
--   harpoon:list():select(4)
-- end)

-- Toggle previous & next buffers stored within Harpoon list
-- map("n", "<leader>hp", function()
--   harpoon:list():prev()
-- end)
-- map("n", "<leader>hn", function()
--   harpoon:list():next()
-- end)
