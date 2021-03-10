nnoremap <Leader>tlc :lua require'brandoncc.tele'.command_history{}<CR>
nnoremap <Leader>tlg :lua require'brandoncc.tele'.project_grep{}<CR>
nnoremap <Leader>tls :lua require'brandoncc.tele'.symbols{}<CR>

nnoremap <Leader>f :lua require'brandoncc.tele'.grep_string{}<CR>
nnoremap <Leader>> :lua require'brandoncc.tele'.all_files{}<CR>
nnoremap <Leader>. :lua require'brandoncc.tele'.git_files{}<CR>
nnoremap <Leader>, :lua require'brandoncc.tele'.file_browser{}<CR>
nnoremap <Leader>/ :lua require'brandoncc.tele'.commands{}<CR>
