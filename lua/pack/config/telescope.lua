return {
  lazy = true,
  tag = '0.1.1',
  dependencies = {
    'plenary.nvim'
  },
  module = true,
  config = function()
    -- local builtin = require('telescope.builtin')
    -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    -- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
