-- alpah
lvim.builtin.alpha.active = false
require('user.plugin.list')
require('user.plugin.cmp')
require('user.plugin.telescope')

-- nvim-neoclip
lvim.builtin.which_key.mappings['s+'] = { '<Cmd>Telescope neoclip plus<CR>', 'System Clipboard' }

-- symbols-outline.nvim
lvim.builtin.which_key.mappings['o'] = { '<Cmd>SymbolsOutline<CR>', 'Outline' }

-- nvim-spectre
lvim.builtin.which_key.mappings['H'] = {
  name = 'Find & Replace',
  ['w'] = { "<Cmd>lua require('spectre').open()<CR>", 'Replace in Workspace' },
  ['f'] = { "<Cmd>viw:lua require('spectre').open_file_search()", 'Replace in Current File' },
  ['c'] = { "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>", 'Replace Current Word' },
}
lvim.builtin.which_key.vmappings['H'] = { "<Cmd>lua require('spectre').open_visual()<CR>", 'Replace Current Word' }
