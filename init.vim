source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
" source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/general/key-mappings.vim
" source $HOME/.config/nvim/keys/which-key.vim

" source $HOME/.config/nvim/plug-config/*.vim
"
" for i in split(globpath('./plug-config/', '*.vim'), '\n')
"   echo expand(fnamemodify(i, ':p'))
" endfor

" Source depending on if VSCode is our client
if exists('g:vscode')
  " VSCode extension from
  " https://github.com/ChristianChiarulli/nvim/blob/master/vscode/windows.vim
  " which I am not sure if I want or not yet
  " source $HOME/.config/nvim/vscode/windows.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
else
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/fugitive.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
  source $HOME/.config/nvim/plug-config/hardtime.vim
  source $HOME/.config/nvim/plug-config/rg.vim
  source $HOME/.config/nvim/plug-config/test.vim
  source $HOME/.config/nvim/plug-config/todo-lists.vim
endif
