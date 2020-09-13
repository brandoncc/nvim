package.loaded['brandoncc.file_operations'] = nil
local module = {}

local vim = vim

function module.source_file()
  local extension = vim.fn.expand('%:e')

  if (extension == 'vim') then
    vim.cmd('source %');
    print('Sourced ' .. vim.fn.expand('%'))
  elseif (extension == 'lua') then
    vim.cmd('luafile %');
    print("Luafile'd " .. vim.fn.expand('%'))
  end
end

function module.source_init_vim()
  vim.cmd('source $HOME/.config/nvim/init.vim')
  print('Sourced init.vim')
end

return module 
