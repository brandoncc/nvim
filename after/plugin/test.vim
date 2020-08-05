nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" make test commands execute using dispatch.vim
let test#strategy = "asyncrun_background_term"


" let test#ruby#rspec#options = '--out rspec.out'
