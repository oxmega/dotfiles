"" VIMRC 
"" a somewhat sane (hopefully) vimrc. hoping to avoid configuration sprawl...
"" 01/25/23

set t_Co=256
set number		" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=80	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
set spell		" Enable spell-checking
set virtualedit=block	" Enable free-range cursor
 
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
 
set autoindent		" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set ruler		" Show row and column ruler information
 
set autochdir		" Change working directory to open buffer
set cdpath=fdfsfd	" cd (path) directories
set backupdir=~/Documents/backup	" Backup directories

"" delete & undo or, oopsies! 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Persist undo history between Vim sessions.
if has('persistent_undo')
	set undodir=$HOME/.vim/tmp/undo
	if !isdirectory(&undodir) | call mkdir(&undodir, 'p', 0700) | endif
endif

" key mappings
imap jj <Esc>
au BufNewFile,BufFilePre,BufRead *.md nnoremap { {{j^
au BufNewFile,BufFilePre,BufRead *.md nnoremap } }j^

"undo to end of sentences
inoremap ! !<C-g>u
inoremap . .<C-g>u
inoremap ? ?<C-g>u

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

colorscheme darkest-space

" Plugins
call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-liquid'
Plug 'wellsjo/wellokai.vim'


call plug#end()

" explicit color calculations for limelight mode
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
