-- f3fora/cmp-sepll
lvim.builtin.cmp.formatting.source_names['spell'] = '(Spell)'
-- table.insert(lvim.builtin.cmp.sources, 1, { name = 'spell' })

-- hrsh7th/cmp-emoji
-- lvim.builtin.cmp.formatting.source_names['emoji'] = '(Emoji)'
-- table.insert(lvim.builtin.cmp.sources, 1, { name = 'Emoji' })

-- uga-rosa/cmp-dictionary
lvim.builtin.cmp.formatting.source_names['dictionary'] = '(Dict)'
table.insert(lvim.builtin.cmp.sources, 1, {
  name = 'Dictionary',
  keyword_length = 2,
})

-- dmitmel/cmp-cmdline-history
lvim.builtin.cmp.formatting.source_names['cmdline_history'] = '(History)'
-- table.insert(lvim.builtin.cmp.sources, 1, { name = 'cmdline_history'})

-- hrsh7th/cmp-cmdline
lvim.builtin.cmp.formatting.source_names['cmdline'] = '(NvimCmd)'
-- table.insert(lvim.builtin.cmp.sources, 1, { name = 'cmdline'})

-- kdheepak/cmp-latex-symbols
lvim.builtin.cmp.formatting.source_names['latex_symbols'] = '(LaTex)'
table.insert(lvim.builtin.cmp.sources, 1, { name = 'latex_symbols'})

-- https://github.com/LunarVim/LunarVim/issues/2663
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok or cmp == nil then
  cmp = {
    mapping = function(...) end,
    setup = {
      filetype = function(...) end,
      cmdline = function(...) end
    },
    config = { sources = function(...) end },
  }
end

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline {},
    sources = {
      { name = 'cmdline' },
      { name = 'path' },
      { name = 'cmdline_history' },
    },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline {},
  sources = {
    {name = 'buffer'}
  }
})

cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline {},
  sources = {
    {name = 'buffer'}
  }
})

cmp.setup.filetype({
  'markdown',
  'tex',
  'text',
}, {
  mapping = cmp.mapping.preset.buffer,
  sources = {
    {name = 'spell'}
  }
})

-- set spell for nvim-cmp
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'markdown', 'tex', 'text'},
  callback = function()
    vim.opt.spell = true
    -- 加入cjk后，可以检查中英混排中的英文，且不对其中的中文报错
    vim.opt.spelllang = { 'en_us', 'cjk' }
  end,
})