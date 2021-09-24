-- famiu/bufdelete.nvim

local M = {}

local function keymap()
  local wk = require('which-key')
  wk.register({
    ['b'] = {
      name = 'Buffer',
      ['w'] = {'<Cmd>Bdelete<CR>','Buffer Close'},
      ['q'] = {'<Cmd>Bdelete!<CR>','Buffer Discard'},
    }
  })
end

function M.setup()
  keymap()
end

return M