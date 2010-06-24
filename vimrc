" load all the bundles
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set nowrap
set hidden

autocmd BufRead *.html.erb set ft=eruby.html

set nofoldenable " Fuck code folding...

" map control left and control right to swap the buffer
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" map Shift-J to Scroll Down
map J <C-d>
map K <C-u>

" set the LEADER key to ,
let mapleader = ","

" ,v reloads the vimrc -- making all changes active (have to save first)
map <silent> ,v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>:NERDTreeClose<CR>

" Commend-d will toggle the nerdtree drawer
map <D-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader><S-d> :NERDTree %:p:h<CR>
map <leader>d :NERDTree<CR>

" Shift-w maps to Control-W
map <S-w> <C-w>

" ,w will easily switch window focus
map <leader>w <C-w>w

" ,b will load up the buffer explorer
map <leader>b :BufExplorerHorizontalSplit<CR>
let g:bufExplorerSplitBelow=1 

" Setup Command-t shortcut
map <D-t> <leader>t

" Set up Ack shortcuts (literal vs nonliteral)
map <leader>f :Ack -Q 
map <leader><S-f> :Ack 

" Setup Command-e to use ctags (Control-])
map <D-e> <C-]>

" Replicate textmate CMD-[ and CMD-] for indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Easy edit helpers
" http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

set wildignore+=*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.swp,*.jar,*.zip,*.gem,.DS_Store,log/**,tmp/**,coverage/**,rdoc/**

