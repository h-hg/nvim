-- akinsho/nvim-bufferline.lua

local M = {}

function M.config()
  require('bufferline').setup {
    options = {
      numbers = 'ordinal',
      offsets = {
        {
          filetype = 'NvimTree',
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = 'Directory',
          text_align = 'center'
        }
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      separator_style = 'thin',
      always_show_bufferline = false,
    }
  }
end

local function keymap()
  local wk = require('which-key')
  wk.register({
    ['b'] = {
      name = 'Buffer',
      ['<Tab>'] = {'<Cmd>BufferLineCycleNext<CR>','Buffer switch Next'},
      ['<S-Tab>'] = {'<Cmd>BufferLineCyclePrev<CR>','Buffer switch Prev'},
      ['1'] = {'<Cmd>BufferLineGoToBuffer 1<CR>', 'Buffer switch 1'},
      ['2'] = {'<Cmd>BufferLineGoToBuffer 2<CR>', 'Buffer switch 2'},
      ['3'] = {'<Cmd>BufferLineGoToBuffer 3<CR>', 'Buffer switch 3'},
      ['4'] = {'<Cmd>BufferLineGoToBuffer 4<CR>', 'Buffer switch 4'},
      ['5'] = {'<Cmd>BufferLineGoToBuffer 5<CR>', 'Buffer switch 5'},
      ['6'] = {'<Cmd>BufferLineGoToBuffer 6<CR>', 'Buffer switch 6'},
      ['7'] = {'<Cmd>BufferLineGoToBuffer 7<CR>', 'Buffer switch 7'},
      ['8'] = {'<Cmd>BufferLineGoToBuffer 8<CR>', 'Buffer switch 8'},
      ['9'] = {'<Cmd>BufferLineGoToBuffer 9<CR>', 'Buffer switch 9'},
      ['h'] = {'<Cmd>BufferLineMovePrev<CR>', 'Buffer Move Prev'},
      ['l'] = {'<Cmd>BufferLineMoveNext<CR>', 'Buffer Move Next'},
      ['e'] = {'<Cmd>BufferLineSortByExtension<CR>', 'Buffer Sort by Extension'},
      ['d'] = {'<Cmd>BufferLineSortByDirectory<CR>', 'Buffer Sort by Directory'},
      ['c'] = {'<Cmd>BufferLinePickClose<CR>', 'Buffer Pick Close'},
      ['p'] = {'<Cmd>BufferLinePick<CR>', 'Buffer Pick'},
    }
  })
end

function M.setup()
  keymap()
end

-- set always_show_bufferline to false and the followed code is no needed.
-- don't show bufferline on dashboard
-- vim.cmd('autocmd FileType dashboard setlocal showtabline=0 | autocmd WinLeave <buffer> set showtabline=2')

return M
