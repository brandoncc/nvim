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
  let lines = s:GetVisualSelection(visualmode())

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

" ref: https://stackoverflow.com/a/61486601
function! s:GetVisualSelection(mode)
  " call with visualmode() as the argument
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end]     = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if a:mode ==# 'v'
    " Must trim the end before the start, the beginning will shift left.
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
  elseif  a:mode ==# 'V'
    " Line mode no need to trim start or end
  elseif  a:mode == "\<c-v>"
    " Block mode, trim every line
    let new_lines = []
    let i = 0
    for line in lines
      let lines[i] = line[column_start - 1: column_end - (&selection == 'inclusive' ? 1 : 2)]
      let i = i + 1
    endfor
  else
    return ''
  endif

  return lines
endfunction
