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

" status
set ruler
set laststatus=2

" search
set incsearch 
set hlsearch

" keybindings
let mapleader = ","
imap jj <esc>
nmap ; :

nmap <leader>t :NERDTreeToggle<CR>
