" ref: https://stackoverflow.com/a/61486601
function! GetVisualSelection()
  let mode = visualmode()
  " call with visualmode() as the argument
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end]     = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if mode ==# 'v'
    " Must trim the end before the start, the beginning will shift left.
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
  elseif  mode ==# 'V'
    " Line mode no need to trim start or end
  elseif  mode == "\<c-v>"
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
