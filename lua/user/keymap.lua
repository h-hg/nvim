local opts = {silent = true, noremap = true}

vim.keymap.set('n', '<C-w>Q', function ()
  -- local num = #vim.fn.getbufinfo({buflisted=1})
  if(vim.bo[0].modified) then
    if vim.fn.confirm(
      "'" .. vim.api.nvim_buf_get_name(0) .. "' has modified. Do you discard it anyway?",
      '&Yes\n&No'
      -- save and delete
    ) == 1 then
      vim.api.nvim_buf_delete(0,  { force = true })
    end
  else
    vim.api.nvim_buf_delete(0, {})
  end
end, vim.tbl_extend('force', opts, {desc = 'Quite and Delete Buffer'}))

lvim.builtin.which_key.mappings['F'] = {
  name = 'File',
  ['i'] = {function ()
    -- local flag = vim.opt.expandtab
    vim.opt.expandtab = true
    vim.cmd('retab')
    -- vim.opt.expandtab = flag
  end, 'Convert Indent To Space'},
  ['I'] = {function ()
    -- local flag = vim.opt.expandtab
    vim.opt.expandtab = false
    vim.cmd('retab')
    -- vim.opt.expandtab = flag
  end, 'Convert Indent To Tab'},
  ['r'] = {function()
    -- TODO
    print('Unfished')
  end, 'Rename'},
  ['l'] = {function ()
    -- TODO
    print('Unfished')
  end, 'Convert EOL To LF'},
  ['L'] = {function ()
    -- TODO
    print('Unfished')
  end, 'Convert EOL TO CRLF'},
  ['e'] = {function ()
    -- TODO
    print('Unfished')
  end, 'Encoding'}
}


-- Termianl Mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], {
  silent = true,
  noremap = false, -- attention
})