vnoremap <Leader>gw :lua require'telescope.builtin'.grep_string{search = expand("'<,'>")}

nnoremap <Leader>GG :lua require'telescope.builtin'.live_grep{}<CR>
