" auto install Vunde if not found, for fresh install.
" @see http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=0
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle...\n"
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=1
endif

" set the runtime path to include Vundle and initialize
set nocompatible
filetype off   
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" keybindings
let mapleader = ","
imap jj <esc>
nmap ; :
noremap ;; ;

" supertab
" @see https://github.com/ervandew/supertab
" @see http://vim.wikia.com/wiki/Omni_completion_popup_menu
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

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
autocmd BufWritePost *.py call Flake8()

" nerdtree
" @see https://github.com/scrooloose/nerdtree
"
Bundle 'scrooloose/nerdtree.git'
nmap <leader>nn :NERDTreeToggle<CR>

" vim-airline
" @see https://github.com/bling/vim-airline
" @see https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
"
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
"set guifont=Ubuntu\ Mono\ 12
set ruler
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256       " Tell terminal your console support 256 colors

" conque-shell
" @see https://github.com/oplatek/Conque-Shell
" Short to lauch several conque term tabs
"
Bundle 'oplatek/Conque-Shell'
nnoremap <leader>bb :ConqueTermTab bash<CR>
nnoremap <leader>pp :ConqueTermTab psql -U kianmeng<CR>
nnoremap <leader>mm :ConqueTermTab mysql -u root -p<CR>

" tagbar
" @see https://github.com/majutsushi/tagbar
"
" works for python
"
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" add support for markdown files in tagbar.
" @see http://github.com/jszakmeister/markdown2ctags
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/bin/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" groovy
let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
\ }

" syntastic
" @see https://github.com/scrooloose/syntastic
" @see http://pear.phpmd.org
"
" Python
" sudo apt-get install pylint
"
" PHP
" sudo apt-get install php-pear
"
" sudo pear install PHP_CodeSniffer
"
" sudo pear channel-discover pear.phpmd.org
" sudo pear channel-discover pear.pdepend.org
" sudo pear install pear.pdepend.org/PHP_Depend
" sudo pear install phpmd/PHP_PMD
"
Bundle 'scrooloose/syntastic.git'
" overwrite by vim-flake8 plugin
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

Bundle 'taglist.vim'
" taglist
"
" the ; search for tags file from current directory till parent directory
" resursively until it finds a tags file
"
" works for php
"
" sudo apt-get install exuberant-ctags
"
set tags=tags;
nmap <leader>t :TlistToggle<CR>
nmap <leader>f <C-]>
nmap <leader>g <C-T>
nmap <leader>gt :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" ----
"  vim-hackernews
" @see https://github.com/ryanss/vim-hackernews
Bundle 'ryanss/vim-hackernews'
" ----

" ----
" nimrod
" syntax file for Nim programming language
" @see https://github.com/zah/nimrod.vim/
Bundle 'zah/nimrod.vim'
" ----

" ----
"  rainbow parentheses
"  @see https://github.com/kien/rainbow_parentheses.vim
Bundle 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" ----

" ----
" vim bundle for racket lang
" @see https://github.com/wlangstroth/vim-racket
Bundle 'wlangstroth/vim-racket'
" ----

" ----
" vim bundle for vim-mkdir
" @see https://github.com/pbrisbin/vim-mkdir
Bundle 'pbrisbin/vim-mkdir'
" ----

" ----
" Fuzzy file, buffer, mru, tag, etc finder.
" @see https://github.com/kien/ctrlp.vim
Bundle 'kien/ctrlp.vim'
nmap <leader>o :CtrlP<CR>
" ----

" ----
" Vim plugins for Drupal
" @see https://www.drupal.org/node/1389448#vundle
Bundle 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}
" ----

" ----
" No more :set paste !!!
Bundle 'ConradIrwin/vim-bracketed-paste'
" ----

" syntax & color scheme
syntax on
filetype plugin indent on

" color scheme
colorscheme default

" wild menu. more options shown in command mode
set wildmenu
set wildmode=list:longest,full

" omni complete
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" tab settings 
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" misc settings
set number
set showcmd
" prevent cursor stuck at top or bottom
" @see https://news.ycombinator.com/item?id=9574469
set scrolloff=6

" ignore case when in ex (command) mode
" @see http://stackoverflow.com/a/10308100
set ignorecase
set smartcase

" search
set incsearch 
set hlsearch

" block the usage of arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" tab management
" @see https://news.ycombinator.com/item?id=9574678
nnoremap U :tabprevious<CR>
nnoremap I :tabnext<CR>
nnoremap N :tabnew<CR>
nnoremap E :tabedit

" sudo write
" just type :w!! when edit file that need root privileges
ca w!! w !sudo tee >/dev/null "%"

" switch between paste and no paste mode fast and go into insert mode after
" that
" @see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p
set showmode

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

" auto install Vunde if not found, for fresh install.
" @see http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
if iCanHazVundle == 1
    echo "Installing Bundles...\n"
    :BundleInstall
endif
