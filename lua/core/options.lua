local global = require('core.global')


local function load_options()
  local global_local = {
    -- vision
    title          = false;
    ruler          = true;  -- show row number and column number
    showmode       = true;  -- show mode
    showcmd        = true;  -- show command typing?
    cul            = true;  -- highlight current row
    cuc            = true;  -- highlight current column
    wrap           = false;
    sm             = true;  -- showmatch, brackets match
    matchtime      = 2;     -- How many tenths of a second to blink when matching brackets
    errorbells     = false; -- close error bells
    visualbell     = true;  -- use visual bell instead of beeing
    nu             = true;  -- show line number
    rnu            = true;  -- use relative number in order to use nj, nk to jump
    wildmode       = 'list:longest';
    wildignorecase = true;
    wildignore     = '';
    -- theme
    background     = 'dark';
    termguicolors  = true;
    -- control characters
    list           = true;
    listchars      = 'space:·,tab:>-,nbsp:␣,trail:~,extends:»,precedes:«,eol:↲';
    -- tab
    smartindent    = true;
    smarttab       = true;
    tabstop        = 2;     -- tab size on the vision
    softtabstop    = 2;     -- tab size of 'pressing tab' in the INSERT mode
    expandtab      = true;  -- replace tab with space
    shiftwidth     = 2;     -- tab size of '<<' and '>>' in the NORMAL mode
    -- search
    hls            = true;
    ignorecase     = true;
    smartcase      = true;
    incsearch      = true;
    -- device
    mouse          = 'a';
    -- clipboard      = 'unnamedplus'; -- system clipboard
    timeout        = true;
    ttimeout       = true;
    timeoutlen     = 500;
    ttimeoutlen    = 10;
    updatetime     = 100;
    redrawtime     = 1500;
    -- encoding
    encoding       = 'utf-8';
    fileencodings  = 'ucs-bom,utf-8,gb2312,gbk,cp936,gb18030,big5,euc-jp,latin-1';
    fileencoding   = 'utf-8';
    -- eol
    fileformats    = 'unix,mac,dos';
    fileformat     = 'unix';
    -- fold
    -- nofoldenable   = true;
  }

  for name, value in pairs(global_local) do
    vim.o[name] = value
  end
  -- settings for line number
  vim.cmd[[
    augroup LineNumber
      au FocusLost * :set nornu nu    " relative number when vim lost focus
      au FocusGained * :set rnu       " absolute line number when vim gain focus
      au InsertEnter * :set nornu nu  " absolute number when in INSERT mode
      au InsertLeave * :set rnu       " relative number when in other mode
    augroup END
  ]]

end

load_options()
