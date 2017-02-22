let mapleader="\\"

call pathogen#infect()

" Make Vim show NERDTree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " execute "Unite -start-insert -no-split file_rec" | endif

scriptencoding utf-8

colorscheme Tomorrow-Night

set laststatus=2
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set nocompatible

syntax on

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
set relativenumber
setlocal numberwidth=5

set backspace=indent,eol,start

set wildmenu
set wildmode=list:longest,full

" limit number of results shown for performance
let g:fuzzy_matching_limit=60
" ignore stuff that can't be openned, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.beam;vendor/**;node_modules/**;coverage/**;tmp/**;rdoc/**"
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

map <F2> :mksession! ~/.vim_session <cr> " Write a session to file
map <F3> :source ~/.vim_session <cr>     " Restore that session

" Configure Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.bundler/',
      \ '\.cache/',
      \ '\.vendor/',
      \ '\.log',
      \ '\.vagrant',
      \ 'node_modules/',
      \ ], '\|'))

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%C:%m
  let g:unite_source_grep_command='ag'
  let g:unite_source_rec_async_command = 
    \ ['ag', '--follow', '--nocolor', '--nogroup',
    \  '--hidden', '--ignore', '.git', '-g', '']
endif

function! s:unite_settings()
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <esc> <plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()

nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <C-b> :Unite -start-insert buffer<cr>


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_exec = 'eslint-project-relative'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Use k & j to move lines up and down
nnoremap <leader>j :m+<cr>
nnoremap <leader>k :m-2<cr>

" TMUX will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

