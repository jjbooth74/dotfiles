" BASICS {{{
  let mapleader="\<cr>"
  set mouse=a
" }}}

" PLUG {{{
  set rtp+=/usr/local/opt/fzf
  call plug#begin('~/.vim/plugged')
    " Make VIM more application like
    Plug 'tpope/vim-sensible'                    " 'sensible defaults'
    Plug 'tpope/vim-obsession'                   " Autosave sessions
    Plug 'junegunn/fzf.vim'                      " A wrapper to make easy generic fuzzyfinders
    Plug 'scrooloose/nerdtree'                   " File tree
    Plug 'flazz/vim-colorschemes'                " Just a bunch of colors
    Plug 'chriskempson/base16-vim'               " Fancy colors
    Plug 'cskeeters/vim-smooth-scroll'           " Smooth scrolling
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Text manipulation
    Plug 'tpope/vim-surround'                    " Change surround characters e.g. cs[(
    Plug 'tpope/vim-commentary'                  " Use gc to comment text objects
    Plug 'michaeljsmith/vim-indent-object'       " creates ii/ai/aI text objects

    " Language Support
    Plug 'pangloss/vim-javascript'               " JS support
    Plug 'maxmellon/vim-jsx-pretty'              " JSX support
    Plug 'isRuslan/vim-es6'
    Plug 'tpope/vim-rbenv'
    Plug 'vim-ruby/vim-ruby'                     " Ruby support
    Plug 'kchmck/vim-coffee-script'              " Coffeescript language support
    Plug 'mustache/vim-mustache-handlebars'      " Mustache syntax
    Plug 'shmup/vim-sql-syntax'                  " SQL Syntax

    " IDE
    Plug 'w0rp/ale'                              " Asynchronous Lint Engine
    Plug 'craigemery/vim-autotag'                " Automatically update tag files
    Plug 'majutsushi/tagbar'                     " Show a tag-based outline
    Plug 'ervandew/supertab'                     " Use tab to autocomplete things
    Plug 'easymotion/vim-easymotion'             " Magic navigation

    " GIT
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'                     " Github extension for fugitive

    " Tmux
    Plug 'christoomey/vim-tmux-navigator'        " Make pane nav seamless within tmux
    Plug 'edkolev/tmuxline.vim'                  " Sync airline -> Tmux status line

    " Stupid but glorious
    Plug 'AndreaOrru/fzf-mopidy-spotify.vim'       " Adds spotify commands
    Plug 'durgaswaroop/vim-mpc'                    " Adds MPC control
  call plug#end()
" }}}

" COLORS {{{
  " Change the color of listchars and line break characters
  augroup UpdateSpecialCharColors
    autocmd!
    autocmd ColorScheme * highlight SpecialKey ctermfg=18
    autocmd ColorScheme * highlight NonText ctermfg=18
  augroup END

  if filereadable(expand('~/.vimrc_background'))
    let base16colorspace=256
    source ~/.vimrc_background
  else
    colorscheme Tomorrow-Night-Bright
  endif
" }}}

" INDENTATION {{{
  let g:indentLine_char = '┆'
  let g:indentLine_leadingSpaceChar = '·'
  let g:indentLine_leadingSpaceEnabled = 1
  let g:indentLine_setColors = 1
  let g:indentLine_color_term = 20
" }}}

" FZF {{{
  let g:fzf_command_prefix = 'Fzf'
  nnoremap <C-p>      :FzfGFiles<cr>
  nnoremap <C-b>      :FzfBuffers<cr>
  nnoremap <leader>ag :FzfAg 
  nnoremap <leader>af :QfAg 
" }}}

" KEYS {{{
  " LEADER = <cr>
  " RESERVED:
  " Vim appears to store bindings in a tree,
  " debouncing input w/a delay at any inner node.
  " For certain bindings this is a pain because that
  " delay is noticeable, e.g. for changing tabs.
  " The best way to avoid that delay while still having a
  " usable debounce for other inputs is by ensuring
  " 'important' bindings are leaf nodes.  The following
  " should always be leaves:
  " <leader>t - next tab
  " <leader>T - prev tab
  " <leader>x - close tab
 
  " Use <leader> k & j to move lines up and down
  " nnoremap <leader>j :m+<cr>
  " nnoremap <leader>k :m-2<cr>

  " Reload file from disk
  nnoremap <leader>e :e %<cr>

  " Toggle linting
  nnoremap <leader>r :SyntasticToggleMode<cr>

  " Reset colors
  nnoremap <leader>cr :silent ! source ~/.base16_theme<cr>:redraw!<cr>

  " Magit opens in a split-right pane.
  " This creates a new blank tab, opens Magit,
  " then closes the left split
  nnoremap <leader>git :tabe<cr>:Magit<cr><C-w><C-h>:close<cr>

  " Start interactive easy align in visual mode (vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (gaip)
  nmap ga <Plug>(EasyAlign)

  " Fold things.
  nnoremap <leader>z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
  nnoremap <leader>m :TagbarToggle<cr>
  nnoremap <leader>l :noh<cr>
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
  command! NextFile call Move_tab_or_buffer('n')
  command! PrevFile call Move_tab_or_buffer('p')

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
  nnoremap <leader>10 :call SelectBufferOrTab(10)<cr>
  nnoremap <leader>11 :call SelectBufferOrTab(11)<cr>
  nnoremap <leader>12 :call SelectBufferOrTab(12)<cr>
  nnoremap <leader>13 :call SelectBufferOrTab(13)<cr>
  nnoremap <leader>14 :call SelectBufferOrTab(14)<cr>
  nnoremap <leader>15 :call SelectBufferOrTab(15)<cr>
  nnoremap <leader>16 :call SelectBufferOrTab(16)<cr>
  nnoremap <leader>17 :call SelectBufferOrTab(17)<cr>
  nnoremap <leader>18 :call SelectBufferOrTab(18)<cr>
  nnoremap <leader>19 :call SelectBufferOrTab(19)<cr>
  nnoremap <leader>20 :call SelectBufferOrTab(20)<cr>
  nnoremap <leader>21 :call SelectBufferOrTab(21)<cr>
  nnoremap <leader>22 :call SelectBufferOrTab(22)<cr>
  nnoremap <leader>23 :call SelectBufferOrTab(23)<cr>
  nnoremap <leader>24 :call SelectBufferOrTab(24)<cr>
  nnoremap <leader>25 :call SelectBufferOrTab(25)<cr>
  nnoremap <leader>26 :call SelectBufferOrTab(26)<cr>
  nnoremap <leader>27 :call SelectBufferOrTab(27)<cr>
  nnoremap <leader>28 :call SelectBufferOrTab(28)<cr>
  nnoremap <leader>29 :call SelectBufferOrTab(29)<cr>
  nnoremap <leader>30 :call SelectBufferOrTab(30)<cr>
" }}}

" SMOOTH-SCROLL {{{
  let g:ms_per_line = 15
" }}}

" AIRLINE {{{
  set t_Co=256
  set encoding=utf-8
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tmuxline#enabled = 0
  let g:tmuxline_powerline_separators = 0
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'win'  : ['  #I', '#W  '],
        \'cwin' : ['  #I', '#W #F  '],
        \'x'    : '𝄆 #(mpc current) 𝄇',
        \'y'    : '#(date)',
        \}
  let g:airline_theme='base16_eighties'
  " 'fairyfloss' 'hybrid' 'lucius' 'powerlineish' 'raven' 'ravenpower'+++ 'serene' 'sol'
  " 'tomorrow' 'understated' 'base16_eighties'
" }}}

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
  set listchars=eol:¬,tab:»\ ,trail:~,extends:>,precedes:<
  set list
  set clipboard=unnamed
  set cursorline
  set colorcolumn=117
  highlight ColorColumn ctermbg=black
  set hlsearch
  set showmatch
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set number
  setlocal numberwidth=5
  set wildmode=list:longest,full
  set nocompatible
" }}}

" FUZZYFIND {{{
  let g:fuzzy_matching_limit = 60 " limit number of results shown for performance
  " ignore stuff that can't be openned, and generated files
  let g:fuzzy_ignore         = '*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.beam;vendor/**;node_modules/**;coverage/**;tmp/**;rdoc/**'
  let g:fuzzy_ceiling        = 20000 " Scan more files
  let g:fuzzy_path_display   = 'relative_path' " Display relative path
" }}} FUZZYFIND

" NERDTREE {{{
  map <C-t> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  let NERDTreeIgnore = ['\.swp$']
  " Make Vim show NERDTree on startup
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " execute "Unite -start-insert -no-split file_rec" | endif
" }}} NERDTREE


" ALE {{{
  let g:ale_sign_column_always = 1
  let g:ale_sign_error = '👎'
  let g:ale_sign_warning = '💩'
  let g:ale_fixers = {
        \ 'ruby': ['rubocop', 'remove_trailing_lines'],
        \}
  let g:ale_fix_on_save = 0
  let g:ale_ruby_rubocop_executable = '/Users/jbooth/.rbenv/shims/rubocop'
" }}} ALE

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

" JS {{{
  let g:vim_jsx_pretty_colorful_config = 1
" }}}
