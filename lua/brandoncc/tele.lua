package.loaded['brandoncc.tele'] = nil

M = {}

function M.setup()
  require('telescope').setup{
    -- configuration
  }
end

function M.commands()
  require('telescope.builtin').builtin()
end

-- The current buffer builtin is a good example of writing a custom builtin:
-- https://github.com/nvim-lua/telescope.nvim/blob/master/lua/telescope/builtin.lua#L477-L513
function M.example()
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


M.setup()

return M
