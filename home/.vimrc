call pathogen#infect()

scriptencoding utf-8

colorscheme atom-dark

set nocompatible
syntax on

filetype plugin indent on

set incsearch

set hlsearch

set cursorline

set showmatch

set smarttab

set number
setlocal numberwidth=5

set wildmenu
set wildmode=list:longest,full

set backspace=indent,eol,start

" limit number of results shown for performance
let g:fuzzy_matching_limit=60
" ignore stuff that can't be openned, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.beam;vendor/**;coverage/**;tmp/**;rdoc/**"
" increate the number of files scanned for very large projects
let g:fuzzy_ceiling=20000
" display relative path, instead of abbrevated path (lib/jeweler.rb vs
" l/jeweler.rb)
let g:fuzzy_path_display = 'relative_path'

autocmd vimenter * NERDTree

map <C-g> :tabp<CR>
map <C-h> :tabn<CR>
map <C-n> :tabnew<CR>
