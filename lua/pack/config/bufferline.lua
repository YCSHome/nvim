return {
  dependencies = "nvim-tree/nvim-web-devicons",
  version = "*",
  lazy = true,
  event = "VeryLazy",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup{
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }
        }
      },
    }
    vim.api.nvim_set_keymap("n", "<tab>", ":BufferLineCycleNext<CR>", {noremap = false, silent = true})
    vim.api.nvim_set_keymap("n", "<S-tab>", ":BufferLineCyclePrev<CR>", {noremap = false, silent = true})
  end
}
