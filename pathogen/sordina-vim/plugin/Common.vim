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

syntax on

filetype plugin indent on

" Listing -> :he 'lcs
if has("multi_byte")
	set lcs=tab:\▸\ ,trail:_
else
	set lcs=tab:\|\ ,trail:_
endif

set list

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

set pastetoggle=;;i

map <Leader><Leader>a :NERDTreeToggle<CR>
map <Leader><Leader>u :GundoToggle<CR>
nmap <Leader><Leader>s :call InitShell()<cr>

" ---- Conditional Items

" Exploring
if has("win32")
	map <Leader><Leader>/ :!start explorer .<CR>
	map <Leader><Leader>. :!start explorer %:h<CR>

elseif has("mac")
	map <Leader><Leader>/ :!open .<CR>
	map <Leader><Leader>. :!open %:h<CR>
endif

" Special shells
if $SHELL =~ 'bin/fish'
	set shell=/bin/sh
endif
