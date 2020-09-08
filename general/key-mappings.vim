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
" quick splits
nnoremap \| :vsplit<CR>
nnoremap _ :split<CR>

tnoremap <buffer> <Esc><Esc> <C-\><C-n>

inoremap jk <Esc>

nnoremap <leader>md :call <SID>mkdir_p()<CR>

function! s:mkdir_p()
  let path = fnamemodify(expand('%'), ":h:p")
  call system('mkdir -p ' . path)
  echo path . ' was created'
endfunction
