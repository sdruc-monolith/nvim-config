-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--

local function send_to_local_clipboard(text)
  if not text or text == "" then
    return
  end

  local port = vim.env.LOCAL_CLIPBOARD_PORT
  if not port or port == "" then
    -- env var not set; do nothing
    return
  end
  -- ensure port is numeric
  if tostring(port):match("%D") then
    return
  end

  local max_len = 200000
  if #text > max_len then
    return
  end

  -- write to a temp file and POST with curl
  local tmp = vim.fn.tempname()
  local f = io.open(tmp, "wb")
  if not f then
    return
  end
  f:write(text)
  f:close()

  local url = "http://localhost:" .. port .. "/"
  -- suppress output; adjust curl path/options if needed on your remote
  vim.fn.system({ "curl", "-s", "--fail", "--data-binary", "@" .. tmp, url })
  os.remove(tmp)
end

local function local_clipboard_callback(regcontents)
  local text
  if type(regcontents) == "table" then
    text = table.concat(regcontents, "\n")
  else
    text = regcontents
  end
  send_to_local_clipboard(text)
end

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
    local regcontents = vim.v.event.regcontents
    local_clipboard_callback(regcontents)
    local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
    copy_to_unnamedplus(vim.v.event.regcontents)
    local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
    copy_to_unnamed(vim.v.event.regcontents)
  end,
})

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
