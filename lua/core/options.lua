local global = require('core.global')


local function load_options()
  local opt = vim.opt
  -- vision
  opt.title = false
  opt.ruler = true       -- show row number and column number
  opt.showmode = true    -- show mode
  opt.showcmd = true     -- show command in the last line of the screen
  opt.cul = true         -- highlight current row
  opt.cuc = true         -- highlight current column
  opt.wrap = false
  opt.sm = true          -- showmatch, brackets match
  opt.matchtime = 2      -- How many tenths of a second to blink when matching brackets
  opt.errorbells = false -- close error bells
  opt.visualbell = true  -- use visual bell instead of beeing
  opt.wildmode = 'list:longest'
  opt.wildignorecase = true
  opt.wildignore = {
    '*.aux',
    '*.out',
    '*.o',
    '*.so',
    '*.exe',
    '*.obj',
    '*.dll',
    '*.class',
    '*.swp',
    '*.lock',
    '.DS_Store'
  }
  -- line number
  opt.nu = true          -- show line number
  opt.rnu = true         -- use relative number in order to use nj, nk to jump
  vim.cmd[[
    augroup LineNumber
      au FocusLost * :set nornu nu    " relative number when vim lost focus
      au FocusGained * :set rnu       " absolute line number when vim gain focus
      au InsertEnter * :set nornu nu  " absolute number when in INSERT mode
      au InsertLeave * :set rnu       " relative number when in other mode
    augroup END
  ]]
  -- theme
  opt.background = 'dark'
  opt.termguicolors = true
  -- fold
  opt.foldlevelstart = 99
  -- control characters
  opt.list = true
  opt.listchars = {
    eol = '↲',
    extends = '»',
    nbsp = '␣',
    precedes = '«',
    space = '·',
    tab = '>-',
    trail = '~',
  }
  -- tab
  opt.smartindent = true
  opt.smarttab = true
  opt.tabstop = 2      -- tab size on the vision
  opt.softtabstop = 2  -- tab size of 'pressing tab' in the INSERT mode
  opt.expandtab = true -- replace tab with space
  opt.shiftwidth = 2   -- tab size of '<<' and '>>' in the NORMAL mode
  -- search
  opt.hls = true
  opt.ignorecase = true
  opt.smartcase = true
  opt.incsearch = true
  vim.opt.wrapscan = true -- Searches wrap around the end of the file
  -- device
  opt.mouse = 'a'
  opt.mousefocus = true
  opt.clipboard = { 'unnamedplus' } -- use system's clipboard
  opt.timeout = true
  opt.ttimeout = true
  opt.timeoutlen = 500
  opt.ttimeoutlen = 10
  opt.updatetime = 300
  opt.redrawtime = 1500
  -- encoding
  opt.encoding = 'utf-8'
  opt.fileencodings = {
    'ucs-bom',
    'utf-8',
    'gb2312',
    'gbk',
    'cp936',
    'gb18030',
    'big5',
    'euc-jp',
    'latin-1'
  }
  opt.fileencoding = 'utf-8'
  -- eol
  opt.fileformats = {
    'unix',
    'mac',
    'dos'
  }
  opt.fileformat = 'unix'

end

load_options()
