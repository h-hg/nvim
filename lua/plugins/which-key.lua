
local M = {}

local function keymap()
  local wk = require('which-key')
  wk.register({
    -- bufer
    ['b'] = {
      name = 'Buffer',
      ['s'] = {'<Cmd>w<CR>','Buffer Save'},
    }
  })
  wk.register({
    -- system clipboard in normal mode
    ['<Leader>y'] = {'"+y','Clipboard Copy'},
    ['<Leader>d'] = {'"+d','Clipboard Cut'},
    ['<Leader>p'] = {'"+p','Clipboard Paste(p)'},
    ['<Leader>P'] = {'"+P','Clipboard Paste(P)'},
  }, {
    mode = 'n',
    silent = false,
    noremap = false,
  })
  wk.register({
    -- system clipboard in visual mode
    ['<Leader>y'] = {'"+y','Clipboard Copy'},
    ['<Leader>d'] = {'"+d','Clipboard Cut'},
    ['<Leader>p'] = {'"+p','Clipboard Paste(p)'},
    ['<Leader>P'] = {'"+P','Clipboard Paste(P)'},
  }, {
    mode = 'v',
    silent = false,
    noremap = false,
  })
  wk.register({
    -- indentation
    ['<'] = {'<gv', 'Indent'},
    ['>'] = {'>gv', 'Anti-indent'},
  }, {
    mode = 'v'
  })
  wk.register({
    -- emacs shortcut in Insert mode
    ['<C-a>'] = {'<Home>', 'Home'},
    ['<C-e>'] = {'<End>', 'End'},
    ['<C-d>'] = {'<Del>', 'Del'},
    ['<C-_>'] = {'<C-k>', ''},
  }, {
    mode = 'i'
  })
  wk.register({
    -- move command mode
    ['<C-h>'] = {'<Left>', 'Left'},
    ['<C-j>'] = {'<Down>', 'Down'},
    ['<C-k>'] = {'<Up>', 'Up'},
    ['<C-l>'] = {'<Right>', 'Right'},
  }, {
    mode = 'c'
  })
  -- terminal
  -- see https://github.com/folke/which-key.nvim/issues/125
  local t = function (str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  wk.register({
    ['<Leader>tt'] = { '<Cmd>term<CR>', 'Term Window'},
    ['<Leader>tb'] = { '<Cmd>bo sp<Bar>resize<Space>10<Bar>term<CR>', 'Term Bottom'},
    ['<Leader>tr'] = { '<Cmd>vert bo sp<Bar>term<CR>', 'Term Right'},
    ['<Esc>'] = { t([[<C-\><C-n>]]), '', mode = 't'},
    ['<C-w>h'] = { t([[<C-\><C-n><C-W>h]]), 'Pane Left', mode = 't'},
    ['<C-w>j'] = { t([[<C-\><C-n><C-W>j]]), 'Pane Down', mode = 't'},
    ['<C-w>k'] = { t([[<C-\><C-n><C-W>k]]), 'Pane Up', mode = 't'},
    ['<C-w>l'] = { t([[<C-\><C-n><C-W>l]]), 'Pane Right', mode = 't'},
  })
  vim.cmd[[
    augroup Term
      au TermOpen term://* startinsert
      au TermClose term://* call feedkeys('i')
    augroup END
  ]]
end

function M.setup()
  keymap()
end

return M
