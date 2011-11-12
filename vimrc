colorschem vividchalk

if has("mac")
    let $PATH = '/opt/local/bin:/opt/local/sbin'.$PATH
endif

" no vi compatibility
set nocompatible

" load all the bundles
call pathogen#runtime_append_all_bundles()

let snips_author = 'Chifung Cheung'

filetype plugin indent on
syntax on

" General Settings
set nowrap
set hidden
" set list "show invisibles
set nolist

" Tabs
set tabstop=2 " Use 2 spaces for tabs
set smarttab " Automatic indenting
set shiftwidth=2 " sets spaces used for indention
set autoindent " continue indention from previous line
set expandtab " tab key inserts spaces instead of tabs
set backspace=2 " start,indent

" Do not use swapfiles or backup since writebackup is used
" writebackup is still used, so a copy is always kept in memory
set nobackup " Do not write backup files to disk
set noswapfile " Do not use swapfiles (they have trouble with large files)

set wildignore+=*.bak,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.swp,*.jar,*.zip,*.gem,.DS_Store,log/**,tmp/**,coverage/**,rdoc/**

" additional support for some file types
autocmd BufRead *.html.erb set ft=eruby-rails.html
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

set nofoldenable " Fuck code folding...

set whichwrap+=<,>,h,l " allow backspace and cursor keys to cross line boundaries

" A vim function that keeps your state
" http://technotales.wordpress.com/2010/03/31/preserve
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

imap qq <ESC>
imap ^^ <ESC>^i
imap ¥¥ <ESC>$a

map ¥ $

" map control left and control right to swap the buffer
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k


" map Command-j to Scroll Down
map <D-j> <C-d>
" map Command-k to Scroll Up
map <D-k> <C-u>

" map Shift-U to REDO
map <S-u> <C-r>

" set the LEADER key to ,
let mapleader = ","

:noremap ,h :vsp^M^W^W<CR>
:noremap ,k :split^M^W^W<CR>
:noremap ,r `.
:noremap ,@ <ESC>:b#<CR>

" Leader-u reloads the vimrc -- making all changes active (have to save first)
map <silent> ,u :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>:NERDTreeClose<CR>

" NERDTree (Command-d / Leader-d)
map <leader>d :NERDTreeToggle<CR>
" map <D-d> :NERDTreeToggle<CR>
map <leader>n :NERDTree<CR>
map <D-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
" navigates nerdtree to the current file
map <leader><S-d> :NERDTree %:p:h<CR>

map <leader>w :set nowrap!<CR>

" NERD Commenter Sucks balls. Use tComment instead!
" nmap <D-/> gc
" vmap <D-/> gcgv

" Toggle show invisibles
nmap <leader>l :set list!<CR>

" Shift-w maps to Control-W
map <S-w> <C-w>

" ,w will easily switch window focus
map <leader>s <C-w>w

" ,b will load up the buffer explorer
map <leader>b :BufExplorerHorizontalSplit<CR>
let g:bufExplorerSplitBelow=1

" Setup Command-t shortcut
map <D-t> <leader>t
let g:CommandTMatchWindowAtTop=1

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

" Replicate textmate shift arrow/movement in order to select stuff
nmap <S-up> vk
vmap <S-up> k
nmap <S-k> vk
vmap <S-k> k

nmap <S-right> vl
vmap <S-right> l
nmap <S-l> vl
vmap <S-l> l

nmap <S-down> vj
vmap <S-down> j
nmap <S-j> vj
vmap <S-j> j

nmap <S-left> v
vmap <S-left> h
nmap <S-h> vh
vmap <S-h> h

" Clean up the trailing spaces
nmap <leader><S-s> :call Preserve("%s/\\s\\+$//e")<CR>

" Retab the document (tabs to spaces)
nmap <silent> <leader><S-t> :retab!<CR>


" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1

imap <C-CR> <Plug>(neocomplcache_snippets_expand)
smap <C-CR> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
        function! s:check_back_space()"{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~ '\s'
        endfunction"}}
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-j> pumvisible() ? "\<Down>" : "\<C-j>" 
inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<C-k>" 

inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
