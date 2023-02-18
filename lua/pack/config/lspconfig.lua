return {
  lazy = true,
  dependencies = {
    "cmp-nvim-lsp",
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
  end
}
