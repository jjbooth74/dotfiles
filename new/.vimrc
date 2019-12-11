" BASICS {{{
  let mapleader="\<cr>"
  set mouse=a
" }}}

" PLUG {{{
  call plug#begin('~/.vim/plugged')
    " Make VIM more application like
    Plug 'tpope/vim-sensible'                    " 'sensible defaults'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'                      " A wrapper to make easy generic fuzzyfinders
    Plug 'scrooloose/nerdtree'                   " File tree
    Plug 'flazz/vim-colorschemes'                " Just a bunch of colors
    Plug 'chriskempson/base16-vim'               " Fancy colors
    Plug 'tomasiser/vim-code-dark'               " VSCode colors
    Plug 'cskeeters/vim-smooth-scroll'           " Smooth scrolling
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Text manipulation
    Plug 'tpope/vim-surround'                    " Change surround characters e.g. cs[(
    Plug 'tpope/vim-commentary'                  " Use gc to comment text objects
    Plug 'michaeljsmith/vim-indent-object'       " creates ii/ai/aI text objects
    Plug 'junegunn/vim-easy-align'               " align things using e.g. gaip

    " Language Support
    " Scala
    Plug 'derekwyatt/vim-scala'
    Plug 'neoclide/coc.nvim', {'do': {-> coc#util#install()}}
    " Go
    Plug 'fatih/vim-go'
    Plug 'garyburd/go-explorer'
    Plug 'ddollar/golang-template.vim'
    " JS
    Plug 'maxmellon/vim-jsx-pretty'              " JSX support
    Plug 'pangloss/vim-javascript'               " JS support
    Plug 'isRuslan/vim-es6'
    Plug 'kchmck/vim-coffee-script'              " Coffeescript language support
    " Ruby
    Plug 'tpope/vim-rbenv'
    Plug 'vim-ruby/vim-ruby'                     " Ruby support
    " Others
    Plug 'docker/docker', {'rtp': '/contrib/syntax/vim'}

    " IDE
    Plug 'w0rp/ale'                              " Asynchronous Lint Engine
    Plug 'easymotion/vim-easymotion'             " Magic navigation

    " GIT
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'                     " Github extension for fugitive

    " Tmux
    Plug 'christoomey/vim-tmux-navigator'        " Make pane nav seamless within tmux
    Plug 'edkolev/tmuxline.vim'                  " Sync airline -> Tmux status line

    " Stupid but glorious
    " Plug 'AndreaOrru/fzf-mopidy-spotify.vim'       " Adds spotify commands
    " Plug 'durgaswaroop/vim-mpc'                    " Adds MPC control
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
    " source ~/.vimrc_background
    colorscheme codedark
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
  nnoremap <C-p>      :FzfFiles<cr>
  nnoremap <C-b>      :FzfBuffers<cr>
  nnoremap <C-s>      :QfAg 
  nnoremap <leader>ff :QfAg 
" }}}

" KEYS {{{
  " Don't wait around forever for multiple keypresses.
  set timeoutlen=1000
  set ttimeoutlen=0
  nnoremap <leader>l  :noh<cr>
  nnoremap <leader>o  :NERDTreeToggle<cr>
  nnoremap <leader>x  :q<cr>

  nnoremap <leader>ev :tabe ~/.vimrc<cr>
  nnoremap <leader>et :tabe ~/.tmux.conf<cr>
  nnoremap <leader>ez :tabe ~/.zshrc<cr>

  nnoremap <leader>vv :source ~/.vimrc<cr>
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
  let g:airline_theme='codedark'
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

  " Zoom / Restore window.
  function! s:ZoomToggle() abort
      if exists('t:zoomed') && t:zoomed
          execute t:zoom_winrestcmd
          let t:zoomed = 0
      else
          let t:zoom_winrestcmd = winrestcmd()
          resize
          vertical resize
          let t:zoomed = 1
      endif
  endfunction
  command! ZoomToggle call s:ZoomToggle()
  nnoremap <M-z> :ZoomToggle<CR>
" }}} SPLITS

" GENERAL {{{
  set listchars=eol:¬,tab:»\ ,trail:~,extends:>,precedes:<
  set list
  set clipboard+=unnamedplus
  " set cursorline " // BAD PERFORMANCE FOR SOME REASON?!?!
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
  set formatoptions+=j
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
  " let g:ale_sign_error = '👎'
  " let g:ale_sign_warning = '💩'
  let g:ale_fixers = {
        \ 'ruby': ['rubocop', 'remove_trailing_lines'],
        \ 'go': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'vim': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'yaml': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'json': ['remove_trailing_lines', 'trim_whitespace', 'jq']
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

" FILE RESULTS TO QF {{{
  function! s:filename_to_qf(f)
    execute "echom '" . escape(a:f, ' %#\') . "'"
    return {'filename': a:f}
  endfunction

  function! s:files_handler(lines)
    if len(a:lines) < 2 | return | endif
    let cmd = get({'ctrl-x': 'split',
                 \ 'ctrl-v': 'vertical split',
                 \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

    execute cmd escape(a:lines[1], ' %#\')

    let list = map(a:lines[1:], 's:filename_to_qf(v:val)')

    if len(list) > 1
      call setqflist(list)
      copen
      wincmd p
    endif
  endfunction

  command! -nargs=0 FuzzyFile call fzf#run({
        \ 'source': 'rg --files --no-heading ',
        \ 'sink*': function('<sid>files_handler'),
        \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x '.
        \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
        \            '--color hl:68,hl+:110',
        \ 'down': '50%'
        \ })
" }}}

" GURU RESULTS TO QUICKFIX {{{
  function! s:guru_to_qf(line)
    let parts = split(a:line, ' ')
    let fparts = split(parts[0], ':')
    return {'filename': fparts[0], 'lnum': fparts[1], 'col': fparts[2],
          \ 'text': parts[1] }
  endfunction

  function! Fuzzyguru_parser(lines)
    if len(a:lines) < 2 | return | endif
    let cmd = get({'ctrl-x': 'split',
                 \ 'ctrl-v': 'vertical split',
                 \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

    let list = map(a:lines[1:], 's:guru_to_qf(v:val)')

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

  function! FuzzyGuru(query)
    let p=expand('%:p')
    let b=line2byte(line('.')) + col('.') - 1
    let filearg=p.':#'.b
    let fuzzyguru_scope = 'github.corp.dyndns.com/waas/waas_control_plane_api/...,-github.corp.dyndns.com/waas/waas_control_plane_api/vendor/...'

    call fzf#run({
      \ 'source': 'guru -scope "'.fuzzyguru_scope.'" '.a:query.' '.filearg .'| sed -n ''1!p''',
      \ 'sink*':   function('Fuzzyguru_parser'),
      \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
      \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
      \            '--color hl:68,hl+:110',
      \ 'down':    '50%'
      \ })
  endfunction
" }}} GURU RESULTS TO QUICKFIX

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
  \ 'source':  printf('rg --no-ignore -g ''!vendor/'' --no-heading --column "%s"',
  \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
  \ 'sink*':    function('<sid>ag_handler'),
  \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
  \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
  \            '--color hl:68,hl+:110',
  \ 'down':    '50%'
  \ })
" }}} AG

" DOCKER {{{
  autocmd BufNewFile,BufRead *.df set filetype=dockerfile
" }}}

" JS {{{
  let g:vim_jsx_pretty_colorful_config = 1
" }}}

" GO {{{
  " Misc settings
  let g:go_auto_type_info   = 1
  let g:go_updatetime       = 750
  let g:go_jump_to_error    = 0
  let g:go_term_enabled     = 0 " Run tests, etc in neovims terminal
  let g:go_def_reuse_buffer = 0 " Use existing buffer if file is open
  let g:go_test_show_name   = 1 " Show test name in test output

  " Syntax highlighting
  let g:go_highlight_array_whitespace_error    = 0
  let g:go_highlight_chan_whitespace_error     = 0
  let g:go_highlight_extra_types               = 0
  let g:go_highlight_space_tab_error           = 0
  let g:go_highlight_trailing_whitespace_error = 0
  let g:go_highlight_operators                 = 1
  let g:go_highlight_methods                   = 1
  let g:go_highlight_functions                 = 1
  let g:go_highlight_function_arguments        = 0
  let g:go_highlight_function_calls            = 1
  let g:go_highlight_types                     = 1
  let g:go_highlight_fields                    = 0
  let g:go_highlight_build_constraints         = 1
  let g:go_highlight_generate_tags             = 0
  let g:go_highlight_string_spellcheck         = 1
  let g:go_highlight_format_strings            = 1
  let g:go_highlight_variable_declarations     = 0
  let g:go_highlight_variable_assignments      = 0

  let g:go_fmt_command         = "goimports"
  let g:go_fmt_autosave        = 1
  let g:go_metalinter_autosave = 0
  let g:go_alternate_mode      = 'vsplit' " Open test files in a vsplit
  let g:go_decls_mode          = 'fzf'

  " run :GoBuild or :GoTestCompile based on the go file
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction
  autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>

  autocmd FileType go nmap <leader>gr <Plug>(go-rename)
  autocmd FileType go nmap <leader>gt <Plug>(go-test)
  autocmd FileType go nmap <leader>ga <Plug>(go-alternate-vertical)
  autocmd FileType go nmap <leader>gd :GoDoc<cr>
  autocmd FileType go nmap <leader>gx :GoRun<cr>
  " autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
  " autocmd FileType go nmap <leader>gi <Plug>(go-info)
  autocmd FileType go nnoremap <leader>gc :call FuzzyGuru('callers')<cr>
  autocmd FileType go nnoremap <leader>gi :call FuzzyGuru('callees')<cr>
  autocmd FileType go set tabstop=4
  autocmd FileType go set shiftwidth=4
  autocmd FileType gotmpl set tabstop=4
  autocmd FileType gotmpl set shiftwidth=4
" }}}

" QUICKFIX {{{
  autocmd FileType qf wincmd J
" }}}

" COC {{{

  set cmdheight=4
  set signcolumn=yes
  set updatetime=300
  set shortmess+=c

  inoremap <silent><expr> <C-space> coc#refresh()

  " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Remap for do codeAction of current line
  nmap <leader>ac <Plug>(coc-codeaction)

  " Remap for do action format
  nnoremap <silent> F :call CocAction('format')<CR>

  " Use K for show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}
