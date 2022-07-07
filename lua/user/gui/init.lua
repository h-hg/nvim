vim.opt.guifont = {
  'JetBrainsMono Nerd Font Mono:h14',
  -- windows
  -- 'Consolas:h14',
}

local guiClient = os.getenv('NVIM_GUI')
if guiClient == 'neovide' then
  require('user.gui.neovide')
end