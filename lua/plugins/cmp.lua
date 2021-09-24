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
cmp.setup {
  snippet = {
    expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- the code of <Tab> and <S-tab> is from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#vim-vsnip
    ['<Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
      elseif has_words_before() and vim.fn['vsnip#available']() == 1 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '', true)
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function()
      if vim.fn.pumvisible() == 1 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n', true)
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-prev)', true, true, true), '', true)
      end
    end, { 'i', 's' }),
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      -- set a name for each source
      vim_item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        vsnip = '[VSnip]',
        nvim_lua = '[Lua]',
        latex_symbols = '[Latex]',
        spell = '[Spell]',
        path = '[Path]',
      })[entry.source.name]
      return vim_item
    end
  },
  sources = {
    -- no plan for omni, https://github.com/hrsh7th/nvim-cmp/issues/122
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'vsnip' },
    { name = 'spell' },
    { name = 'nvim_lua'},
    { name = 'latex_symbols' },
  },
}

-- The following code is copied from
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/neovim/nvim-lspconfig/wiki/Snippets



-- my custom mapping: copied from https://github.com/hamsterBiscuit/nvim

-- vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>', {noremap = true, silent = true})

-- vsnip Expand or jump
-- vim.api.nvim_set_keymap('i', '<C-n>', 'vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'', {expr = true})
-- vim.api.nvim_set_keymap('s', '<C-n>', 'vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'', {expr = true})

-- configuraion for vim-vsnip
vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
vim.g.vsnip_filetypes = {}
vim.g.vsnip_filetypes.javascriptreact = {'javascript'}
vim.g.vsnip_filetypes.typescriptreact = {'typescript'}
