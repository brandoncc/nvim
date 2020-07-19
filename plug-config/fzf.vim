nnoremap <C-p> :Files<CR>
nnoremap <Leader>fb :FzfPreviewAllBuffers<CR>
nnoremap <Leader>fh :FzfPreviewProjectMruFiles<CR>
nnoremap <Leader>. :FzfPreviewProjectFiles<CR>

nnoremap <Leader>fj :FzfPreviewJumps<CR>
nnoremap <Leader>gs :FzfPreviewGitStatus<CR>
nnoremap <Leader>gg :FzfPreviewProjectGrep 
nnoremap <Leader>gw <cmd>call execute(':FzfPreviewProjectGrep ' . expand("<cword>"))<CR>
" Call FZF Preview Tons of Things (mnemonic "find everything")
nnoremap <Leader>fe <cmd>FzfPreviewFromResources project git directory buffer project_mru<CR>
nnoremap <Leader>bt :FzfPreviewBufferTags<CR>

nnoremap <leader><leader>f :call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(expand("<cword>")), 1, 0)<CR>
nnoremap <leader><leader>F :call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(expand("<cWORD>")), 1, 0)<CR>

let g:fzf_buffers_jump = 1
