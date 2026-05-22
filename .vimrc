" vim: fdm=marker ts=4 sw=4 tw=0 et:

" --- Core Initialization ---
set nocompatible
filetype plugin indent on
syntax on

" Automatic vim-plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" --- Plugins ---
call plug#begin()
Plug 'airblade/vim-gitgutter'          " Git status in sign column
Plug 'dense-analysis/ale'              " Async Linting/Fixing
Plug 'farmergreg/vim-lastplace'        " Reopen at last position
Plug 'ervandew/supertab'               " Tab completion
Plug 'djoshea/vim-autoread'            " Reload file on change
Plug 'itchyny/lightline.vim'           " Lightweight statusline
Plug 'sheerun/vim-polyglot'            " Language pack
Plug 'tpope/vim-commentary'            " gc to comment
Plug 'yegappan/mru'                    " Most Recently Used
call plug#end()

" --- UI & Appearance ---
set t_Co=256
silent! colorscheme molokai
set background=light    " Preferred light for constrast
set number              " Show line numbers
set ruler               " Show cursor position
set laststatus=2        " Always show status bar
set noshowmode          " Lightline handles this
set scrolloff=6         " Keep context above/below cursor
set title               " Set terminal title
set encoding=utf-8      " Support unicode
set list                " Show invisible characters
set listchars=tab:»\ ,trail:· " Visually show trailing spaces and tabs

" --- Indentation & Formatting ---
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set hidden              " Allow switching buffers without saving

" --- Search ---
set ignorecase
set smartcase           " Case-sensitive if uppercase used
set gdefault            " Global replace by default
set incsearch           " Incremental search
set hlsearch            " Highlight results
set complete-=i         " Don't scan included files for completion (faster)

" --- Mappings ---
let mapleader = "\<Space>"

" System Clipboard (Syncs default register with OS)
if has('unnamedplus')
    set clipboard=unnamedplus
endif

" Utilities
nmap <silent> <leader>/ :nohlsearch<CR>
imap jj <esc>
nmap ; :
noremap ;; ;

" Navigation & Windows
nnoremap <leader>o <C-w><C-w>
nnoremap <leader>l :ls<CR>:b<space>
nmap <leader>- <C-w>-
nmap <leader>= <C-w>+

" Quick Actions
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :wqa<cr>
nnoremap <leader>z :q!<cr>

" Grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>e :MRU<space>

" Anti-Bad-Habits
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
nnoremap Q       :echoe "Ex mode disabled"<CR>

" --- Autocommands ---
if has("autocmd")
    " Tmux integration
    if $TMUX != ""
        autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
        autocmd VimLeave * call system("tmux rename-window bash")
    endif

    " Clean trailing whitespace on save
    autocmd BufWritePre * :%s/\s\+$//ge

    " Templates
    augroup templates
        autocmd!
        autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
    augroup END

    " Spellcheck for specific files
    autocmd FileType gitcommit,markdown setlocal spell spelllang=en_gb
endif

set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" --- Plugin Configuration ---
" ALE
let g:ale_linters = {'text': ['proselint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" --- Local Overrides ---
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
