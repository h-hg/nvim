
local M = {}

M.sep = vim.loop.os_uname().version:match 'Windows' and '\\' or '/'

---Join path segments that were passed as input
---@return string
function M.joins(...)
  return table.concat({ ... }, M.sep)
end

function M.isDir(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == 'directory' or false
end

function M.isFile(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == 'file' or false
end

return M