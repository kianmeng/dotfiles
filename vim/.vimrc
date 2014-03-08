" pathogen plugin initialization
call pathogen#infect()
syntax on
filetype plugin indent on

" tab settings 
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd

" status with required setttings for vim-powerline
" @see https://github.com/Lokaltog/vim-powerline
set ruler
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256       " Tell terminal your console support 256 colors
let g:Powerline_symbols = 'fancy'

" install the ubuntu mono font for vim-powerline
" @see https://github.com/scotu/ubuntu-mono-powerline
" set guifont=Ubuntu\ Mono\ 12

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

" nerdtree
" @see https://github.com/scrooloose/nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" ctags
" $ apt-get install exuberant-ctags
"
" the ; search for tags file from current directory till parent directory
" resursively until it finds a tags file
set tags=tags;
nmap <leader>t :TlistToggle<CR>
nmap <leader>f <C-]>
nmap <leader>g <C-T>
nmap <leader>gt :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>b :TagbarToggle<CR>

" command-t
nmap <Leader>o :CommandT<CR>

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

" Flying is faster than cycling
" @see http://of-vim-and-vigor.blogspot.com/p/vim-vigor-comic.html
nnoremap <leader>l :ls<CR>:b<space>

" Note: disable this as it freeze vim and make vim powerline looses color
" Auto reload ~/.vimrc file upon saving
" @see http://vim.wikia.com/wiki/Change_vimrc_with_auto_reload
" autocmd BufWritePost .vimrc source %

" Short to lauch several conque term tabs
nnoremap <leader>csb :ConqueTermTab bash<CR>
nnoremap <leader>csm :ConqueTermTab mysql -u root -p<CR>

" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

" highlight current line
" set cul
