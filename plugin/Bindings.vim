let mapleader=";"

" Paste
set pastetoggle=<F8>


" Vanilla Vim
map <Leader><Leader>i :set paste<CR>
map <Leader><Leader>I :set nopaste<CR>
map <Leader><Leader>< :bp<CR>
map <Leader><Leader>> :bn<CR>

" Nerd Tree
map <Leader><Leader>a :NERDTreeToggle<CR>

" Fuzzy Finder
map <Leader><Leader>F :FuzzyFinderFile!<CR>
map <Leader><Leader>f :FuzzyFinderFile<CR>

" Shell
nmap <Leader><Leader>s :call InitShell()<cr>
