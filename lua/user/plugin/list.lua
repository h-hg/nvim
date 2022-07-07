lvim.plugins = {
  {
    'projekt0n/github-nvim-theme',
  },
  {
    'Mofiqul/vscode.nvim',
    config = function ()
      vim.g.vscode_italic_comment = 1
      -- Disable nvim-tree background color
      vim.g.vscode_disable_nvimtree_bg = true
    end
  },
  {
    -- underline the same words
    'xiyaowong/nvim-cursorword',
    opt = true,
    -- event = 'VimEnter',
  },
  {
    -- switch to english input automatically when changing to Normal mode
    'h-hg/fcitx.nvim',
    event = 'BufWinEnter',
  },
  {
    -- a clipboard manager for neovim
    'AckslD/nvim-neoclip.lua',
    requires = { 'tami5/sqlite.lua', module = 'sqlite' },
    after = 'telescope.nvim',
    config = function()
      require('neoclip').setup()
    end,
  },
  {
    -- indent line
    'lukas-reineke/indent-blankline.nvim',
    event = {
      'BufReadPre',
      'BufNewFile'
    },
    config = function()
      require('user.plugin.indent-blankline')
    end,
  },
  {
    -- smooth window scroll
    'karb94/neoscroll.nvim',
    opt = true,
    -- cmd = 'WinScrolled',
    config = function()
      require('neoscroll').setup()
    end,
  },
  {
    -- window shift
    'sindrets/winshift.nvim',
    cmd = 'WinShift',
    setup = function()
      local opts = {silent = true, noremap = true}
      vim.keymap.set('n', '<C-w>m', '<Cmd>WinShift<CR>', vim.tbl_extend('force', opts, {desc = 'Shift Window'}))
      vim.keymap.set('n', '<C-w>X', '<Cmd>WinShift swap<CR>', vim.tbl_extend('force', opts, {desc = 'Swap Window'}))
    end,
    config = function()
      require('winshift').setup {
        keymaps = {
          disable_defaults = false
        }
      }
    end,
  },
  {
    -- shade window: dim unactive window when enter a new window
    'sunjon/shade.nvim',
    event = 'VimEnter',
    setup = function()
      vim.keymap.set('n', '<C-w>m', "<Cmd>lua require('shade').toggle()<CR>", {
        silent = true,
        noremap = true,
        desc = 'Toggle Shade'
     })
    end,
    config = function()
      require('shade').setup {}
    end
  },
  {
    -- pick window
    's1n7ax/nvim-window-picker',
    event = 'VimEnter',
    step = function ()
      local opt = {silent = true, noremap = true}
      vim.keymap.set('n', '<C-w>g', function ()
        local winId = require('window-picker').pick_window()
        if winId ~= nil then
          vim.win_gotoid(winId)
        end
      end, vim.tbl_extend('force', opt, {desc = 'Pick and Goto Window'}))
      vim.keymap.set('n', '<C-w>G', function ()
        local winId = require('window-picker').pick_window()
        if winId ~= nil then
          vim.win_execute(winId, 'close')
        end
      end, vim.tbl_extend('force', opt, {desc = 'Pick and Close Window'}))
    end,
    config = function()
      require 'window-picker'.setup()
    end,
  },
  {
    -- nvim-cmp words
    'f3fora/cmp-spell',
    after = 'nvim-cmp',
  },
  {
    -- nvim-cmp source for emoji
    'hrsh7th/cmp-emoji',
    after = 'nvim-cmp',
  },
  {
    -- nvim-cmp source for neovim command line
    'hrsh7th/cmp-cmdline',
    after = 'nvim-cmp',
  },
  {
    -- nvim-cmp source for command history
    'dmitmel/cmp-cmdline-history',
    after = 'nvim-cmp',
  },
  {
    -- nvim-cmp source for latex symbols
    'kdheepak/cmp-latex-symbols',
    after = 'nvim-cmp',
  },
  {
    -- nvim-cmp source for dictionary
    -- TODO auto find dict.txt in `dict` directory like lvim snippest
    'uga-rosa/cmp-dictionary',
    after = 'nvim-cmp',
    config = function()
      local utils = require 'lvim.utils'
      local userDict = utils.join_paths(get_config_dir(), 'snippets')
      if not utils.is_directory(userDict) then
        return
      end
      require('cmp_dictionary').setup({
        dic = {
          ["*"] = { userDict .. '/star.txt' },
        },
        exact = 2,
        first_case_insensitive = false,
        async = false,
        capacity = 5,
        debug = false,
      })
    end,
  },
  {
    -- markdown preview
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    ft = {
      'markdown'
    },
    setup = function()
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = 'markdown',
        callback = function()
          require('which-key').register({
            ['<Leader>m'] = {
              name = 'Markdown',
              ['p'] = { '<Cmd>MarkdownPreviewToggle<CR>', 'Markdown Preview' }
            }
          }, {
            buffer = 0
          })
        end,
      })
    end,
    config = function()
      -- refresh markdown when save the buffer or leave from insert mode
      vim.g.mkdp_refresh_slow = 1
    end,
  },
  {
    -- symbols outline
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
  },
  {
    -- find and replace
    'nvim-pack/nvim-spectre',
    require = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
    },
    event = {
      'VimEnter',
    },
    config = function()
      require('spectre').setup()
    end
  },
  {
    -- diff view
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'BufRead',
  },
  {
    -- hight color code
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('user.plugin.colorizer').config()
    end
  },
  {
    -- Show function signature when you type
    -- TODO Can't jump into the float windows when pressing the same keys again
    -- TODO see other's config and lunarvim recommentation
    'ray-x/lsp_signature.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require"lsp_signature".on_attach()
      -- require 'lsp_signature'.setup({
      --   bind = true, -- This is mandatory, otherwise border config won't get registered.
      --   handler_opts = {
      --     border = 'rounded'
      --   }
      -- })
    end,
  },
  {
    -- TODO List
    -- TODO
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    disable = true,
    event = 'BufWinEnter',
    setup = function ()
      -- require('user.plugin.todo-comments').setup()
    end,
    config = function()
      require('todo-comments').setup {}
    end
  },
  {
    -- TODO
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    disable = true,
    cmd = 'TroubleToggle',
    setup = function()
      require('user.plugin.trouble').setup()
    end,
  },
  {
    -- TODO
    'voldikss/vim-translator',
    disable = true,
    event = 'BufWinEnter',
    setup = function()
      require('user.plugin.translator')
    end
  },
  {
    -- Change the fontsize of GUI client
    'tenxsoydev/size-matters.nvim',
    opt = true,
  }
}
