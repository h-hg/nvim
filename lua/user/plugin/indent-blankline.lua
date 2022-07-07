require('indent_blankline').setup {
  show_end_of_line = true,
  space_char_blankline = ' ',
  show_trailing_blankline_indent = false,
  filetype_exclude = {
    'startify', -- vim-startify
    'dashboard', -- dashboard.nvim
    'alpha', -- alpha.nvim
    'Outline', -- symbols-outline.nvim
    'fugitive', -- vim-fugitive
    'packer', -- packer.nvim
    'NvimTree', -- nvim-tree
    'TelescopePrompt', -- telescope.nvim
    'dotooagenda', -- dhruvasagar/vim-dotoo
    'vista', -- liuchengxu/vista.vim
    'todoist', -- romgrk/todoist.nvim
    'peekaboo', -- junegunn/vim-peekaboo
    'undotree', -- mbbill/undotree
    'git',
    'flutterToolsOutline',
    'gitcommit',
    '', -- for all buffers without a file type
    'log',
    'help',
    'vimwiki',
    'man',
    'checkhealth',
    'markdown',
    'json',
    'txt',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
    'quickfix',
  },
}
-- because lazy load indent-blankline so need readd this autocmd
-- vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
