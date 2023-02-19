return {
  config = function()
    require("mason-lspconfig").setup({
      -- 自动安装
      automatic_installation = true,
      -- 保证安装的东西
      ensure_installed = {
        "clangd",
        "pyright",
        "lua_ls",
      },
    })
  end
}
