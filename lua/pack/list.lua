local function config(pack_name)
  return require("pack.config."..pack_name)
end

return {
  -- theme
  ["EdenEast/nightfox.nvim"] = {
    config = function()
      vim.cmd.colorscheme("nightfox")
    end
  },
  ["morhetz/gruvbox"] = { lazy = true },

  -- 启动页面
  ["glepnir/dashboard-nvim"] = config("dashboard"),

  -- noice，优化一些奇奇怪怪的东西
  ["folke/noice.nvim"] = config("noice-nvim"),
  ["MunifTanjim/nui.nvim"] = { lazy = true },
  ["rcarriga/nvim-notify"] = { lazy = true },

  -- nvim tree，好用的小东西
  ["nvim-tree/nvim-web-devicons"] = config("nvim-web-devicons"),
  ["kyazdani42/nvim-tree.lua"] = config("nvim-tree"),

  -- 为Treesitter 提供彩虹括号
  ["p00f/nvim-ts-rainbow"] = { lazy = true },
  -- Tresitter，很重要的高亮
  ["nvim-treesitter/nvim-treesitter"] = config("nvim-treesitter"),

  -- wakatime
  ["wakatime/vim-wakatime"] = config("wakatime"),
  -- 按键提醒
  -- ["folke/which-key.nvim"] = config("which-key"),

  -- 优化nvim-cmp的外观
  ["onsails/lspkind.nvim"] = config("lspkind"),
  -- 补全插件
  ["hrsh7th/nvim-cmp"] = config("nvim-cmp"),
  -- lua片段
  ["L3MON4D3/LuaSnip"] = config("LuaSnip"),

  -- 虽然我不喜欢让它负责调教 lsp 和 dap，但是它真的太香了
  ["williamboman/mason.nvim"] = config("mason"),
  -- 用来配置部分 mason 的配置
  -- 但是玩意太慢了
  ["williamboman/mason-lspconfig.nvim"] = config("mason-lspconfig"),
  -- lsp 配置
  ["neovim/nvim-lspconfig"] = config("lspconfig"),

  -- 优化 lsp 外观
  ["glepnir/lspsaga.nvim"] = config("lspsaga"),

  -- markdown 预览
  -- ["davidgranstrom/nvim-markdown-preview"] = config("markdown-preview"), -- 这个有显著bug
  ["euclio/vim-markdown-composer"] = config("markdown-preview"),

  -- 显示当前buffer的函数定义
  ["simrat39/symbols-outline.nvim"] = config("outline"),

  -- 用来管理内置终端
  ["akinsho/toggleterm.nvim"] = config("term"),

  -- 我也不知道干啥用的
  ["folke/neodev.nvim"] = config("neodev-nvim"),
  -- 调试功能
  ["mfussenegger/nvim-dap"] = config("dap"),
  -- dap的UI界面
  ["rcarriga/nvim-dap-ui"] = config("dap-ui"),

  -- 状态栏
  ["nvim-lualine/lualine.nvim"] = config("line"),

  ["folke/trouble.nvim"] = config("trouble-nvim"),
}
