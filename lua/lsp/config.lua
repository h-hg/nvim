local M = {}
function M.on_attach(client, bufnr)
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  require "lsp_signature".on_attach({}, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  
  -- Mappings.
  require('which-key').register({
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    ['<Space>e'] = {vim.diagnostic.open_float, 'Open Diagnostic'},
    ['[d'] = {vim.diagnostic.goto_prev, 'Prev diagnostic'},
    [']d'] = {vim.diagnostic.goto_next, 'Next diagnostic'},
    ['<Space>q'] = {vim.diagnostic.setloclist, 'Diagnostic Setloclist'},

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    ['gD'] = {vim.lsp.buf.declaration, 'Goto Declaration'},
    ['gd'] = {vim.lsp.buf.definition, 'Goto Definition'},
    -- ['pd'] = {'<Cmd>Lspsaga preview_definition<CR>', 'Preview Definition'},
    ['gr'] = {vim.lsp.buf.references, 'Goto Reference'},
    ['<Space>D'] = {vim.lsp.buf.type_definition, 'Goto Type Definition'},
    ['K'] = {vim.lsp.buf.hover, 'LSP Hover'},
    -- ['K'] = {'<Cmd>Lspsaga hover_doc<CR>', 'LSP Hover'},
    ['<C-f>'] = {"<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", 'Lspsaga scroll down'},
    ['<C-b>'] = {"<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", 'Lspsaga scroll up'},
    ['gi'] = {vim.lsp.buf.implementation, 'Goto Implementation'},
    ['<C-k>'] = { vim.lsp.buf.signature_help, 'Signature Help'},
    -- ['<C-k>'] = {'<Cmd>Lspsaga signature_help<CR>', 'Signature Help'},
    ['<Space>wa'] = {vim.lsp.buf.add_workspace_folder, 'LSP Add Workspace'},
    ['<Space>wr'] = {vim.lsp.buf.remove_workspace_folder, 'LSP Remove Workspace'},
    ['<Space>wl'] = {function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'LSP List Workspace'},
    ['<Space>ca'] = {vim.lsp.buf.code_action, 'Code Action'},
    -- ['<Space>ca'] = {'<Cmd>Lspsaga code_action<CR>', 'Code Action'},
    ['<Space>rn'] = {vim.lsp.buf.rename, 'Rename'},
    -- ['<Space>rn'] = {'<Cmd>Lspsaga rename<CR>', 'Rename'},
    ['<Space>f'] = {vim.lsp.buf.formatting, 'LSP Format'},
  }, {
    buffer = bufnr
  })
end

M.flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Add additional capabilities supported by nvim-cmp
M.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities());
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

return M
