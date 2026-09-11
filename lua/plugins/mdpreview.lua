return {
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = {
        size = 50 * 1024 * 1024,
        line_length = 2000,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function(plugin)
      local install = vim.system({ "yarn", "install" }, { cwd = plugin.dir .. "/app", text = true }):wait()
      if install.code ~= 0 then
        error(install.stderr)
      end

      local patch = vim.fn.stdpath("config") .. "/markdown-preview-routes.patch"
      local opts = { cwd = plugin.dir, text = true }
      if vim.system({ "git", "apply", "--unidiff-zero", "--reverse", "--check", patch }, opts):wait().code ~= 0 then
        local apply = vim.system({ "git", "apply", "--unidiff-zero", patch }, opts):wait()
        if apply.code ~= 0 then
          error(apply.stderr)
        end
      end
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/markdown-preview.css"
    end,
    ft = { "markdown" },
  },
}
