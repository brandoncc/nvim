package.loaded['brandoncc.tele'] = nil

local vim = vim

local tele = {}

function tele.all_files()
  require'telescope.builtin'.find_files{}
end

function tele.cfwd_files()
  require'telescope.builtin'.find_files{
    cwd = vim.fn.expand("%:p:h")
  }
end

function tele.commands()
  require'telescope.builtin'.builtin{}
end

function tele.command_history()
  require'telescope.builtin'.command_history{}
end

function tele.git_files()
  require'telescope.builtin'.git_files{}
end

function tele.project_grep()
  require'telescope.builtin'.live_grep{}
end

function tele.file_browser()
  require'telescope.builtin'.file_browser{}
end

function tele.setup()
  require('telescope').setup{
    -- configuration
  }
end

function tele.symbols()
  require'telescope.builtin'.treesitter{}
end

-- The current buffer builtin is a good example of writing a custom builtin:
-- https://github.com/nvim-lua/telescope.nvim/blob/master/lua/telescope/builtin.lua#L477-L513
function tele.example()
  local finders = require('telescope.finders')
  local pickers = require('telescope.pickers')
  local sorters = require('telescope.sorters')

  local my_list = {'a', 'b', 'c'}

  pickers.new({
    prompt    = 'Telescope Builtin',
    finder    = finders.new_table {
      results = my_list,
    },
    sorter    = sorters.get_generic_fuzzy_sorter(),
  }):find()
end


tele.setup()

return tele
