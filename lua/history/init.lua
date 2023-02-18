-- 插件配置

local pack = {}

-- 放置插件的配置文件
pack.config = "pack.config"

pack.list = {
  -- core
  "wbthomason/packer.nvim",

  -- theme
  "morhetz/gruvbox",
  "EdenEast/nightfox.nvim",

  -- wakatime
  "wakatime/vim-wakatime",

  "nvim-tree/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "nvim-treesitter/nvim-treesitter",

  -- 彩虹括号🌈
  "HiPhish/nvim-ts-rainbow2",

  -- snip片段，nvim-cmp必须要的
  "L3MON4D3/LuaSnip",
  --nvim cmp
  "hrsh7th/nvim-cmp",
  -- 优化nvim cmp 的外观
  "onsails/lspkind.nvim",
  -- nvim cmp 需要的 sources
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",

  -- lsp
  "neovim/nvim-lspconfig",
  -- 优化lsp外观和一些使用
  "glepnir/lspsaga.nvim",
}

return pack
