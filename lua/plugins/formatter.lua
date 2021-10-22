-- mhartington/formatter.nvim
local function prettier()
  return {
    exe = 'prettier',
    args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0), '--single-quote'},
    stdin = true
  }
end

local function clang_format()
  return {
    exe = 'clang-format',
    args = {'--assume-filename', vim.api.nvim_buf_get_name(0)},
    stdin = true,
    cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
  }
end

local M = {}

function M.config()
  require('formatter').setup({
    logging = false,
    filetype = {
      javascript = {
        prettier
      },
      typescript = {
        prettier
      },
      typescriptreact = {
        prettier
      },
      javascriptreact = {
        prettier
      },
      json = {
        prettier
      },
      vue = {
        prettier
      },
      css = {
        prettier
      },
      less = {
        prettier
      },
      scss = {
        prettier
      },
      yaml = {
        prettier
      },
      html = {
        prettier
      },
      c = {
        clang_format
      },
      cpp = {
        clang_format
      },
      python = {
        function ()
          return {
            exe = 'autopep8',
            args = {
              '-'
            },
            stdin = true,
          }
        end
      },
      lua = {
        function()
          return {
            exe = 'luafmt',
            args = {
              '--indent-count',
              2,
              '--stdin'
            },
            stdin = true
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = 'rustfmt',
            args = {'--emit=stdout'},
            stdin = true
          }
        end
      },
    }
  })
end

local function keymap()
  local wk = require('which-key')
  wk.register({
    ['<Leader>ft'] = { '<Cmd>Format<CR>', 'Format Code' }
  })
end

function M.setup()
  keymap()
  -- auto formatting after writing file
  -- vim.api.nvim_exec([[
  --   autogroup FormatAutogroup
  --     autocmd!
  --     autocmd! BufWritePost *.js,*,css, FormatWrite
  --   autogroup END
  -- ]], true)
end

return M
