return {
  lazy = true,
  ft = {"markdown"},
  build = "cargo build --release --locked",
  config = function()
    vim.g.markdown_composer_external_renderer = "pandoc --mathjax"
    vim.g.markdown_composer_browser = "\"/mnt/c/Program Files/Google/Chrome/Application/chrome.exe\""
  end
  -- lazy = true,
  -- cmd = {
  --   "MarkdownPreview"
  -- },
}
