return {
  lazy = true,
  ft = {"cpp", "c", "lua", "markdown"},
  dependencies = {
    "nvim-ts-rainbow2"
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {"c", "cpp", "lua", "help", "markdown", "markdown_inline", "vim"},
      autoinstall = true,
      highlight = {
        enable = true
      },
      -- 彩虹括号，但是依赖于 ts-rainbow插件
      rainbow = {
        enable = true,
        -- disable = {"cpp", "c", "lua", "jsx"},
        query = 'rainbow-parens',
        strategy = require ("ts-rainbow.strategy.global"),
        max_file_lines = 3000,
      }
    })
  end
}
