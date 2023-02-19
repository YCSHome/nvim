return {
  lazy = true,
  ft = {"c", "cpp", "lua"},
  dependencies = {
    -- 美化
    "lspkind.nvim",
    "lspsaga.nvim",
    -- lsp 配置
    "nvim-lspconfig",
    -- 片段，以及片段源
    "LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- 一些souces
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    -- 设置补全窗口半透明
    vim.cmd("set pumblend=15")
    vim.cmd("hi PmenuSel blend = 0")

    -- 这里的setup是针对缓冲区的补全
    cmp.setup({

      -- 这是必须的，因为有些补全需要
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      -- 设置快捷键，我copy了一下代码
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- 选取下一个/上一个元素
        ["<C-j>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-k>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      formatting = {
        format = lspkind.cmp_format({
          with_text = true, -- do not show text alongside icons
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          before = function (entry, vim_item)
            -- Source 显示提示来源
            vim_item.menu = "["..string.upper(entry.source.name).."]"
            return vim_item
          end
        })
      },

      -- 使用边框
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- ghost 文本
      experimental  = {
        ghost_text = true,
      },

      -- 确定补全来源
      -- 使用之前至少要搞明白自己只需要哪些来源
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer'},
        { name = 'path'  },
        -- 我认为 luasnip 可能会更好用一点，毕竟是纯lua
        { name = 'luasnip' },
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      })
    })

    -- 针对cmdline的补全
    cmp.setup.cmdline( {":", "/", "?"},
    {
      mapping = cmp.mapping.preset.cmdline(),
      -- 这些来源都是可以用的
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmeline" },
        { name = "buffer" },
--      }, {
        { name = "buffer" },
        { name = "cmdline" },
      })
    })
  end
}
