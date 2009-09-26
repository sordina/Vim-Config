let mapleader=";"

" Paste
set pastetoggle=<Leader><Leader>i

" Vanilla Vim
map <Leader><Leader>< :bp<CR>
map <Leader><Leader>> :bn<CR>

" Nerd Tree
map <Leader><Leader>q :NERDTreeToggle<CR>

" Fuzzy Finder
map <Leader><Leader>F :FuzzyFinderFile!<CR>
map <Leader><Leader>f :FuzzyFinderFile<CR>

" Shell
nmap <Leader><Leader>s :call InitShell()<cr>
