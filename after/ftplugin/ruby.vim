nmap <Leader>b :B<CR>

nmap <silent> <buffer> <leader>tn :TestNearest<CR>
nmap <silent> <buffer> <leader>tf :TestFile<CR>
nmap <silent> <buffer> <leader>ts :TestSuite<CR>
nmap <silent> <buffer> <leader>tl :TestLast<CR>
nmap <silent> <buffer> <leader>tg :TestVisit<CR>

" ===== Seeing Is Believing =====
" Assumes you have a Ruby with SiB available in the PATH
" If it doesn't work, you may need to `gem install seeing_is_believing`

function! WithoutChangingCursor(fn)
  let cursor_pos     = getpos('.')
  let wintop_pos     = getpos('w0')
  let old_lazyredraw = &lazyredraw
  let old_scrolloff  = &scrolloff
  set lazyredraw

  call a:fn()

  call setpos('.', wintop_pos)
  call setpos('.', cursor_pos)
  redraw
  let &lazyredraw = old_lazyredraw
  let scrolloff   = old_scrolloff
endfun

function! SibAnnotateAll(scope)
  call WithoutChangingCursor(function('execute', [a:scope . "!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk"]))
endfun

function! SibAnnotateMarked(scope)
  call WithoutChangingCursor(function('execute', [a:scope . "!seeing_is_believing --xmpfilter-style --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk"]))
endfun

function! SibCleanAnnotations(scope)
  call WithoutChangingCursor(function('execute', [a:scope . "!seeing_is_believing --clean"]))
endfun

function! SibToggleMark()
  let pos  = getpos('.')
  let line = getline(".")
  if line =~ '^\s*$'
    let line = '# => '
  elseif line =~ '# =>'
    let line = substitute(line, ' *# =>.*', '', '')
  else
    let line .= '  # => '
  end
  call setline('.', line)
  call setpos('.', pos)
endfun

" Enable seeing-is-believing mappings only for Ruby
augroup seeingIsBelievingSettings
  " clear the settings if they already exist (so we don't run them twice)
  autocmd!
  autocmd FileType ruby nmap <buffer> <F5> :call SibAnnotateAll("%")<CR>;
  autocmd FileType ruby nmap <buffer> <F6> :call SibAnnotateMarked("%")<CR>;
  autocmd FileType ruby nmap <buffer> <F7> :call SibCleanAnnotations("%")<CR>;
  autocmd FileType ruby nmap <buffer> <F8> :call SibToggleMark()<CR>;

  autocmd FileType ruby vmap <buffer> <F5> :call SibAnnotateAll("'<,'>")<CR>;
  autocmd FileType ruby vmap <buffer> <F6> :call SibAnnotateMarked("'<,'>")<CR>;
  autocmd FileType ruby vmap <buffer> <F7> :call SibCleanAnnotations("'<,'>")<CR>;
  autocmd FileType ruby vmap <buffer> <F8> :call SibToggleMark("'<,'>")<CR>;
augroup END
