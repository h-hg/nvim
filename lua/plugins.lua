local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- download packer.nvim
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

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
      config = function()
        require('nav.which-key').config()
      end
    }
    -- status line
    use {
      -- the origin hoob3rt/lualine.nvim may not be under maintenance
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      event = 'BufWinEnter',
      config = function()
        require('nav.lualine')
      end
    }
    -- buffer managerment
    use {
      'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      event = 'BufWinEnter',
      setup = function ()
        require('nav.bufferline').setup()
      end,
      config = function()
        require('nav.bufferline').config()
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
        require('nav.bufdelete').setup()
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
        require('nav.nvim-tree').setup()
      end,
      config = function()
        require('nav.nvim-tree').config()
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
        require('nav.telescope').setup()
      end,
      config = function()
        require('nav.telescope').config()
      end,
    }
    
    -- code relative
    -- indent line
    use {
      'lukas-reineke/indent-blankline.nvim',
      event = {
        'BufReadPre',
        'BufNewFile'
      },
      config = function()
        require('others.indent-blankline')
      end,
    }
    -- syntax highlight
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = 'VimEnter', -- before hrsh7th/nvim-cmp
      config = function()
        require('others.treesitter')
      end,
    }
    -- hight color code
    -- 可能需要找有维护的
    use {
      'norcalli/nvim-colorizer.lua',
      event = 'BufRead',
      config = function()
        require('others.colorizer')
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
        require('others.todo-comments').setup()
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
        require('others.formatter').setup()
      end,
      config = function()
        require('others.formatter').config()
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
      event = 'VimEnter',
      config = function()
        require('lsp.ui')
      end,
    }
    -- LSP Trouble Pane
    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      cmd = 'TroubleToggle',
      setup = function()
        require('lsp.trouble').setup()
      end,
    }
    -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
    use {
      'onsails/lspkind-nvim',
      event = 'VimEnter',
      config = function()
        require('lspkind').init()
      end
    }
    -- show code action icon like vscode automatically
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
    -- lsp UI: A light-weight lsp plugin based on neovim built-in lsp with a highly performant UI.
    -- TODO bug
    use {
      'glepnir/lspsaga.nvim',
      disable = true,
      cmd = 'Lspsaga',
      config = function ()
        require('lspsaga').init_lsp_saga()
      end
    }
    -- Show function signature when you type
    -- TODO Can't jump into the float windows when pressing the same keys again
    use {
      'ray-x/lsp_signature.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require 'lsp_signature'.setup({
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {
            border = 'rounded'
          }
        })
      end,
    }
    -- LSP installer
    use {
      "williamboman/nvim-lsp-installer",
      after = 'nvim-lspconfig',
      config = function()
        require("nvim-lsp-installer").setup({
          ensure_installed = {
            'bashls', -- bash
            'cssls', -- css
            'dockerls', -- docker
            'html', -- html
            'jsonls', -- json
            'sumneko_lua', -- lua
            'sqls', -- sql
            'taplo', -- toml
            'tsserver', -- typescript
            'vimls', -- vim
            'lemminx', -- xml
            'yamlls', -- yaml
          },
        })
        require('lsp.server')
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
            require('cmp.luasnip')
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
          after = 'nvim-cmp',
          config = function()
            vim.opt.spell = true
            vim.opt.spelllang = { 'en_us' }
          end,
        },
        {
          -- nvim-cmp source for neovim Lua API.
          -- source.is_available = true when vim.bo.filetype == 'lua'
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
          'kdheepak/cmp-latex-symbols',
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
          -- nvim-cmp source for textDocument/documentSymbol via nvim-lsp
          'hrsh7th/cmp-nvim-lsp-document-symbol',
          after = 'nvim-cmp',
        },
        {
          -- nvim-cmp source for command history
          'dmitmel/cmp-cmdline-history',
          after = 'nvim-cmp',
        },
        {
          -- nvim-cmp source for dictionary
          'uga-rosa/cmp-dictionary',
          after = 'nvim-cmp',
          config = function()
            local MYCONFIG_ROOT = vim.env.MYVIMRC:gsub("/[^/]+$", "")
            require('cmp_dictionary').setup({
              dic = {
                ["*"] = { MYCONFIG_ROOT .. '/dict/star.txt' },
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
          -- auto completement for pairs
          'windwp/nvim-autopairs',
          after = 'nvim-cmp',
          config = function()
            require('cmp.autopairs')
          end,
        }
      },
      config = function()
        require('cmp.cmp')
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
        require('others.toggleterm')
      end,
    }

    -- Edit
    -- underline the same words
    use {
      'xiyaowong/nvim-cursorword',
      event = 'VimEnter',
    }
    -- switch to english input automatically when changing to Normal mode
    use {
      'h-hg/fcitx.nvim',
      event = 'BufWinEnter',
    }
    -- a clipboard manager for neovim
    use {
      'AckslD/nvim-neoclip.lua',
      requires = {'tami5/sqlite.lua', module = 'sqlite'},
      after = 'telescope.nvim',
      setup = function()
        require('which-key').register({
          ['<Leader>fc'] = {'<Cmd>Telescope neoclip plus<CR>', 'Search Clipboard History'},
        })
      end,
      config = function()
        require('neoclip').setup()
        require('telescope').load_extension('neoclip')
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
        vim.api.nvim_create_autocmd({'FileType'}, {
          pattern = 'markdown',
          callback = function()
            require('which-key').register({
              ['<Leader>mp'] = {'<Cmd>MarkdownPreviewToggle<CR>', 'Markdown Preview'}
            }, {
              buffer=0
            }
          )
          end,
        })
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
        require('others.vim-markdown').setup()
      end,
      config = function ()
        require('others.vim-markdown').config()
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
        require('others.vimtex')
      end
    }

    use {
      'voldikss/vim-translator',
      event = 'BufWinEnter',
      setup = function()
        require('others.translator')
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

