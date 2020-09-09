let g:UltiSnipsEditSplit = 'context'

nnoremap <Leader>se :UltiSnipsEdit<CR>
xnoremap <Leader>sc :<C-U>call <SID>RefactorSelectionToSnippet()<CR>

autocmd BufNewFile *.snippets call <SID>SetNewBufferContent()

" coc wants javascriptreact and typescriptreact, the others are to support
" honza/vim-snippets snippets
autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascriptreact.javascript.javascript-react.javascript_react
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescriptreact.javascript.typescript.javascriptreact.javascript-react.javascript_react

function! s:LeadingWhiteSpaceCharacterCount(input, default_if_blank)
  let stripped = substitute(a:input, "^\\\s*", "", "")

  if (strlen(stripped) == 0)
    return a:default_if_blank
  else
    return strlen(a:input) - strlen(stripped)
  endif
endfunction

function! s:LeftStripNCharacters(input, count)
  return substitute(a:input, "^\\\s\\\{" . a:count . "}", "", "")
endfunction

function! s:VimDirectory()
  return fnamemodify($MYVIMRC, ':h')
endfunction

function! s:SkeletonPath()
  return fnamemodify(expand($MYVIMRC, ''), ":h") . "/templates/ultisnips_header.txt"
endfunction

function! s:SkeletonContents()
  return readfile(s:SkeletonPath())
endfunction

function! s:SetNewBufferContent()
  call nvim_buf_set_lines(0, 0, 0, 0, s:SkeletonContents())
endfunction

function! s:RefactorSelectionToSnippet()
  let lines = GetVisualSelection(visualmode())

  let left_padding = 10000

  for line in lines
     let line_left_padding = s:LeadingWhiteSpaceCharacterCount(line, left_padding)

    if line_left_padding < left_padding
      let left_padding = line_left_padding
    endif
  endfor

  let stripped_lines = map(lines, {_, val -> s:LeftStripNCharacters(val, left_padding)})

  let closing_lines = ["endsnippet"]

  silent exe "UltiSnipsEdit " . split(&filetype, '\.')[0]

  let line_count = line('$')
  let last_line_is_blank = strlen(getline(line_count)) == 0

  if (last_line_is_blank)
    let line_count = line_count - 1
  endif

  let failed = append(line_count, [""] + stripped_lines + closing_lines)

  call setpos('.', [0, line_count + 2, 0, 0])
  silent exe "normal! O"
  silent exe "startinsert!"
  call feedkeys('snippet', 'n')
endfunction
