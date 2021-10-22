local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- download packer.nvim
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- For which-key is used in the configuration of other plugins
vim.cmd [[packadd which-key.nvim]]

local packer = require('packer')

packer.startup({
  function(use)
    -- package manager
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use {
      'tanvirtin/monokai.nvim',
      disable = true,
      config = function()
        vim.cmd('colorscheme monokai')
      end
    }
    use {
      'folke/tokyonight.nvim',
      disable = true,
      config = function ()
        vim.cmd('colorscheme tokyonight')
      end
    }
    use {
      'projekt0n/github-nvim-theme',
      disable = false,
      config = function ()
        require('github-theme').setup()
      end
    }

    -- Navigation
    -- show keymaping
    use {
      'folke/which-key.nvim',
      -- event = 'BufWinEnter',
      config = function()
        require('which-key').setup({})
      end,
      setup = function()
        require('plugins.which-key').setup()
      end
    }
    -- status line
    use {
      -- the origin hoob3rt/lualine.nvim may not be under maintenance
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      event = 'BufWinEnter',
      config = function()
        require('plugins.lualine')
      end
    }
    -- start page
    use {
      'glepnir/dashboard-nvim',
      event = 'BufWinEnter',
      config = function()
        require('plugins.dashboard')
      end,
    }
    -- buffer managerment
    use {
      'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      event = 'BufWinEnter',
      setup = function ()
        require('plugins.bufferline').setup()
      end,
      config = function()
        require('plugins.bufferline').config()
      end,
    }
    -- delete buffer without losing layout
    use {
      'famiu/bufdelete.nvim',
      cmd = {
        'Bdelete',
        'Bdelete!',
      },
      setup = function()
        require('plugins.bufdelete').setup()
      end,
    }
    -- explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons', opt = true },
      cmd = {
        'NvimTreeToggle',
        'NvimTreeFindFile'
      },
      setup = function()
        require('plugins.nvim-tree').setup()
      end,
      config = function()
        require('plugins.nvim-tree').config()
      end,
    }
    -- symbols outline
    use {
      'simrat39/symbols-outline.nvim',
      cmd = 'SymbolsOutline',
      setup = function()
        require('which-key').register({
          ['<Leader>o'] = {'<Cmd>SymbolsOutline<CR>', 'Outline'}
        })
      end,
    }
    -- fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
      },
      cmd = 'Telescope',
      setup = function ()
        require('plugins.telescope').setup()
      end,
      config = function()
        require('plugins.telescope').config()
      end,
    }
    -- indent line
    use {
      'lukas-reineke/indent-blankline.nvim',
      event = {
        'BufReadPre',
        'BufNewFile'
      },
      config = function()
        require('plugins.indent-blankline')
      end,
    }

    -- code relative
    -- syntax highlight
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = 'BufRead',
      config = function()
        require('plugins.treesitter')
      end,
    }
    -- hight color code
    use {
      'norcalli/nvim-colorizer.lua',
      event = 'BufRead',
      config = function()
        require('plugins.colorizer')
      end
    }
    -- code comment toggle
    use {
      'terrortylor/nvim-comment',
      event = 'BufRead',
      config = function()
        require('nvim_comment').setup()
      end,
    }
    -- Highlight, show and Search Todo in comment
    use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      event = 'BufWinEnter',
      setup = function ()
        require('plugins.todo-comments').setup()
      end,
      config = function()
        require('todo-comments').setup {}
      end
    }
    -- An EditorConfig plugin for Vim
    use {
      'editorconfig/editorconfig-vim'
    }
    -- code format
    use {
      'mhartington/formatter.nvim',
      cmd = 'Format',
      setup = function()
        require('plugins.formatter').setup()
      end,
      config = function()
        require('plugins.formatter').config()
      end,
    }
    -- TODO
    -- build system
    -- use 'pianocomposer321/yabs.nvim'
    -- database
    -- kristijanhusak/vim-dadbod-ui

    -- LSP
    -- LSP configuration
    use {
      'neovim/nvim-lspconfig',
      event = 'BufReadPre',
      config = function()
        require('plugins.lspconfig')
      end,
    }
    -- LSP Trouble Hint in the left of line number
    -- TODO bug
    use 'folke/lsp-colors.nvim'
    -- LSP Trouble Pane
    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      setup = function()
        require('plugins.trouble').setup {}
      end,
      config = function()
        require('plugins.trouble').setup()
      end
    }
    -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
    use {
      'onsails/lspkind-nvim',
      event = 'BufWinEnter',
      config = function()
        require('lspkind').init()
      end
    }
    -- lsp UI: A light-weight lsp plugin based on neovim built-in lsp with a highly performant UI.
    -- TODO bug
    use {
      'glepnir/lspsaga.nvim',
      after = 'nvim-cmp',
      cmd = 'Lspsaga',
      config = function ()
        require('lspsaga').init_lsp_saga()
      end
    }

    -- auto complement
    use {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      requires = {
        {
          'L3MON4D3/LuaSnip', -- should be loaded before nvim-cmp
          requires = 'rafamadriz/friendly-snippets',
          config = function ()
            -- require('luasnip').config.setup({})
            -- if lazy_load is used, the LuaSnip should be loaded before ButWinEnter and FileType
            require('luasnip.loaders.from_vscode').lazy_load({
              paths = {
                vim.fn.stdpath('data')..'/site/pack/packer/start/friendly-snippets',
                './snippests', -- Your custom snippests
              }
            })
          end,
        },
        {
          -- nvim-cmp source for LuaSnip
          'saadparwaiz1/cmp_luasnip',
          after = 'nvim-cmp',
        },
        {
          -- nvim-cmp source for neovim builtin LSP client
          'hrsh7th/cmp-nvim-lsp',
          -- event = 'VimEnter', -- don't lazy load, for it will be used in lspconfig
        },
        {
          -- nvim-cmp source for buffer words.
          'hrsh7th/cmp-buffer',
          after = 'nvim-cmp',
        },
        {
          'f3fora/cmp-spell',
          after = 'nvim-cmp'
        },
        {
          -- nvim-cmp source for neovim Lua API.
          -- TODO: lazy load on filetype AND event, and using require 'cmp'.setup.buffer
          'hrsh7th/cmp-nvim-lua',
          after = 'nvim-cmp',
        },
        {
          -- nvim-cmp source for path
          'hrsh7th/cmp-path',
          after = 'nvim-cmp',
        },
        {
          -- nvim-cmp source for latex symbols
          -- TODO: lazy load on filetype AND event, and using require 'cmp'.setup.buffer
          'kdheepak/cmp-latex-symbols',
          after = 'nvim-cmp',
        },
        {
          -- auto completement for pairs
          'windwp/nvim-autopairs',
          after = 'nvim-cmp',
          config = function()
            require('plugins.autopairs')
          end,
        }
      },
      config = function()
        require('plugins.cmp')
      end
    }

    -- git
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      event = {
        'BufRead',
        'BufNewFile'
      },
      config = function()
        require('gitsigns').setup()
      end
    }

    -- terminal
    use {
      'akinsho/nvim-toggleterm.lua',
      event = 'BufWinEnter',
      config = function()
        require('plugins.toggleterm')
      end,
    }

    -- Edit
    -- underline the same words
    use {
      'xiyaowong/nvim-cursorword',
      event = 'BufRead',
    }
    -- switch to english input automatically when changing to Normal mode
    use {
      'h-hg/fcitx.nvim',
      event = 'BufWinEnter',
    }
    -- a clipboard manager for neovim
    use {
      "AckslD/nvim-neoclip.lua",
      event = 'BufWinEnter',
      requires = {'tami5/sqlite.lua', module = 'sqlite'},
      config = function()
        require('neoclip').setup()
        require('which-key').register({
          ['<Leader>fc'] = 'Search Clipboard History',
        })
      end,
    }
    
    -- smooth scroll
    use {
      'karb94/neoscroll.nvim',
      event = 'WinScrolled',
      config = function ()
        require('neoscroll').setup()
      end,
    }

    -- markdown
    -- markdown preview
    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      ft = {
        'markdown'
      },
      setup = function ()
        vim.cmd[[
          au FileType markdown :lua require('which-key').register({ ['<Leader>mp'] = {'<Cmd>MarkdownPreviewToggle<CR>', 'Markdown Preview'} }, { buffer=0 })
        ]]
      end,
      config = function()
        -- refresh markdown when save the buffer or leave from insert mode
        vim.g.mkdp_refresh_slow = 1
      end,
    }
    use {
      'plasticboy/vim-markdown',
      requires = {'godlygeek/tabular'},
      ft = {
        'markdown'
      },
      setup = function()
        require('plugins.vim-markdown').setup()
      end,
      config = function ()
        require('plugins.vim-markdown').config()
      end
    }

    -- Tex, LaTex
    use {
      'lervag/vimtex',
      ft = {
        'latex',
        'tex',
        'bib'
      },
      config = function()
        require('plugins.vimtex')
      end
    }

    use {
      'voldikss/vim-translator',
      event = 'BufWinEnter',
      setup = function()
        require('plugins.translator')
      end
    }

  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
