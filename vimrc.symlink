set shell=/bin/bash
set nocompatible

set number
set ruler
syntax on
set visualbell

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""
" Bundles
"""
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-smartinput'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'sheerun/vim-polyglot'

call vundle#end()
filetype plugin indent on    " required

" Set encoding
set encoding=utf-8

colorscheme solarized
set background=dark

" Whitespace stuff
set tw=79
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set list listchars=tab:\ \ ,trail:·
filetype plugin indent on

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.pyc

" Make CtrlP only search files in git
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Status bar
set laststatus=2

" Leader
let mapleader=","

set statusline=%{fugitive#statusline()}
set wildignore+=*.png,env/**

" Directories for swp files.
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Taken from https://github.com/garybernhardt/dotfiles/
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Janus
function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" make uses real tabs
au FileType make set noexpandtab

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupWrapping()
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Autocomplete/highlight dashes in SCSS
autocmd FileType scss set iskeyword+=-

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Open HTML files.
au FileType html map <Leader>r :!open %<CR>

" Trying out relative line numbers.
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Powerline stuff!
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'

" Remove trailing whitespace
nnoremap <Leader>w :retab<CR>:%s/\s\+$//eg<CR>:nohl<CR>

" Syntastic Settings
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_scss_checkers = ['stylelint']

" Clear a search
map <Leader>x :nohl<CR>

" Insert a space in normal mode.
nmap <space> i <esc>
