call pathogen#infect()
set nocompatible

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

colorscheme solarized

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set cindent
set smartindent
set autoindent

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Leader
let mapleader="."

set statusline=%{fugitive#statusline()}
set wildignore+=*.png
set columns=84
set lines=55
set guifont=Menlo:h16

" Directories for swp files.
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Taken from https://github.com/garybernhardt/dotfiles/
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

set pvh=15
" au BufEnter ?* if &pvw | let &l:wh=&pvh | endif

function NerdTreeEnter()
  if exists("t:NERDTreeBufName")
    if expand("<afile>") == t:NERDTreeBufName
      set columns=115
      NERDTree
    endif
  endif
endfunction

function NerdTreeExit()
  if exists("t:NERDTreeBufName")
    if expand("<afile>") == t:NERDTreeBufName
      set columns=84
    endif
  endif
endfunction

autocmd BufWinEnter * :call NerdTreeEnter()
autocmd BufWinLeave * :call NerdTreeExit()
