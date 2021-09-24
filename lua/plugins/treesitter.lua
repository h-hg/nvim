local treesitter = require('nvim-treesitter.configs')

vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

treesitter.setup{
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
}
