-- 'plasticboy/vim-markdown

local M = {}

function M.config()
  vim.g.vim_markdown_math = 1
  vim.g.vim_markdown_fenced_languages = {
    'csharp=cs',
    'c++=cpp',
    'bash=sh',
    'shell=sh',
    'zsh=sh',
    'ini=dosini'
  }
  vim.g.vim_markdown_frontmatter = 1
  vim.g.vim_markdown_toml_frontmatter = 1
  vim.g.vim_markdown_json_frontmatter = 1
  vim.g.vim_markdown_strikethrough = 1
  vim.g.vim_markdown_new_list_item_indent = 2
end

local function keymap()
  vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'markdown',
    callback = function()
      require('which-key').register({
        ['<Leader>m'] = {
          name = 'Markdown',
          ['t'] = {'<Cmd>InsertToc<CR>', 'Markdown Insert Toc'},
          ['n'] = {'<Cmd>InsertNToc<CR>', 'Markdown Insert NToc'},
          ['f'] = {'<Cmd>TableFormat<CR>', 'Mardown Table Format'},
        }
      }, {
        buffer = 0
        }
      )
    end,
  })
end

function M.setup()
  keymap()
end

return M
