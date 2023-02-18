return {
  opt = false,
  config = function()
    vim.api.nvim_cmd({cmd = "colorscheme", args = {"nightfox"}}, {})
  end
}
