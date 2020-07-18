" Delete the word after the cursor while in insert mode
inoremap <M-w> <C-\><C-o>dB

" Delete the word before the cursor while in insert mode
inoremap <M-BS> <C-\><C-o>db

" window navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" window size management
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
