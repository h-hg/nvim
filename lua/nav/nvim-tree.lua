-- kyazdani42/nvim-tree.lua
local vim = vim
local M = {}

function M.config()
  vim.g.nvim_tree_ignore = {
    '.git',
    'node_modules',
    '.cache',
    '.vscode',
    '.idea'
  }
  vim.g.nvim_tree_auto_open = 1 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
  vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
  vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
  vim.g.nvim_tree_quit_on_open = 0 -- 0 by default, closes the tree when you open a file
  vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
  vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
  vim.g.nvim_tree_group_empty = 0 -- ' 0 by default, compact folders that only contain a single folder into one node in the file tree
  vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
  vim.g.nvim_tree_tab_open = 1 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
  vim.g.nvim_tree_width_allow_resize  = 1 -- 0 by default, will not resize the tree when opening a file
  vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
      'packer',
      'qf'
    },
    buftype = {
      'terminal'
    }
  }
  -- ' Dictionary of buffer option names mapped to a list of option values that
  -- ' indicates to the window picker that the buffer's window should not be
  -- ' selectable.
  vim.g.nvim_tree_special_files = {
    'README.md',
    'Makefile',
    'MAKEFILE',
  }
  -- ' List of filenames that gets highlighted with NvimTreeSpecialFile
  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrow = 1,
  }
  
  -- ' a list of groups can be found at `:help nvim_tree_highlight`
  -- highlight NvimTreeFolderIcon guibg=blue
  require('nvim-tree').setup()
end

local function keymap()
  local wk = require('which-key')
  wk.register({
    ['<Leader>b'] = { '<Cmd>NvimTreeToggle<CR>', 'Explorer Toggle' },
    ['<Leader>l'] = { '<Cmd>NvimTreeFindFile<CR>', 'Explorer Locate' },
  })
end

function M.setup()
  keymap()
end

return M
