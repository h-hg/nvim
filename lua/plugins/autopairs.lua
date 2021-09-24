-- windwp/nvim-autopairs

local npairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'

require('nvim-autopairs').setup({
  disable_filetype = { 'TelescopePrompt' , 'vim' },
})

-- you need setup cmp first put this after cmp.setup()
require('nvim-autopairs.completion.cmp').setup({
  map_cr = true,         --  map <CR> on insert mode
  map_complete = true,   -- it will auto insert `(` after select function or method item
  auto_select = true     -- automatically select the first item
})
