call pathogen#infect()
set nocompatible

set number
set ruler
syntax on
set visualbell

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
filetype plugin indent on

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.pyc

" Status bar
set laststatus=2

" Leader
let mapleader="."

set statusline=%{fugitive#statusline()}
set wildignore+=*.png

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

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupWrapping()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" refresh CommandT
autocmd FocusGained * CommandTFlush

" Fix delimitMate nesting quotes for Python.
au FileType python let b:delimitMate_nesting_quotes = ['"']

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Less syntax.
au BufNewFile,BufRead *.less set filetype=less

" TeX stuff.
au FileType tex let b:delimitMate_quotes = "\" ' $"
au FileType tex setlocal textwidth=79

" Open HTML files.
au FileType html map <Leader>r :!open %<CR>