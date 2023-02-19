return {
  dependencies = {
    'nvim-web-devicons'
  },
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = 'hyper', --  theme is doom and hyper default is hyper
      config = {},    --  config used for theme
    })
  end
}
