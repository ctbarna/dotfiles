set nocompatible

set number
set ruler
syntax on
set visualbell

" Vundle
" filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""
" Bundles
"""
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-unimpaired'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/gist-vim'

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

" Status bar
set laststatus=2

" Leader
let mapleader=";"

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
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" refresh CommandT
" autocmd FocusGained * CommandTFlush

" Fix delimitMate nesting quotes for Python.
au FileType python let b:delimitMate_nesting_quotes = ['"']

" delimitMate expand CR
let g:SuperTabCrMapping=0
let delimitMate_expand_cr = 1

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Less syntax.
au BufNewFile,BufRead *.less set filetype=less

" Taskpaper
au BufNewFile,BufRead todo.txt set filetype=taskpaper

" TeX stuff.
au FileType tex let b:delimitMate_quotes = "\" ' $"
au FileType tex setlocal textwidth=79

" Open HTML files.
au FileType html map <Leader>r :!open %<CR>

" Trying out relative line numbers.
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Set EJS files to HTML
au BufRead,BufNewFile *.ejs setfiletype html

" Powerline stuff!
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'

" NerdTree
map <Leader>n :NERDTreeToggle<CR>

" Insert Timestamp
nnoremap <Leader>d diw"=strftime("%s")<CR>P

" Remove trailing whitespace
nnoremap <Leader>w :retab<CR>:%s/\s\+$//eg<CR>:nohl<CR>

" Bind refs and fixes for git commits.
au FileType gitcommit map <Leader>r i<CR>refs #<Esc>"+p
au FileType gitcommit map <Leader>f i<CR>fixes #<Esc>"+p

" Syntastic Settings
let g:syntastic_check_on_open=1

" Quick switching between syntax types.
map <Leader>sp :set filetype=php<CR>
map <Leader>sh :set filetype=html<CR>
map <Leader>sc :set filetype=css<CR>
map <Leader>sj :set filetype=javascript<CR>

" Switch between tabs and spaces
map <Leader>ts :set expandtab
map <Leader>tt :set noexpandtab
