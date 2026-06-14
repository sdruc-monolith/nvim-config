-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.relativenumber = false
opt.guicursor = "a:blinkon100,n-c-v:block-nCursor,i-ci:ver50-iCursor"
opt.cursorline = true
opt.cursorlineopt = "number"
opt.fillchars = opt.fillchars + "horiz:‡"
opt.wrap = true
opt.linebreak = true
opt.clipboard = "unnamedplus"
vim.g.snacks_animate = false
-- vim.g.clipboard = "osc52"
