return {
  lazy = true,
  dependencies = {
    "nui.nvim",
    "nvim-notify",
  },
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      cmdline = {
        format = {
          filter = { icon = "" },
        }
      }
    })
  end,
}
