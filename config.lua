-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = 'github_dark'
lvim.line_wrap_cursor_movement = true
lvim.lsp.automatic_servers_installation = true

require('user.options')
require('user.keymap')
require('user.builtin')
require('user.plugin')
require('user.formatter')
require('user.linter')

if os.getenv 'NVIM_GUI' then
  require('user.gui')
end