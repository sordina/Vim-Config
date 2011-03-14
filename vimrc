" We're running Vim, not Vi!
"
set nocompatible
set hidden

" Terminal Encodings
"
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

" FISH fix
if $SHELL =~ 'bin/fish'
	set shell=/bin/sh
endif

" Environment
"
let $PATH = $PATH . ":/opt/local/bin"
filetype plugin indent on

" GUI Tweaks
"
"colorscheme sorcerer
colorscheme ir_black
"colorscheme rdark_temoto
"colorscheme zenburn
"colorscheme desert
"colorscheme wombat
syntax on

set shortmess=aTItoO
set guioptions-=T
"set foldcolumn=2
set linebreak
set wrap
set hlsearch
set incsearch
set showmatch " Bracket matching
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set ai

" Mac specific copy command
"
command! -range=% Copy :<line1>,<line2>w !pbcopy

" GUI Fonts
"
set guifont=Monaco:h12
