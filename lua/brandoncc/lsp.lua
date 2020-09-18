local nvim_lsp = require'nvim_lsp'

local on_attach_vim = function(client)
  -- require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

nvim_lsp.sumneko_lua.setup{
  cmd = {
    "/Users/brandoncc/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/macOS/lua-language-server",
    "-E",
    "/Users/brandoncc/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua"
  },
  on_attach = on_attach_vim,
}

require'nvim_lsp'.vimls.setup{
  on_attach = on_attach_vim
}
