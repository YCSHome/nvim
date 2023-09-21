return {
  event = "VeryLazy",
  lazy = false,
  -- lazy = true,
  config = function()
    require("Comment").setup({
      toggler = {
        line = "<leader>c",
        block = "<leader>\\",
      },
      opleader = {
        line = "<leader>c",
        block = "<leader>\\",
      },
    })
  end
}
