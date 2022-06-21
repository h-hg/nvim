-- akinsho/nvim-toggleterm.lua

-- Please ensure you have set hidden in your neovim config, otherwise the terminals will be discarded when closed.
vim.o.hidden = true

require('toggleterm').setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  -- open_mapping = [[<c-\>]],
  hide_numbers = false, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = 'curved',
    -- width = <value>,
    -- height = <value>,
    winblend = 3,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    }
  }
}
local Terminal = require('toggleterm.terminal').Terminal

-- Floating terminal
local fterm = Terminal:new({
  direction = 'float'
})
function _Fterm_toggle()
  fterm:toggle()
end

-- Horizontal terminal
local hterm = Terminal:new({
  direction = 'horizontal'
})
function _Hterm_toggle()
  hterm:toggle()
end

-- Vertical terminal
local vterm = Terminal:new({
  direction = 'vertical'
})
function _Vterm_toggle()
  vterm:toggle()
end

-- Window terminal
local wterm = Terminal:new({
  direction = 'window'
})
function _Wterm_toggle()
  wterm:toggle()
end

local wk = require('which-key')
wk.register({
  ['<Leader>t'] = {
    name = 'Terminal',
    ['f'] = {'<Cmd>lua _Fterm_toggle()<CR>','TTerm Float'},
    ['h'] = {'<Cmd>lua _Hterm_toggle()<CR>', 'TTerm Horizon'},
    ['v'] = {'<Cmd>lua _Vterm_toggle()<CR>', 'TTerm Vertical'},
    ['w'] = {'<Cmd>lua _Vterm_toggle()<CR>', 'TTerminal Windows'},
  },
})
