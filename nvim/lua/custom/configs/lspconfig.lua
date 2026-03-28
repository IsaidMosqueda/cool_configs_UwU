local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})
vim.lsp.enable("pyright")

-- C / C++ / CUDA (.cu → filetype `cuda`); clangd uses compile_commands.json when present
vim.lsp.config("clangd", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable("clangd")

vim.lsp.enable("ruff")
