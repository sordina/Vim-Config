set nocompatible
set hidden

set shortmess=aTItoO
set guioptions-=T
set guioptions-=r
set guioptions-=L

set linebreak
set wrap
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set ai

set clipboard+=unnamedplus

syntax on

let hs_highlight_delimiters = 1 " hs_highlight_delimiters - Highlight delimiter characters--users with a light-colored background will probably want to turn this on.
let hs_highlight_boolean    = 1 " hs_highlight_boolean - Treat True and False as keywords.
let hs_highlight_types      = 1 " hs_highlight_types - Treat names of primitive types as keywords.
let hs_highlight_debug      = 1 " hs_highlight_debug - Highlight names of debugging functions.
let hs_allow_hash_operator  = 1 " Don't highlight seemingly incorrect C preprocessor directives but assume them to be operators

filetype plugin indent on

" Listing -> :he 'lcs
if has("multi_byte")
	set lcs=tab:\▸\ ,trail:_
else
	set lcs=tab:\|\ ,trail:_
endif

set list

" File type detection
autocmd BufNewFile,BufRead *.ijs,*.ijt,*.ijp,*.ijx,*.j set filetype=jsoftware
autocmd BufNewFile,BufRead todo.txt,TODO.txt           set filetype=todo

" Jumps by visual line rather than logical line. For really long lines. :D
nnoremap j gj
nnoremap k gk

" Swap files
set nobackup
set nowritebackup
set noswapfile

" Unsearch
nmap <silent> <space> :let @/=""<CR>

let mapleader=";"
let maplocaleader=";"

" set pastetoggle=;;i " Causes issues when coding in insert mode with semi-colons

map <Leader><Leader>a :NERDTreeToggle<CR>
map <Leader><Leader>u :GundoToggle<CR>
map <Leader><Leader>s :call InitShell()<cr>

" ---- Conditional Items

" Exploring
if has("win32")
	map <Leader><Leader>/ :!start explorer .<CR>
	map <Leader><Leader>. :!start explorer %:h<CR>

elseif has("mac")
	map <Leader><Leader>/ :!open .<CR>
	map <Leader><Leader>. :!open %:h<CR>
endif

" Time insertion
map <Leader><Leader>t o<C-R>=strftime('%c')<CR><esc>

" Special shells
if $SHELL =~ 'bin/fish'
	set shell=/bin/sh
endif

" Ctrl-P Stuff
nmap <c-p> :CtrlPMixed<CR>
let g:ctrlp_working_path_mode = 2
