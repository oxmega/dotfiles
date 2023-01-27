"" VIMRC 
"" a somewhat sane (hopefully) vimrc. hoping to avoid configuration sprawl...
"" 01/25/23

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

" Hotkeys
imap jj <Esc>


