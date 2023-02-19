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
  ["HiPhish/nvim-ts-rainbow2"] = { lazy = true },
  -- Tresitter，很重要的高亮
  ["nvim-treesitter/nvim-treesitter"] = config("nvim-treesitter"),

  -- wakatime
  ["wakatime/vim-wakatime"] = config("wakatime"),
  -- 按键提醒
  ["folke/which-key.nvim"] = config("which-key"),

  -- 优化nvim-cmp的外观
  ["onsails/lspkind.nvim"] = config("lspkind"),
  -- 补全插件
  ["hrsh7th/nvim-cmp"] = config("nvim-cmp"),
  -- lua片段
  ["L3MON4D3/LuaSnip"] = config("LuaSnip"),

  -- 优化 lsp 外观
  ["glepnir/lspsaga.nvim"] = config("lspsaga"),

  -- 虽然我不喜欢让它负责调教 lsp 和 dap，但是它真的太香了
  ["williamboman/mason.nvim"] = config("mason"),
  -- 用来配置部分 mason 的配置
  ["williamboman/mason-lspconfig.nvim"] = config("mason-lspconfig"),
  -- lsp 配置
  ["neovim/nvim-lspconfig"] = config("lspconfig"),

  -- markdown 预览
  ["davidgranstrom/nvim-markdown-preview"] = config("markdown-preview")
}
