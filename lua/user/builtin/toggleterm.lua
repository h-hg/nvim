local Terminal = require('toggleterm.terminal').Terminal

lvim.builtin.terminal.size = function(term)
  if term.direction == 'horizontal' then
    return math.min(vim.o.lines * 0.3, 15)
  elseif term.direction == 'vertical' then
    return vim.o.columns * 0.4
  end
end

-- Floating terminal
local fterm = Terminal:new({
  direction = 'float',
})
-- Horizontal terminal
local hterm = Terminal:new({
  direction = 'horizontal',
})
-- Vertical terminal
local vterm = Terminal:new({
  direction = 'vertical',
})
-- Window terminal
local wterm = Terminal:new({
  direction = 'tab',
})

lvim.builtin.which_key.mappings['t']  = {
  name = 'Terminal',
  ['f'] = {function ()
    fterm:toggle()
  end,'ToggleTerm Float'},
  ['h'] = {function ()
    hterm:toggle()
  end, 'ToggleTerm Horizon'},
  ['v'] = {function ()
    vterm:toggle()
  end, 'TTerm Vertical'},
  ['t'] = {function ()
    wterm:toggle()
  end, 'ToggleTerm Tab'},
}

