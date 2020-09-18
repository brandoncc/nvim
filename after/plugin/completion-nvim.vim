"" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""
"" use <c-j> to switch to previous completion
"imap <c-j> <Plug>(completion_next_source)
"" use <c-k> to switch to next completion
"imap <c-k> <Plug>(completion_prev_source)

"" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect

"" Avoid showing message extra message when using completion
"set shortmess+=c

"let g:completion_enable_snippet = 'UltiSnips'
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"" Configure the completion chains
"let g:completion_chain_complete_list = {
"  \  'default': {
"  \    'default': [
"  \       {'complete_items': ['lsp', 'snippet', 'buffers']},
"  \       {'complete_items': ['ts']}
"  \    ]
"  \  }
"  \}

"autocmd BufEnter * lua require'completion'.on_attach()
