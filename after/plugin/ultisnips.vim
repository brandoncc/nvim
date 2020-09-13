let g:UltiSnipsEditSplit = 'context'

nnoremap <Leader>se :UltiSnipsEdit<CR>
xmap <Leader>sc <Plug>ultisnips-refactor

" coc wants javascriptreact and typescriptreact, the others are to support
" honza/vim-snippets snippets
autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascriptreact.javascript.javascript-react.javascript_react
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescriptreact.javascript.typescript.javascriptreact.javascript-react.javascript_react
