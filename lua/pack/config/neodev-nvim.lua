return {
  lazy = true,
  -- event = "VeryLazy",
  config = function ()
    local dev = require("neodev")
    dev.setup({
      library = {
        plugin = {
          { "nvim-dap-ui" }
        },
        types = true,
      }
    })
  end
}
