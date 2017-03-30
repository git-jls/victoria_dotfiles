"-----------------------------------------------------
"  file:   ${DOTFILES}/vim/settings.vim
"  author: jls - http://sjorssparreboom.nl
" ----------------------------------------------------

" general
" ----------------------------------------------------
set t_Co=256
set encoding=utf-8
set fileencoding=utf-8
set ttyfast
set lazyredraw
set cursorline
set nowrap
set number
set modifiable
set noshowmatch
set backspace=2
set scrolloff=10
set ww=b,s,h,l,<,>,[,]
set linebreak
set wildmenu
set wildmode=list:longest,full
set spellfile=$DOTFILES/vim/spell/en.utf-8.add
set spelllang=nl
set dictionary+=/usr/share/dict/words
set wmh=0
set timeoutlen=500
set mouse=a
set pdev=Canon-MP2900-series
set clipboard=unnamed

" backups
" ----------------------------------------------------
set backupdir=$DOTFILES/vim/backup/                  " backup files directories
set directory=$DOTFILES/vim/backup/                  " store backup swp files

" tweaks for browsing
" ----------------------------------------------------
" check netrw-browse-maps for shortcuts
let g:netrw_banner=0                                  " disable annoying banner (top)
let g:netrw_browse_split=4                            " open in prior window
let g:netrw_altv=1                                    " splits open to the right
let g:netrw_liststyle=3                               " tree view
let g:netrw_winsize=25                                " a little smaller please
let g:netrw_list_hide=netrw_gitignore#Hide()          " hide stuff in gitignore
let netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" tabs and indenation
" ----------------------------------------------------
let g:is_posix=1
let g:loaded_matchparen=1
let g:is_bash=1
let g:vimsyn_noerror=1

" tabs and indenation
" ----------------------------------------------------
set modeline
set linespace=2
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set copyindent 

" searching
" ----------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
set path+=**

" boost
" ----------------------------------------------------
set nocursorcolumn
set nocursorline
set ttyscroll=3

" status line / listchars
" ----------------------------------------------------
set statusline=\%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [wc:%{WordCount()}]\ ::\ [%p%%:\ %l/%c/%L]
set list listchars=trail:·,precedes:«,extends:»,tab:▸\
set shortmess=a
set laststatus=2

" Load colorscheme
" ----------------------------------------------------
colorscheme seagull

" Completion
" ----------------------------------------------------
set completeopt=longest,menuone,preview
set splitbelow
set updatetime=500
set cmdheight=1
set hidden

" OmniSharp
" ----------------------------------------------------
let g:OmniSharp_timeout = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_want_snippet=1

" Syntastic
" ----------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" FZF
" ----------------------------------------------------
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.fzf/fzf-history'

" Ultisnips
" ----------------------------------------------------
let g:UltiSnipsListSnippets ="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Rust
" ----------------------------------------------------
let g:rustfmt_autosave = 0
let g:racer_cmd = $RACER_CMD
" let g:racer_experimental_completer = 1
let g:rust_doc#downloaded_rust_doc_dir = $RUST_NIGHTLY
let g:rust_doc#do_not_ask_for_module_list = 1

" YouCompleteMe
" ----------------------------------------------------
" let g:ycm_rust_src_path = $RUST_SRC_PATH
let g:ycm_min_num_of_chars_for_completion = 1

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']