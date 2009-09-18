set pastetoggle=<F8>

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

" map f12 to remove/add highlighting
map  <F12> :set hls!<CR>
imap <F12> <ESC>:set hls!<CR>a
vmap <F12> <ESC>:set hls!<CR>gv

set shortmess=aTItoO
set wrap

set tabstop=2
set shiftwidth=2

" don't break linkes halfway through words if possible
set linebreak

let mapleader = ";"
