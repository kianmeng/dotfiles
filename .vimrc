" vim: fdm=marker ts=4 sw=4 tw=0 et:

" Automatic vim-plug installation
" @see https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin plugins bootstrap
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'davidbeckingsale/writegood.vim'
Plug 'dense-analysis/ale'
Plug 'derekprior/vim-trimmer'
Plug 'dietsche/vim-lastplace'
Plug 'djoshea/vim-autoread'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'pjcj/vim-hl-var'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'yegappan/mru'

" Add plugins to &runtimepath
call plug#end()

" Disable vi-compatibility. This should always set first.
set nocompatible

" Enable language-dependent indenting.
filetype plugin indent on

" Global indentation settings, overriden by ftplugin.
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Syntax & color scheme
syntax on

" Tell terminal your console support 256 colors. Set before colorscheme.
set t_Co=256
silent! colorscheme molokai
set background=light

" Status bar
set ruler
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set number
set showcmd
set showmode
" Prevent cursor stuck at top or bottom
" @see https://news.ycombinator.com/item?id=9574469
set scrolloff=6

" Ignore case when in ex (command) mode
" @see http://stackoverflow.com/a/10308100
set ignorecase
set smartcase

" Search
set gdefault " /g search and replace globally by default
set incsearch
set hlsearch
nmap <silent> ,/ :nohlsearch<CR>

" Wild menu. more options shown in command mode
set wildmenu
set wildmode=list:longest,full

" Speed up auto-completion menu
" @see http://stackoverflow.com/a/2460593/1935866
set complete-=i

" Fold settings
set nofoldenable
set foldmethod=indent
set foldlevel=1

" Hides buffers and don't close them
set hidden

" Set filename in Tmux tab
" @see http://stackoverflow.com/a/29693196/1935866
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title

" Copy and paste from mouse
" @see http://unix.stackexchange.com/a/140584
set mouse=r

" Show and remove trailing spaces
" @see https://vi.stackexchange.com/a/843
highlight ws ctermbg=red guibg=red
match ws /\s\+$/
autocmd BufWinEnter * match ws /\s\+$/
autocmd BufWritePre * :%s/\s\+$//ge

" Leader key
let mapleader = "\<Space>"

" Key bindings which use <leader> key. In alphabetical order.
nmap        <leader>- <C-w>-            " decrease pane size
map         <leader>= <C-w>+            " increase pane size
nnoremap    <Leader>/ :nohlsearch<cr>   " clear current search

nmap        <Leader>e :FZF<cr>
nmap        <Leader>b :Rg<space>

noremap     <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap    <leader>l :ls<CR>:b<space>  " flying is faster than cycling
map         <leader>o <C-w><C-w>        " switch pane
nnoremap    <leader>q :q<cr>            " quit
nnoremap    <leader>s :w<cr>            " save file
nnoremap    <leader>w :wqa<cr>          " save and quit

nnoremap    <leader>z :q!<cr>           " force quit without saving

" Copy & paste to / from system clipboard.
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
nmap <Leader>P "+p

" Tags navigation
set autochdir
set tags+=./tags;

nmap <leader>f <C-]>
nmap <leader>d <C-T>
nmap <leader>tt :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Save your left/right pinky.
imap jj <esc>
nmap ; :
noremap ;; ;

" block the usage of arrow keys
nnoremap <Left>     :echoe "Use h"<CR>
nnoremap <Right>    :echoe "Use l"<CR>
nnoremap <Up>       :echoe "Use k"<CR>
nnoremap <Down>     :echoe "Use j"<CR>

" Prevent accidentally invoking Ex mode. You don't need it.
" @see http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q :echoe "CAP LOCK is on!"<CR>

" Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}


" Ale settings
let g:ale_linters = {
\   'text': ['proselint']
\}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" Vim-hl-var settings
let g:hlvarhl="ctermbg=black ctermfg=red guifg=#ff0000 guibg=#000000 gui=bold"
set updatetime=500

" Supertab settings
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" Default template based on file type.
if has("autocmd")
    augroup templates
        au BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
    augroup END
endif

" Spelling
" z= to show suggestion
autocmd FileType gitcommit setlocal spell spelllang=en_gb
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
set complete+=kspell

" View chinese encoded file
set fileencodings=utf8,cp936,gb18030,big5

" Custome local config
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
