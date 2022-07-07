vim.opt.guifont = {
  'JetBrainsMono Nerd Font Mono:h16',
  -- windows
  'Consolas:h16',
}

local guiClient = os.getenv('NVIM_GUI')
if guiClient == 'neovide' then
  require('user.gui.neovide')
end