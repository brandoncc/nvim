local vim = vim
local nvim_lsp = require'lspconfig'
local configs = require'lspconfig/configs'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require'completion'.on_attach(client)

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

nvim_lsp.solargraph.setup{
  filetypes = { "ruby" },
  on_attach = on_attach,
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
    }
  }
}

nvim_lsp.sumneko_lua.setup{
  cmd = {
    "/Users/brandoncc/dev/lua-language-server/bin/macOS/lua-language-server",
    "-E",
    "/Users/brandoncc/dev/lua-language-server/main.lua"
  },
  on_attach = on_attach,
}

nvim_lsp.efm.setup {
  on_attach = on_attach,
  init_options = {
    documentFormatting = true,
    documentSymbol = true,
    codeAction = true,
    completion = true
  },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {formatCommand = "lua-format -i", formatStdin = true}
      }
    }
  }
}

-- -- Check if it's already defined for when reloading this file.
-- if not nvim_lsp.stylelint then
--   configs.stylelint = {
--     default_config = {
--       cmd = {
--         'node',
--         '/Users/brandoncc/dev/time-capsule/node_modules/stylelint-lsp/dist/index.js', 
--         '--stdio'
--       };
--       filetypes = {'css', 'sass', 'scss'};
--       root_dir = function(fname)
--         return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
--       end;
--     };
--   }
-- end
-- nvim_lsp.stylelint.setup{
--   on_attach = on_attach
-- }
--
--

-- local filetypes = {
--   javacript = "eslint",
--   javascriptreact = "eslint",
--   typescript = "eslint",
--   typescriptreact = "eslint",
--   css = "stylelint",
--   scss = "stylelint",
--   sass = "stylelint",
--   less = "stylelint"
-- }

-- local linters = {
--   eslint = {
--     sourceName = "eslint",
--     command = "eslint_d",
--     rootPatterns = {".eslintrc.js", "package.json"},
--     debounce = 100,
--     args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
--     parseJson = {
--       errorsRoot = "[0].messages",
--       line = "line",
--       column = "column",
--       endLine = "endLine",
--       endColumn = "endColumn",
--       message = "${message} [${ruleId}]",
--       security = "severity"
--     },
--     securities = {[2] = "error", [1] = "warning"}
--   },
--   stylelint = {
--     sourceName = "stylelint",
--     command = "stylelint",
--     rootPatterns = {
--       ".stylelintrc",
--       ".stylelintrc.json",
--       ".stylelintrc.js", "package.json"
--     },
--     debounce = 100,
--     args = {"--stdin", "--stdin-filename", "%filepath", "--formatter", "json"},
--     parseJson = {
--       errorsRoot = "[0].warnings",
--       line = "line",
--       column = "column",
--       message = "${text}",
--       security = "severity"
--     },
--     securities = {[2] = "error", [1] = "warning"}
--   }
-- }

-- local formatters = {
--   eslint = {
--     command = "eslint_d",
--     args = {"--stdin", "--stdin-filename", "%filepath", "--fix-dry-run"},
--   },
--   stylelint = {
--     command = "stylelint",
--     args = {"--stdin-filepath", "%filepath", "--fix"}
--   }
-- }

-- local formatFiletypes = {
--   javascript = "eslint",
--   javascriptreact = "eslint",
--   typescript = "eslint",
--   typescriptreact = "eslint",
--   css = "stylelint",
--   scss = "stylelint",
--   sass = "stylelint",
--   less = "stylelint"
-- }

-- require'lspconfig'.diagnosticls.setup {
--   on_attach = on_attach,
--   filetypes = vim.tbl_keys(filetypes),
--   init_options = {
--     filetypes = filetypes,
--     linters = linters,
--     -- formatters = formatters,
--     -- formatFiletypes = formatFiletypes
--   }
-- }

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver", "flow" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
