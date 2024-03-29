return {
  lazy = true,
  ft = {"cpp", "lua", "c"},
  dependencies = {
    "cmp-nvim-lsp",
    -- "mason-lspconfig.nvim",
    -- 美化
    "lspsaga.nvim",
    "trouble.nvim",
    "lsp-colors.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp = require("lspconfig")

    lsp.clangd.setup({
      cmd = {
        "clangd",
      },
      capabilities = capabilities,
    })

    lsp.pyright.setup({
      capabilities = capabilities,
    })

    lsp.lua_ls.setup({
      Lua = {
        worksapce = {
          library = {
            "/usr/share/nvim/runtime/lua/",
            "/usr/share/nvim/runtime/lua/vim/",
          }
        },
        diagnostics = {
          globals = {
            "vim"
          },
        },
      },
      settings = {
        Lua = {
          worksapce = {
            library = "/usr/share/nvim/runtime/lua/",
          },
          diagnostics = {
            globals = {
              "vim"
            },
          },
        },
      },
      capabilities = capabilities,
    })
  end
}
