
"" Include user's local vim config
" if filereadable(expand("~/.config/nvim/local_init.vim"))
  "source ~/.config/nvim/local_init.vim
" endif
let mapleader=','
inoremap jk <esc>
nnoremap <leader><space> :nohl<cr>

" run file
autocmd FileType javascript, javascirpt.jsx, jsx nnoremap <leader>r :w<cr>:clear<cr>:!node %<cr>
