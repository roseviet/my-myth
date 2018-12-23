let mapleader = ','

set number
set incsearch hlsearch
set ignorecase smartcase
set clipboard=unnamed
set scrolloff=5
set showmode
set surround

inoremap jk <Esc>
vnoremap jk <Esc>

nnoremap <leader><space> :nohl<CR>

nnoremap <leader>r :action Replace<CR>
nnoremap <leader>/ :action Find<CR>

nnoremap / /

" nnoremap n :action FindNext<CR>
" nnoremap N :action FindPrevious<CR>
"
nnoremap U :action $Redo<CR>
" nnoremap ; :action AceJumpAction<CR>
"
nnoremap <leader>R: action Run<CR>

nnoremap y: action $Copy<cr>
nnoremap p: action $Paste<cr>

" quick fix
nnoremap <leader>qf :action ShowIntentionActions<CR>


" explore
nnoremap <leader>e :action GotoFile<CR>

" buffer
nnoremap <leader>b :action RecentFiles<CR>

" bookmark
nnoremap m :action ToggleBookmark<CR>
nnoremap <leader>m :action ShowBookmarks<CR>

nnoremap <leader>h :action QuickJavaDoc<CR>

nnoremap g; :action JumpToLastChange<CR>
nnoremap g, :action JumpToNextChange<CR>
nnoremap gj :action VimMotionJumpNext<CR>
nnoremap gk :action VimMotionJumpPrevious<CR>

" action map specific IDE support
nnoremap <leader>ga :action GotoAction<cr>
nnoremap <leader>gc :action GotoClass<CR>
nnoremap <leader>gd :action GotoDeclaration<cr>
nnoremap <leader>gi :action GotoImplementation<cr>
nnoremap <leader>gs :action GotoSuperMethod<cr>

" format
nnoremap <leader>fp :action ReformatWithPrettierAction<cr>

nnoremap <leader>ff :action FindInPath<cr>
nnoremap <leader>fs :action FileStructurePopup<CR>
nnoremap <leader>fu :action FindUsages<cr>
nnoremap <leader>su :action ShowUsages<cr>
nnoremap <leader>sn :action ShowNavBar<cr>
nnoremap <leader>sf :action SelectInProjectView<cr>
nnoremap <leader>cv :action ChangeView<cr>

nnoremap <leader>ic :action InspectCode<cr>
nnoremap <leader>oi :action OptimizeImports<cr>

nnoremap ]e :action GotoNextError<cr>
nnoremap [e :action GotoPreviousError<cr>

" plugin
inoremap <leader>es <esc>:action SurroundWithEmmet<cr>

