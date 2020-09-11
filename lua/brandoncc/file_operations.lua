package.loaded['brandoncc.file_operations'] = nil
M = {}

local vim = vim

function M.source_file()
  local extension = vim.fn.expand('%:e')

  if (extension == 'vim') then
    vim.cmd('source %');
    print('Sourced ' .. vim.fn.expand('%'))
  elseif (extension == 'lua') then
    vim.cmd('luafile %');
    print("Luafile'd " .. vim.fn.expand('%'))
  end
end

return M
