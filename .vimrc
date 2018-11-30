" vim: fdm=marker ts=4 sw=4 tw=0 et:

" >>> General {{{

" Disable vi-compatibility. This should always set first.
set nocompatible

" }}}

" >>> Indentation {{{

" Enable language-dependent indenting.
filetype plugin indent on

" Global indentation settings, overriden by ftplugin.
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" }}}

" >>> User Interfaces {{{

" Syntax & color scheme
syntax on

" Tell terminal your console support 256 colors. Set before colorscheme.
set t_Co=256
colorscheme default
set background=light

" status bar
set ruler
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set number
set showcmd
set showmode
" prevent cursor stuck at top or bottom
" @see https://news.ycombinator.com/item?id=9574469
set scrolloff=6

" ignore case when in ex (command) mode
" @see http://stackoverflow.com/a/10308100
set ignorecase
set smartcase

" search
set gdefault " /g search and replace globally by default
set incsearch
set hlsearch
nmap <silent> ,/ :nohlsearch<CR>

" wild menu. more options shown in command mode
set wildmenu

set wildmode=list:longest,full

" fold settings
set nofoldenable
set foldmethod=indent
set foldlevel=1

" hides buffers and don't close them
set hidden

" set filename in Tmux tab
" @see http://stackoverflow.com/a/29693196/1935866
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title

" copy and paste from mouse
" @see http://unix.stackexchange.com/a/140584
set mouse=r

" full screen when starting gvim
" @see http://vim.wikia.com/wiki/Maximize_or_set_initial_window_size
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window (for an alternative on Windows, see simalt below).
    set lines=999 columns=999
else
    " This is console Vim.
    if exists("+lines")
        set lines=50
    endif
    if exists("+columns")
        set columns=100
    endif
endif

" font
if has("gui_running")
    set guifont=Monospace\ 14
endif

" }}}

" >>> Global Key Bindings {{{

" leader key
let mapleader = "\<Space>"

" trigger vim-which-key
nnoremap    <silent> <leader> :WhichKey '<Space>'<CR>

" Key bindings which use <leader> key. In alphabetical order.
nmap        <leader>- <C-w>-            " decrease pane size
map         <leader>= <C-w>+            " increase pane size
nnoremap    <Leader>/ :nohlsearch<cr>   " clear current search

nmap        <Leader>e :CtrlP<cr>
nmap        <Leader>ee :MRU<cr>
nmap        <Leader>b :Ack<space>

nmap        <Leader>ga <Plug>GitGutterStageHunk
nmap        <leader>gj <Plug>GitGutterNextHunk
nmap        <leader>gk <Plug>GitGutterPrevHunk
nmap        <Leader>gr <Plug>GitGutterUndoHunk
nmap        <Leader>gv <Plug>GitGutterPreviewHunk

nnoremap    <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap    <leader>l :ls<CR>:b<space>  " flying is faster than cycling
map         <leader>o <C-w><C-w>        " switch pane
nnoremap    <leader>q :q<cr>            " quit
nnoremap    <leader>s :w<cr>            " save file
nnoremap    <leader>w :wqa<cr>          " save and quit

nnoremap    <leader>xh <C-w>S<C-w>l     " split horizontally and switch over it
nnoremap    <leader>xv <C-w>v<C-w>l     " split vertically and switch over it

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

" Session management
map <F2> :mksession! ~/.vim/session <CR>
map <F3> :source ~/.vim/session <CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}

" >>> Plugins {{{

" Automatic vim-plug installation
" @see https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin plugins bootstrap
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekprior/vim-trimmer'
Plug 'dietsche/vim-lastplace'
Plug 'djoshea/vim-autoread'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'mileszs/ack.vim'
Plug 'myint/syntastic-extras'
Plug 'pjcj/vim-hl-var'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tommcdo/vim-lion'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CycleColor'
Plug 'yegappan/mru'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'liuchengxu/vim-which-key'

" Add plugins to &runtimepath
call plug#end()

" Syntastic settings
set statusline+=%#warningmsg#
" TODO: error showing up
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

let g:syntastic_make_checkers       = ['gnumake']
let g:syntastic_python_checkers     = ['pylint', 'flake8']
let g:syntastic_php_checkers        = ['php', 'phpcs', 'phpmd']
let g:syntastic_perl_checkers       = ['perl', 'podchecker']
let g:syntastic_enable_perl_checker = 1
let gLsyntastic_debug               = 1
let g:syntastic_gitcommit_checkers  = ['language_check']
let g:syntastic_svn_checkers        = ['language_check']

" Vim-hl-var settings
let g:hlvarhl="ctermbg=black ctermfg=red guifg=#ff0000 guibg=#000000 gui=bold"
set updatetime=500

" CtrlP settings
" @see http://stackoverflow.com/a/17327372/1935866
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use Ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" supertab settings
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" Speed up auto-completion menu
" @see http://stackoverflow.com/a/2460593/1935866
set complete-=i

" }}}

" >>> Auto Commands {{{

" Auto-reload your .vimrc
" @see http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" }}}
