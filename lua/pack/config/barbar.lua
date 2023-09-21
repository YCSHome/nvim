return {
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  init = function ()
    vim.g.barbar_auto_setup = false
  end,
  lazy = true,
  version = "^1.0.0",
}
