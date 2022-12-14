set nocompatible
set hidden

set shortmess=aTItoO
set guioptions-=T
set guioptions-=r
set guioptions-=L

set showcmd
set linebreak
set wrap
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set ai
set wildmenu

set mouse=a
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

if has('unnamedplus')
	set clipboard+=unnamedplus
endif

let vimclojure#WantNailgun = 1

syntax on

" Haskell syntax
let hs_highlight_delimiters = 1 " hs_highlight_delimiters - Highlight delimiter characters--users with a light-colored background will probably want to turn this on.
let hs_highlight_boolean    = 1 " hs_highlight_boolean - Treat True and False as keywords.
let hs_highlight_types      = 1 " hs_highlight_types - Treat names of primitive types as keywords.
let hs_highlight_debug      = 1 " hs_highlight_debug - Highlight names of debugging functions.
let hs_allow_hash_operator  = 1 " Don't highlight seemingly incorrect C preprocessor directives but assume them to be operators

filetype plugin indent on

colorscheme Tomorrow-Night-Bright

" Listing -> :he 'lcs
if has("multi_byte")
	set lcs=tab:\│\ ,trail:_
else
	set lcs=tab:\|\ ,trail:_
endif

set list
set nowrap

" File type detection
autocmd  BufNewFile,BufRead *.ijs,*.ijt,*.ijp,*.ijx,*.j set filetype=jsoftware
autocmd  BufNewFile,BufRead todo.txt,TODO.txt,*.todo    set filetype=todo
autocmd  BufNewFile,BufRead *.lhs                       set filetype=lhaskell
autocmd  BufNewFile,BufRead *.cljx                      set filetype=clojure
autocmd  BufNewFile,BufRead *.cljx                      set filetype=clojure
autocmd  BufNewFile,BufRead *.m                         set filetype=mercury
autocmd! BufRead,BufNewFile *.ll                        set filetype=llvm

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
let maplocalleader=";"
let g:NERDTreeMapHelp=""

nmap <Leader><Leader>i V:!shell-interpret<CR>}j
vmap <Leader><Leader>i :!shell-interpret<CR>}j
vmap <D-c> "+y
vmap <Leader><Leader>c "+y
nmap <Leader><Leader>c V"+y
map <Leader><Leader>e :w<CR> :!mvim %<CR>
map <Leader><Leader>a :NERDTreeToggle<CR>
map <Leader><Leader>u :GundoToggle<CR>
map <Leader><Leader>s :call InitShell()<cr>
map <Leader><Leader>l :! tabulate<cr>
map <Leader><Leader>g yiw:cexpr system('git grep <C-r>"')<CR>
map <Leader><Leader>G yiw:cexpr system('git grep <C-r>"')
map <Leader><Leader>b :b#<CR>
map <Leader><Leader>q :q<CR>
map gs :vsplit<cr> gf
map gf :e <cfile><CR>

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

" Paginated Split
map <leader><leader>s :vsplit<CR><c-w>l:set noscb<CR><c-f>:set scb<CR><c-w>h:set scb<CR>

" Special shells
if $SHELL =~ 'bin/fish'
	set shell=/bin/sh
endif

" Ctrl-P Stuff
nmap <c-p> :CtrlPMixed<CR>
let g:ctrlp_working_path_mode = 2

" ALE

let g:ale_linters = {'haskell': ['hlint','hls']}
" let g:ale_haskell_hls_executable = "/Users/lyndon/.ghcup/bin/haskell-language-server-8.10.7"

nmap gd :ALEGoToDefinition<CR>
nmap gh :ALEHover<CR>
