return {
  lazy = true,
  dependencies = {
    "nui.nvim",
    "nvim-notify",
  },
  event = "VeryLazy",
  config = function()
    ---require("noice.config").options.lsp.hover.enabled = false
    require("noice").setup({
      cmdline = {
        format = {
          filter = { icon = "" },
        }
      },
      lsp = {
        hover = {
          enabled = false,
        },
      },
      hover = {
        enabled = false,
      },
      -- presets = {
      --   lsp_doc_border = true,
      -- },
    })
  end,
}
