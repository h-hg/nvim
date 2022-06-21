-- nvim-telescope/telescope.nvim

local M = {}

function M.config()
  local actions = require('telescope.actions')
  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous
        }
      }
    }
  }
end

local function keymap()
  local wk = require('which-key')
  wk.register({
    ['<Leader>f'] = {
      name = 'Search',
      -- file Pickers
      ['f'] = {'<Cmd>Telescope find_files<CR>','Search Files'},
      ['l'] = {'<cmd>Telescope live_grep<CR>', 'Search String'},
      -- vim picker
      ['b'] = {'<Cmd>Telescope buffers<CR>', 'Search Buffer'},
      ['r'] = {'<Cmd>Telescope registers<CR>', 'Search Registers'},
      ['h'] = {'<Cmd>Telescope help_tags<CR>', 'Search Help'},
    },
    ['<Leader>fg'] = {
      name = 'Git',
      -- git picker
      ['c'] = {'<cmd>Telescope git_commits<CR>', 'Git Commits'},
      ['b'] = {'<cmd>Telescope git_bcommits<CR>', 'Git BCommmit'},
      ['s'] = {'<cmd>Telescope git_status<CR>', 'Git Status'},
    }
  })
end

function M.setup()
  keymap()
end

return M