require('indent_blankline').setup {
  filetype_exclude = {
    'startify',
    'dashboard',
    'dotooagenda',
    'log',
    'fugitive',
    'gitcommit',
    'packer',
    'vimwiki',
    'markdown',
    'json',
    'txt',
    'vista',
    'help',
    'todoist',
    'NvimTree',
    'peekaboo',
    'git',
    'TelescopePrompt',
    'undotree',
    'flutterToolsOutline',
    '' -- for all buffers without a file type
  },
  buftype_exclude = {
    'terminal',
    'nofile'
  },
  context_patterns = {
    'class',
    'function',
    'method',
    'block',
    'list_literal',
    'selector',
    '^if',
    '^table',
    'if_statement',
    'while',
    'for'
  }
}
-- because lazy load indent-blankline so need readd this autocmd
-- vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')