-- configuraion for nvim-cmp

local lspkind = require('lspkind')

-- Set completeopt to have a better completion experience
vim.opt.completeopt = {
  'menu',
  'menuone',
  'noselect',
}

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
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),{'i','c'}),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),{'i','c'}),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),{'i','c'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),{'i','c'}),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- the code of <Tab> and <S-tab> is from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { 'i', 's', 'c' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's', 'c' }),
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      -- set a name for each source
      vim_item.menu = ({
        buffer = '[Buf]',
        cmdline = '[NvimCmd]',
        cmdline_history = '[History]',
        dictionary = '[Dict]',
        emoji = '[Emoji]',
        latex_symbols = '[Latex]',
        luasnip = '[Snip]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[NvimLua]',
        path = '[Path]',
        spell = '[Spell]',
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
    {
      name = 'dictionary',
      keyword_length = 2,
    },
  },
}

local search_sources = {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' },
  }, {
    { name = 'buffer' },
  }),
}
-- Use buffer source for `/`.
cmp.setup.cmdline('/', search_sources)
cmp.setup.cmdline('?', search_sources)
-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }, {
    { name = 'cmdline_history' },
  }),
})

