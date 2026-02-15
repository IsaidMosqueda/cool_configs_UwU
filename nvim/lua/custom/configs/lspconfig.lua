local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

vim.lsp.config["pyright"] = {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}
vim.lsp.enable("pyright")

vim.lsp.config["ruff"] = {}
vim.lsp.enable("ruff")
