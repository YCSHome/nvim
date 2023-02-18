return {
  opt = true,
  config = function()
    require("packer").loader("cmp-nvim-lsp")

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
