return {
  -- 官方说不建议延时加载……
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
  end
}
