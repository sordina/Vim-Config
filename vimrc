if $TERM =~ '^xterm-256color'
        set t_Co=256 
elseif $TERM =~ '^screen-bce'
        set t_Co=256            " just guessing
elseif $TERM =~ '^rxvt'
        set t_Co=88
elseif $TERM =~ '^linux'
        set t_Co=8
else
        set t_Co=16
endif

set pastetoggle=<F8>

set nocompatible          " We're running Vim, not Vi!
" set number              " Line numbering
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection

let loaded_matchparen = 0
let g:xml_syntax_folding = 1

function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

command -range=% Copy :<line1>,<line2>w !pbcopy

set shortmess=aTItoO
set wrap

set tabstop=2
set shiftwidth=2

let mapleader=";"

" don't break linkes halfway through words if possible
set linebreak

set hlsearch
set ignorecase

colorscheme desert

set guioptions-=T

let $PATH = $PATH . ":/opt/local/bin"
