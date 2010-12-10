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

" nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" ctags
" the ; search for tags file from current directory till parent directory
" resursively until it finds a tags file
set tags=tags;
nmap <leader>t :TlistToggle<CR>
nmap <leader>f <C-]>
nmap <leader>g <C-T>
