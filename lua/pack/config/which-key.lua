return {
  lazy = true,
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    require("which-key").setup({
      window = {
        border = "rounded",
        position = "bottom",
      }
    })
  end
}
