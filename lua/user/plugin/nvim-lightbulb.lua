use {
  'kosayoda/nvim-lightbulb',
  requires = 'antoinemadec/FixCursorHold.nvim',
  after = 'nvim-lspconfig',
  config = function ()
    require('nvim-lightbulb').setup {
      virtual_text = {
        enabled = false,
      },
      status_text = {
        enabled = false,
      },
      autocmd = {
        enabled = true
      }
    }
  end,
}