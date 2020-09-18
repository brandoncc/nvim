" Delete the word after the cursor while in insert mode
inoremap <M-w> <C-\><C-o>dB

" Delete the word before the cursor while in insert or command mode
inoremap <M-BS> <C-\><C-o>db
cnoremap <M-BS> <C-w>

" window navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" window size management
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" quick splits
nnoremap \| :vsplit<CR>
nnoremap _ :split<CR>

tnoremap <buffer> <Esc><Esc> <C-\><C-n>
tnoremap <buffer> jk <C-\><C-n>

inoremap jk <Esc>

nnoremap <Leader><Leader>s :lua require'brandoncc.file_operations'.source_file()<CR>

nnoremap <Leader>rc :lua require'brandoncc.file_operations'.source_init_vim()<CR>
