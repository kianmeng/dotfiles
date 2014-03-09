" set the runtime path to include Vundle and initialize
set nocompatible
filetype off   
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'ervandew/supertab'
Bundle 'tpope/vim-markdown'

" vundle
" @see https://github.com/gmarik/Vundle.vim
" let Vundle manage Vundle, required
"
" install bundle
" - launch vim and run :BundleInstall
" - from command line: vim +BundleInstall +qall
"
Bundle 'gmarik/vundle'

" vim-flake8
" @see https://github.com/nvie/vim-flake8
" sudo pip install flake8
"
Bundle 'nvie/vim-flake8'
let g:flake8_builtins="_,apply"
let g:flake8_ignore="E501,W293"
let g:flake8_max_line_length=99
let g:flake8_max_complexity=10
autocmd BufWritePost *.py call Flake8()

" nerdtree
" @see https://github.com/scrooloose/nerdtree
"
Bundle 'scrooloose/nerdtree.git'
nmap <leader>n :NERDTreeToggle<CR>

" vim-powerline
" @see https://github.com/Lokaltog/vim-powerline
" status with required setttings for vim-powerline
"
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

" ubuntu-mono-powerline
" @see https://github.com/scotu/ubuntu-mono-powerline
" install the ubuntu mono font for vim-powerline
"
Bundle 'scotu/ubuntu-mono-powerline'
set guifont=Ubuntu\ Mono\ 12
set ruler
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256       " Tell terminal your console support 256 colors

" tagbar
"
let g:tagbar_usearrows = 1
nnoremap <leader>b :TagbarToggle<CR>

" ctags
"
" apt-get install exuberant-ctags
" the ; search for tags file from current directory till parent directory
" resursively until it finds a tags file
set tags=tags;
nmap <leader>t :TlistToggle<CR>
nmap <leader>f <C-]>
nmap <leader>g <C-T>
nmap <leader>gt :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" syntax
syntax on
filetype plugin indent on

" tab settings 
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd

" search
set incsearch 
set hlsearch

" keybindings
let mapleader = ","
imap jj <esc>
nmap ; :

" see http://karmanebula.com/technically-borked/2013/12/16/leader-key-as-space-capslock-as-esc
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e
nnoremap <Leader>v :vsplit
nnoremap <Leader>s :split
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>g :vimgrep
nnoremap <Leader>c :copen<CR>
nnoremap <Leader>C :cclose<CR>
nnoremap <Leader>8 :set tw=80<CR>
nnoremap <Leader>0 :set tw=0<CR>
nnoremap <Leader>n :set invnumber<CR>
nnoremap <Leader><TAB> <C-w><C-w>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

nnoremap <Leader>, 2<C-w><
nnoremap <Leader>. 2<C-w>>
nnoremap <Leader>- 2<C-w>-
nnoremap <Leader>= 2<C-w>+



" block the usage of arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" sudo write
" just type :w!! when edit file that need root privileges
ca w!! w !sudo tee >/dev/null "%"

" switch between paste and no paste mode fast and go into insert mode after
" that
" see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p
set showmode

" color scheme
"
" todo: vim-powerline will lost their color if new tab is created if you set
" this up
" colorscheme default

" wild menu. more options shown in command mode
set wildmenu
set wildmode=list:longest,full

" Last file position
" @see http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" flying is faster than cycling
" @see http://of-vim-and-vigor.blogspot.com/p/vim-vigor-comic.html
nnoremap <leader>l :ls<CR>:b<space>

" auto reload ~/.vimrc file upon saving
" disable this as it freeze vim and make vim powerline looses color
" @see http://vim.wikia.com/wiki/Change_vimrc_with_auto_reload
" autocmd BufWritePost .vimrc source %

" Short to lauch several conque term tabs
nnoremap <leader>csb :ConqueTermTab bash<CR>
nnoremap <leader>csm :ConqueTermTab mysql -u root -p<CR>
