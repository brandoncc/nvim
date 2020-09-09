let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nnoremap <Leader>fb :FzfPreviewAllBuffers<CR>
nnoremap <Leader>. :FzfPreviewProjectFiles<CR>
nnoremap <Leader>bt :FzfPreviewBufferTags<CR>

" nnoremap <Leader>fj :FzfPreviewJumps<CR>
nnoremap <Leader>gs :FzfPreviewGitStatus<CR>

" grep the word under the cursor
nnoremap <Leader>gw <cmd>call execute(':FzfPreviewProjectGrep ' . expand("<cword>"))<CR>

" grep the selection (first selected line counts only)
vnoremap <Leader>gw :<C-U>call execute(':FzfPreviewProjectGrep "' . escape(GetVisualSelection()[0], '"') . '"')<CR>

" Call FZF Preview Tons of Things (mnemonic "find everything")
nnoremap <Leader>fe <cmd>FzfPreviewFromResources project git directory buffer project_mru<CR>

nnoremap <leader><leader>f :call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(expand("<cword>")), 1, 0)<CR>
nnoremap <leader><leader>F :call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(expand("<cWORD>")), 1, 0)<CR>
