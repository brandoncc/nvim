let s:stylelint = {
            \ 'exe': 'stylelint',
            \ 'args': ['--fix', '--stdin-filename', '"%:t"'],
            \ 'stdin': 1,
            \ 'valid_exit_codes': [0, 2],
            \ }

let g:neoformat_css_stylelint = s:stylelint
let g:neoformat_less_stylelint = s:stylelint
let g:neoformat_sass_stylelint = s:stylelint
let g:neoformat_scss_stylelint = s:stylelint

let g:neoformat_enabled_css = ['stylelint']
let g:neoformat_enabled_less = ['stylelint']
let g:neoformat_enabled_sass = ['stylelint']
let g:neoformat_enabled_scss = ['stylelint']

let g:neoformat_enabled_javascript = ['eslint_d']
let g:neoformat_enabled_javascriptreact = ['eslint_d']
let g:neoformat_enabled_typescript = ['eslint_d']
let g:neoformat_enabled_typescriptreact = ['eslint_d']
