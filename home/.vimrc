" pathogen plugin initialization
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on


" tab settings 
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

" status with required setttings for vim-powerline
set ruler
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:Powerline_symbols = 'fancy'

" install the ubuntu mono font for vim-powerline
" @see https://github.com/scotu/ubuntu-mono-powerline
set guifont=Ubuntu\ Mono\ 12

" search
set incsearch 
set hlsearch

" keybindings
let mapleader = ","
imap jj <esc>
nmap ; :

" nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" ctags
" the ; search for tags file from current directory till parent directory
" resursively until it finds a tags file
set tags=tags;
nmap <leader>t :TlistToggle<CR>
nmap <leader>f <C-]>
nmap <leader>g <C-T>

" command-t
nmap <Leader>d :CommandT<CR>

" block the usage of arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
