-- For more details, see https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization

-- Customizing how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
})
-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Completion kinds
local lspkind = require('lspkind')
local kind_icons = lspkind.presets.default
local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
  kinds[i] = kind_icons[kind] or kind
end

