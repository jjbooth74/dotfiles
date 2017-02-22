let mapleader=","

" PLUG {{
call plug#begin('~/.vim/plugged')
  Plug 'flazz/vim-colorschemes'

  Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-surround'

  Plug 'vim-syntastic/syntastic'
  Plug 'scrooloose/nerdtree'

  Plug 'vimwiki/vimwiki'
call plug#end()
" }}

" call pathogen#infect()

" Make Vim show NERDTree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " execute "Unite -start-insert -no-split file_rec" | endif

scriptencoding utf-8

colorscheme Tomorrow-Night-Eighties


" KEYS {{
  " LEADER = ,
 
  " Use k & j to move lines up and down
  nnoremap <leader>j :m+<cr>
  nnoremap <leader>k :m-2<cr>

  nnoremap <C-p> :FZF<cr>
" }} KEYS


" POWERLINE {{
  set laststatus=2
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
  " set guifont=Inconsolata\ for\ Powerline:h15
  let g:Powerline_symbols = 'fancy'
  set encoding=utf-8
  set t_Co=256
  set fillchars+=stl:\ ,stlnc:\
  " set term=xterm-256color
  set termencoding=utf-8
" }} POWERLINE

" SPLITS {{
  set splitbelow
  set splitright
  " Use ctrl-jklh to navigate splits
  nnoremap <C-j> <C-w><C-j>
  nnoremap <C-k> <C-w><C-k>
  nnoremap <C-l> <C-w><C-l>
  nnoremap <C-h> <C-w><C-h>
" }} SPLITS

" VIM {{
  set nocompatible
  syntax on
  set incsearch
  set hlsearch
  set cursorline
  set showmatch
  filetype plugin indent on
  set tabstop=2
  set shiftwidth=2
  set expandtab

  set number
  set relativenumber
  setlocal numberwidth=5

  set backspace=indent,eol,start

  set wildmenu
  set wildmode=list:longest,full
" }} VIM

" FUZZYFIND {{
  " limit number of results shown for performance
  let g:fuzzy_matching_limit=60
  " ignore stuff that can't be openned, and generated files
  let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.beam;vendor/**;node_modules/**;coverage/**;tmp/**;rdoc/**"
  " increate the number of files scanned for very large projects
  let g:fuzzy_ceiling=20000
  " display relative path, instead of abbrevated path (lib/jeweler.rb vs
  " l/jeweler.rb)
  let g:fuzzy_path_display = 'relative_path'
" }} FUZZYFIND


" NERDTREE {{
  map <C-t> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  let NERDTreeIgnore = ['\.swp$']
 " }} NERDTREE


" SYNTASTIC {{
  " set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*

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
" }} SYNTASTIC


" CURSOR {{
  " TMUX will only forward escape sequences to the terminal if surrounded by a DCS sequence
  " http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
" }} CURSOR
