-- folke/trouble.nvim

local M = {}

local function keymap()
  require('which-key').register({
    ['<Leader>x'] = {
      name = 'LSP Trouble',
      ['x'] = {'<Cmd>TroubleToggle<CR>','Trouble Toggle'},
      ['w'] = {'<Cmd>TroubleToggle lsp_workspace_diagnostics<CR>', 'Trouble Document Diagnostics'},
      ['d'] = {'<Cmd>TroubleToggle lsp_document_diagnostics<CR>', 'Trouble Workspace Diagnostics'},
      ['l'] = {'<Cmd>TroubleToggle loclist<CR>', 'Trouble Location List'},
      ['q'] = {'<Cmd>TroubleToggle quickfix<CR>', 'Trouble Quickfix'},
    },
    ['gR'] = { '<Cmd>TroubleToggle lsp_references<CR>', 'Trouble Reference'},
  })
end

function M.setup()
  keymap()
end

return M

