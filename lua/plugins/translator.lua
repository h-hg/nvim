local wk = require('which-key')
wk.register({
  ['<Leader>q'] = {
    name = 'Translate',
    ['d'] = {'<Plug>TranslateW','Translate Window'},
    ['r'] = {'<Plug>TranslateR', 'Translate Replace'},
    ['x'] = {'<Plug>TranslateX', 'Translate Clipboard'},
    ['e'] = {'<Plug>TranslateW --target_lang=en', 'Translate English'},
  },
}, {
  mode = 'n',
  buffer = nil,
  slient = true,
  noremap = false, -- attention
})
wk.register({
  ['<Leader>q'] = {
    name = 'Translate',
    ['d'] = {'<Plug>TranslateWV','Translate Window'},
    ['r'] = {'<Plug>TranslateRV', 'Translate Replace'},
    ['x'] = {'<Plug>TranslateXV', 'Translate Clipboard'},
    ['e'] = {'<Plug>TranslateWV --target_lang=en', 'Translate English'},
  },
}, {
  mode = 'v',
  buffer = nil,
  slient = true,
  noremap = false, -- attention
})
