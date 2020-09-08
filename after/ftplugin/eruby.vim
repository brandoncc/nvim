xnoremap <Leader>r <C-U>call Refactor()

function! Refactor()
  let new_filename = input('New filename:', fnamemodify(expand('%'), ':h:p') . '/')

  if empty(glob(new_filename))
    echo "it doesn't exist!"
  endif
endfunction
