return {
  "jghauser/follow-md-links.nvim",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("follow-md-links", { clear = true }),
      pattern = "markdown",
      callback = function(event)
        vim.keymap.set("n", "<CR>", function()
          local line = vim.api.nvim_get_current_line()
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local offset = 1

          while true do
            local link_start, link_end, fragment = line:find("%b[]%((#[^%)]+)%)", offset)
            if not link_start then
              break
            end
            if col >= link_start - 1 and col <= link_end - 1 then
              local anchor = fragment:sub(2):gsub("([^%w])", "%%%1")
              for index, candidate in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
                local double_quoted = candidate:match('<a%s+[^>]-id%s*=%s*"' .. anchor .. '"')
                local single_quoted = candidate:match("<a%s+[^>]-id%s*=%s*'" .. anchor .. "'")
                if double_quoted or single_quoted then
                  vim.cmd("normal! m'")
                  vim.api.nvim_win_set_cursor(0, { index, 0 })
                  return
                end
              end
              break
            end
            offset = link_end + 1
          end

          require("follow-md-links").follow_link()
        end, { buffer = event.buf, silent = true, desc = "Follow Markdown link" })
        vim.keymap.set("n", "<BS>", "<C-o>", {
          buffer = event.buf,
          silent = true,
          desc = "Jump back from Markdown link",
        })
      end,
    })
  end,
}
