" BASICS {{{
  let mapleader="\<cr>"
  scriptencoding utf-8
" }}}

" PLUG {{{
  set rtp+=/usr/local/opt/fzf
  call plug#begin('~/.vim/plugged')
    " Make VIM more application like
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'flazz/vim-colorschemes'
    Plug 'chriskempson/base16-vim'
    Plug 'guns/xterm-color-table.vim'
    Plug 'cskeeters/vim-smooth-scroll'
    Plug 'jceb/vim-editqf'
    Plug 'nathanaelkane/vim-indent-guides' " adds visual indentation

    " Text manipulation
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
    Plug 'michaeljsmith/vim-indent-object' " creates ii/ai/aI text objects

    " Language Support
    Plug 'vim-syntastic/syntastic'
    Plug 'kana/vim-textobj-user'
    Plug 'nelstrom/vim-textobj-rubyblock'
    Plug 'kchmck/vim-coffee-script'
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'shmup/vim-sql-syntax'

    " IDE
    Plug 'craigemery/vim-autotag'
    Plug 'majutsushi/tagbar'

    " Applications in and of themselves
    Plug 'vimwiki/vimwiki'
    Plug 'jreybert/vimagit', { 'on': ['Magit'] }

    " Tmux
    Plug 'christoomey/vim-tmux-navigator'
  call plug#end()
" }}}

" COLORS {{{
  " let base16colorspace=256
  " colorscheme Tomorrow-Night-Bright
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
" }}}

" FZF {{{
  let g:fzf_command_prefix = 'Fzf'
  nnoremap <C-p> :FzfGFiles<cr>
  nnoremap <C-b> :FzfBuffers<cr>
  nnoremap <leader>ag :FzfAg 
  nnoremap <leader>af :QfAg 
" }}}

" KEYS {{{
  " LEADER = <cr>
 
  " Use <leader> k & j to move lines up and down
  nnoremap <leader>j :m+<cr>
  nnoremap <leader>k :m-2<cr>

  " Toggle linting
  nnoremap <leader>r :SyntasticToggleMode<cr>

  " Magit opens in a split-right pane.
  " This creates a new blank tab, opens Magit,
  " then closes the left split
  nnoremap <leader>gg :tabe<cr>:Magit<cr><C-w><C-h>:close<cr>

  " Start interactive easy align in visual mode (vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (gaip)
  nmap ga <Plug>(EasyAlign)

  nnoremap <leader>tag :TagbarToggle<cr>
" }}}

" TAB NAV {{{
  function! TabOrBuffer(...)
    let l:tab = (a:0 >= 1) ? a:1 : 'tab'
    let l:buf = (a:0 >= 2) ? a:2 : 'b'
    let l:cmd = (tabpagenr('$') > 1) ? l:tab : l:buf
    return l:cmd
  endfunction

  function! Move_tab_or_buffer(direction)
    execute TabOrBuffer() . a:direction
  endfunction
  command! NextFile call Move_tab_or_buffer("n")
  command! PrevFile call Move_tab_or_buffer("p")

  function! Close_tab_or_buffer()
    execute TabOrBuffer('tabclose', 'bd')
  endfunction
  command! CloseFile call Close_tab_or_buffer()

  function! SelectBufferOrTab(n)
    execute TabOrBuffer('tabn ', 'b ') . a:n
  endfunction

  nnoremap <leader>t :NextFile<cr>
  nnoremap <leader>T :PrevFile<cr>
  nnoremap <leader>x :CloseFile<cr>
  nnoremap <leader>1 :call SelectBufferOrTab(1)<cr>
  nnoremap <leader>2 :call SelectBufferOrTab(2)<cr>
  nnoremap <leader>3 :call SelectBufferOrTab(3)<cr>
  nnoremap <leader>4 :call SelectBufferOrTab(4)<cr>
  nnoremap <leader>5 :call SelectBufferOrTab(5)<cr>
  nnoremap <leader>6 :call SelectBufferOrTab(6)<cr>
  nnoremap <leader>7 :call SelectBufferOrTab(7)<cr>
  nnoremap <leader>8 :call SelectBufferOrTab(8)<cr>
  nnoremap <leader>9 :call SelectBufferOrTab(9)<cr>
" }}}

" SMOOTH-SCROLL {{{
  let g:ms_per_line = 15
" }}}

" POWERLINE {{{
  set laststatus=2
  set showtabline=2
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
" }}} POWERLINE

" SPLITS {{{
  set splitbelow
  set splitright
  " Use ctrl-jklh to navigate splits
  nnoremap <C-j> <C-w><C-j>
  nnoremap <C-k> <C-w><C-k>
  nnoremap <C-l> <C-w><C-l>
  nnoremap <C-h> <C-w><C-h>
" }}} SPLITS

" GENERAL {{{
  set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:< ",space:·
  set list
  set clipboard=unnamed
  set cursorline
  set hlsearch
  set showmatch
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set number
  set relativenumber
  setlocal numberwidth=5
  set wildmode=list:longest,full
  set nocompatible
" }}}

" FUZZYFIND {{{
  " limit number of results shown for performance
  let g:fuzzy_matching_limit=60
  " ignore stuff that can't be openned, and generated files
  let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.beam;vendor/**;node_modules/**;coverage/**;tmp/**;rdoc/**"
  " increate the number of files scanned for very large projects
  let g:fuzzy_ceiling=20000
  " display relative path, instead of abbrevated path (lib/jeweler.rb vs
  " l/jeweler.rb)
  let g:fuzzy_path_display = 'relative_path'
" }}} FUZZYFIND

" NERDTREE {{{
  map <C-t> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  let NERDTreeIgnore = ['\.swp$']
  " Make Vim show NERDTree on startup
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " execute "Unite -start-insert -no-split file_rec" | endif
" }}} NERDTREE

" SYNTASTIC {{{
  " set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0

  let g:syntastic_error_symbol = '❌'
  let g:syntastic_warning_symbol = '⚠️'
  let g:syntastic_style_error_symbol = '⁉️'
  let g:syntastic_style_warning_symbol = '💩'

  highlight link SyntasticErrorSign SignColumn
  highlight link SyntasticWarningSign SignColumn
  highlight link SyntasticStyleErrorSign SignColumn
  highlight link SyntasticStyleWarningSign SignColumn

  " JS
  let g:syntastic_javascript_checkers = ["eslint"]
  let g:syntastic_javascript_eslint_exec = 'eslint-project-relative'

  " RUBY
  let g:syntastic_ruby_checkers = ["mri", "rubocop"]
" }}} SYNTASTIC

" INDENT GUIDES {{{
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentguidesOdd guibg=red ctermbg=0
  autocmd VimEnter,Colorscheme * :hi IndentguidesEven guibg=green ctermbg=18
" }}}

" CURSOR {{{
  " Set the cursor to line in insert mode, but account for TMUX
  " TMUX will only forward escape sequences to the terminal if surrounded by a DCS sequence
  " http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
" }}} CURSOR

" AG RESULTS TO QUICKFIX {{{
  function! s:ag_to_qf(line)
    let parts = split(a:line, ':')
    return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
          \ 'text': join(parts[3:], ':')}
  endfunction

  function! s:ag_handler(lines)
    if len(a:lines) < 2 | return | endif

    let cmd = get({'ctrl-x': 'split',
                 \ 'ctrl-v': 'vertical split',
                 \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
    let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

    let first = list[0]
    execute cmd escape(first.filename, ' %#\')
    execute first.lnum
    execute 'normal!' first.col.'|zz'

    if len(list) > 1
      call setqflist(list)
      copen
      wincmd p
    endif
  endfunction

  command! -nargs=* QfAg call fzf#run({
  \ 'source':  printf('ag --nogroup --column --color "%s"',
  \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
  \ 'sink*':    function('<sid>ag_handler'),
  \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
  \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
  \            '--color hl:68,hl+:110',
  \ 'down':    '50%'
  \ })
" }}} AG
