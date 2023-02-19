return {
  lazy = true,
  ft = {"cpp", "c", "lua", "markdown"},
  dependencies = {
    "nvim-ts-rainbow"
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "vim",
        "lua",
        "help",
        "bash",
        "regex",
        "markdown",
        "markdown_inline",
      },
      autoinstall = true,
      highlight = {
        enable = true
      },
      -- 彩虹括号，但是依赖于 ts-rainbow插件
      rainbow = {
        enable = true,
        extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
      }
    })
  end
}
