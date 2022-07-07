local formatters = require 'lvim.lsp.null-ls.formatters'
formatters.setup {
  {
    exe = 'prettier',
    filetypes = { 'javascript' },
    args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
  },
  {
    exe = 'prettier',
    filetypes = { 'javascriptreact' },
    args = { '--no-semi', '--single-quote', '--jsx-bracket-same-line', '--jsx-single-quote' },
  },
  {
    exe = 'prettier',
    filetypes = { 'typescript', 'typescriptreact' },
    args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
  },
  {
    exe = 'prettier',
    filetypes = {'json', 'yaml'}
  },
  {
    exe = 'prettier',
    filetypes = {'html'}
  },
  {
    exe = 'prettier',
    filetypes = {'css', 'less', 'scss'}
  },
  {
    exe = 'prettier',
    filetypes = { 'markdown' },
  },
  {
    exe = 'prettier',
    filetypes = {'solidity'}
  },
  {
    exe = 'gofmt',
    filetypes = { 'go' },
  },
  {
    exe = 'black',
    filetypes = { 'python' },
  },

  {
    exe = 'stylua',
    filetypes = { 'lua' }
  },
  {
    exe = 'shfmt',
    filetypes = { 'sh' },
    extra_args = { '-i', '2' }
  },
  {
    exe = 'cmake_format',
    filetypes = { 'cmake' },
  },
}
