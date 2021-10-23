-- configuraion for nvim-cmp

local lspkind = require('lspkind')

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp setup

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require 'cmp'
local luasnip = require 'luasnip'
cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- the code of <Tab> and <S-tab> is from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#vim-vsnip
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      -- set a name for each source
      vim_item.menu = ({
        buffer = '[Buf]',
        nvim_lsp = '[LSP]',
        luasnip = '[Snip]',
        nvim_lua = '[NvimLua]',
        latex_symbols = '[Latex]',
        spell = '[Spell]',
        path = '[Path]',
        emoji = '[Emoji]',
      })[entry.source.name]
      return vim_item
    end
  },
  sources = {
    -- no plan for omni, https://github.com/hrsh7th/nvim-cmp/issues/122, alternative hrsh7th/cmp-omni
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'spell' },
    { name = 'nvim_lua'},
    { name = 'latex_symbols' },
    { name = 'emoji' },
  },
}
