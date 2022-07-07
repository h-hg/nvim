local utils = require('user.utils')

lvim.builtin.lualine.options = {
  globalstatus = true,
  section_separators = { left = '', right = '' },
}

local components = require('lvim.core.lualine.components')
lvim.builtin.lualine.sections.lualine_a = {
  {
    -- TODO more mode, see the original function
    'mode',
    fmt = function(str)
      return str:sub(1,1)
    end
  }
}
-- git
lvim.builtin.lualine.sections.lualine_b = {
  {
    function()
      if vim.bo.readonly or vim.bo.modifiable == false then
        return ' ' .. vim.fn.expand('%:t')
      else
        return vim.fn.expand('%:t')
      end
    end,
    cond = require('lvim.core.lualine.conditions').hide_in_width
  },
  components.branch,
  components.diff,
}
-- shell environment
lvim.builtin.lualine.sections.lualine_c = {
  components.filetype,
  {
    -- environment
    function ()
      local type = vim.bo.filetype
      if type == 'python' then
        --version('env_name':env_type)
        local ver = utils.getVersion(vim.fn.system('python --version'))
        if ver == nil then
          return ''
        end
        local venv = os.getenv 'CONDA_DEFAULT_ENV'
        if venv then
          return string.format("%s('%s':cond)", ver, venv)
        end
        venv = os.getenv 'VIRTUAL_ENV'
        if venv then
            return string.format("%s('%s':venv)", ver, venv)
        end
        return ver
      elseif type == 'lua' then
        local outer = vim.fn.system('lua -v'):match('[%d+%.]+')
        local inner = _VERSION:match('[%d+%.]+')
        if outer == nil then
          return string.format("%s(Nvim)", inner)
        else
          return string.format("%s(Env), %s(Nvim)", outer, inner)
        end
      elseif type == 'java' then
        local info = vim.fn.system('java --version')
        local ver = utils.getVersion(info)
        if ver == nil then
          return ''
        end
        local jdk = 'Oracle'
        if info:find('openjdk') ~= nil then
          jdk = 'OpenJDK'
        end
        return string.format('%s(%s)', ver, jdk)
      else
        return ''
      end
    end,
    cond =  require('lvim.core.lualine.conditions').hide_in_width,
    -- color = { fg = '#00ff00' },
  }
}
-- code relative
lvim.builtin.lualine.sections.lualine_x = {
  components.treesitter,
  components.diagnostics,
  components.lsp,
}
-- file information
lvim.builtin.lualine.sections.lualine_y = {
  {
    components.spaces[1],
    fmt = function(str)
      return string.gsub(str, '%s+', '')
    end
  },
  components.encoding,
  {
    -- 'fileformat',
    function ()
      if vim.o.fileformat == 'dos' then
        return 'CRLF'
      else
        return 'LF'
      end
    end
  },
  {
    'filesize', -- lualine component
    cond = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    fmt = string.upper
  },
}
-- location
lvim.builtin.lualine.sections.lualine_z = {
  { '%l:%c', type = 'stl' },
  -- components.scrollbar,
  {
    'progress',
    fmt = function(str)
      return string.gsub(str, '%s+', '')
    end
  }
}
