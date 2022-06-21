-- lsp server list, see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local nvim_lsp = require('lspconfig')

local cfg = require('lsp.config')

local servers = {
  'bashls', -- bash
  'cssls', -- css
  'dockerls', -- docker
  'html', -- html
  'jsonls', -- json
  'sumneko_lua', -- lua
  'sqls', -- sql
  'taplo', -- toml
  'tsserver', -- typescript
  'vimls', -- vim
  'lemminx', -- xml
  'yamlls', -- yaml
}

for _, name in pairs(servers) do
  nvim_lsp[name].setup {
    on_attach = cfg.on_attach,
    capabilities = cfg.capabilities,
    flags = cfg.flags
  }
end

-- c, cpp, objective-c
nvim_lsp.clangd.setup {
  cmd = { 'clangd', '--background-index' },
  on_attach = cfg.on_attach,
  capabilities = cfg.capabilities,
  flags = cfg.flags
}

-- python
-- TODO: module os is not accesible
nvim_lsp.pyright.setup {
  -- cmd = { 'pyright-langserver', '--stdio' },
  on_attach = cfg.on_attach,
  capabilities = cfg.capabilities,
  flags = cfg.flags
}

nvim_lsp.texlab.setup {
  on_attach = cfg.on_attach,
  capabilities = cfg.capabilities,
  flags = cfg.flags
}