-- vim.o.number            = true
-- vim.o.relativenumber    = true
-- vim.o.expandtab         = true
-- vim.o.smartindent       = true
-- vim.o.autoindent        = true
-- vim.o.wrap              = false
-- vim.o.cul               = true
-- vim.o.tabstop           = 2
-- vim.o.mouse             = "a"
-- vim.o.undofile          = true
-- vim.o.shiftwidth        = 2
-- vim.o.termguicolors     = true
-- vim.o.backup            = false
-- vim.o.expandtab         = true
-- vim.o.hlsearch          = false
-- vim.o.backup            = false
-- vim.o.cinoptions        = "g0l1Ls(0"
-- vim.o.updatetime        = 1000
-- vim.o.signcolumn        = "yes"

core = require("core")

-- 加载插件
require("pack")

-- 加载自己的一些配置
require("config")

-- require("tmp")

-- 用来检查是否有packer
-- if (core.packer.bootstrap()) then
--   -- vim.api.nvim_cmd({cmd = "colorscheme", args = {"nightfox"}}, {})
--   pack = require("pack")
--   core.packer.run(pack.config, pack.list)
-- end


-- return require("packer").startup(function(use)
--   use "wbthomason/packer.nvim"
--   use "morhetz/gruvbox"
--   use "EdenEast/nightfox.nvim"
--   use {
--     "kyazdani42/nvim-tree.lua",
--     requires = {
--       "nvim-tree/nvim-web-devicons"
--     },
--     tag = "nightly" -- optional, updated every week. (see issue #1193)
--   }
--   use {
--     "nvim-treesitter/nvim-treesitter",
--     run = ":TSUpdate",
--     config = function()
--       require("nvim-treesitter.configs").setup({
--         ensure_installed = {"c", "cpp", "lua", "help"},
--         autoinstall = true,
--         highlight = {
--           enable = true
--         }
--       })
--     end
--   }
-- end)
