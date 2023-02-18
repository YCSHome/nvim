return {
  dependencies = {
    "nui.nvim",
    "nvim-notify",
  },
  config = function()
    require("noice").setup()
  end,
}
