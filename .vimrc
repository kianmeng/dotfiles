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

" show and remove trailing spaces
" @see https://vi.stackexchange.com/a/843
highlight ws ctermbg=red guibg=red
match ws /\s\+$/
autocmd BufWinEnter * match ws /\s\+$/
autocmd BufWritePre * :%s/\s\+$//ge

" }}}

" >>> Global Key Bindings {{{

" leader key
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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'derekprior/vim-trimmer'
Plug 'dietsche/vim-lastplace'
Plug 'djoshea/vim-autoread'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'mileszs/ack.vim'
Plug 'pjcj/vim-hl-var'
Plug 'sheerun/vim-polyglot'
Plug 'tommcdo/vim-lion'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CycleColor'
Plug 'yegappan/mru'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'w0rp/ale'
Plug 'davidbeckingsale/writegood.vim'

" Add plugins to &runtimepath
call plug#end()

" Ale settings
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let g:ale_perl_perlcritic_showrules = 1
let g:ale_type_map = {
\ 'perlcritic': {'ES': 'WS', 'E': 'W'},
\}

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" Vim-hl-var settings
let g:hlvarhl="ctermbg=black ctermfg=red guifg=#ff0000 guibg=#000000 gui=bold"
set updatetime=500

" supertab settings
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" Speed up auto-completion menu
" @see http://stackoverflow.com/a/2460593/1935866
set complete-=i

" }}}

" >>> Perl {{{
autocmd FileType perl set autoindent
autocmd FileType perl set expandtab
autocmd FileType perl set tabstop=4
autocmd FileType perl set shiftwidth=4
autocmd FileType perl let g:syntastic_perl_lib_path = ['.']
au FileType perl nmap <F12> :%!perltidy<CR>

" }}}
"
" >>> Ruby {{{
autocmd FileType ruby set autoindent
autocmd FileType ruby set expandtab
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set shiftwidth=2

" }}}
"
" >>> Elixir {{{
autocmd FileType elixir set autoindent
autocmd FileType elixir set expandtab
autocmd FileType elixir set tabstop=2
autocmd FileType elixir set shiftwidth=2

" }}}

" }}}
"
" >>> Vue {{{
autocmd FileType vue set autoindent
autocmd FileType vue set expandtab
autocmd FileType vue set tabstop=2
autocmd FileType vue set shiftwidth=2

" }}}

" }}}
"
" >>> Javascript {{{
autocmd FileType javascript set autoindent
autocmd FileType javascript set expandtab
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2

" }}}

" }}}
"
" >>> JSON {{{
autocmd FileType json set autoindent
autocmd FileType json set expandtab
autocmd FileType json set tabstop=2
autocmd FileType json set shiftwidth=2

" }}}

" }}}
"
" >>> HTML {{{
autocmd FileType html set autoindent
autocmd FileType html set expandtab
autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2
autocmd BufRead,BufNewFile *.foo set filetype=html

" }}}

" >>> Auto Commands {{{
if has("autocmd")
    augroup templates
        au BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
    augroup END
endif

" }}}

" >>> Writing {{{
" z= to show suggestion
autocmd FileType gitcommit setlocal spell spelllang=en_gb
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
set complete+=kspell

" }}}
