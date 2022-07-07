local M = {}

M.getVersion = function(str)
  if type(str) ~= 'string' then
    return nil
  end
  return str:match('[%d+%.]+')
end

M.path = require('user.utils.path')
M.filetype = require('user.utils.filetype')

return M