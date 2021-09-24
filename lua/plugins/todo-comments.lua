-- folke/todo-comments.nvim

local M = {}

local function keymap()
  require('which-key').register({
    ['<Leader>c'] = {
      name = 'Comments Todo',
      ['l'] = {'<Cmd>TodoLocList<CR>', 'Todo Location List'},
      ['q'] = {'<Cmd>TodoQuickFix<CR>', 'Todo Quickfix'},
    },
    ['<Leader>fc'] = {'<Cmd>TodoTelescope<CR>', 'Search Comment Todo'}
  })
end

function M.setup()
  keymap()
end

return M
