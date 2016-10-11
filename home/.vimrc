let mapleader="\<cr>"

call pathogen#infect()

" Make Vim show NERDTree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " execute "Unite -start-insert -no-split file_rec" | endif

scriptencoding utf-8

colorscheme Tomorrow-Night

set nocompatible
syntax on

filetype plugin indent on

" Make new splits open in the right spot
set splitbelow
set splitright
" Use ctrl-jklh to navigate splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

set incsearch

set hlsearch

set cursorline

set showmatch

" set smarttab
filetype plugin indent on
" show existing tab with 4 space width
set tabstop=2
" when indenting with '>' use 2 spaces
set shiftwidth=2
" Tab inserts 2 spaces
set expandtab

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


" map <C-g> :tabp<CR>
" map <C-h> :tabn<CR>
map <C-n> :tabnew<CR>
map <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$']

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
" au CursorHold * if getcmdwintype() == '' | checktime | endif

map <F2> :mksession! ~/.vim_session <cr> " Write a session to file
map <F3> :source ~/.vim_session <cr>     " Restore that session

" Configure Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec', 'ignore_pattern', 'coverage/')
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <C-b> :Unite -start-insert buffer<cr>
