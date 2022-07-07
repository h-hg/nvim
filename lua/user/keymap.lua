local opt = {silent = true, noremap = true}


vim.keymap.set('n', '<C-w>Q', function ()
  -- local num = #vim.fn.getbufinfo({buflisted=1})
  if(vim.bo[0].modified) then
    if vim.fn.confirm(
      "'" .. vim.api.nvim_buf_get_name(0) .. "' has modified. Do you discard it anyway?",
      '&Yes\n&No'
    ) == 1 then
      vim.api.nvim_buf_delete(0,  { force = true })
    end
  else
    vim.api.nvim_buf_delete(0, {})
  end
end, vim.tbl_extend('force', opt, {desc = 'Quite and Delete Buffer'}))


local function toTab()
  local flag = vim.opt.expandtab
  vim.opt.expandtab = false
  vim.cmd('retab')
  vim.opt.expandtab = flag
end

local function toSpace()
  local flag = vim.opt.expandtab
  vim.opt.expandtab = true
  vim.cmd('retab')
  vim.opt.expandtab = flag
end
