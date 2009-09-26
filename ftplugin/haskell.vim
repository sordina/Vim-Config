"-----------------"
" Display options "
"-----------------"

"-----------------"
" Tab conversion  "
"-----------------"

" source $HOME/.vim/ftplugin/haskell_indent.vim

set ts=2
set st=2
set sw=2
set expandtab
set ai

"-----------"
" Shortcuts "
"-----------"

" (b)uild
map <Leader>b :w<CR>:!ghc -fglasgow-exts --make -O2 -W '%' -o '%<'<CR>
map <Leader>B :w<CR>:!ghc -fglasgow-exts --make -O2 -W '%' -o '%<'

" (i)nterpret
map <Leader>i :w<CR>:!ghci -fglasgow-exts -i. %<CR>
map <Leader>I :w<CR>:!ghci -fglasgow-exts -i. %

" (q)uick shell
map <Leader>s :!ghci<CR>
map <Leader>S :!ghci

" (t)est with quickcheck
map <Leader>t :w<CR>:!quickcheck +names %<CR>
map <Leader>T :w<CR>:!quickcheck +names %

" (r)un built version
map <Leader>r :w<CR>:!ghc -fglasgow-exts --make -O2 -W '%' -o '%<' && ./%<<CR>
map <Leader>R :w<CR>:!ghc -fglasgow-exts --make -O2 -W '%' -o '%<' && ./%<

" (c)un concurrent built version
map <Leader>c :w<CR>:!ghc -fglasgow-exts --make -W -O2 -threaded '%' -o '%<' && ./%< +RTS -N2<CR>
map <Leader>C :w<CR>:!ghc -fglasgow-exts --make -W -O2 -threaded '%' -o '%<' && ./%< +RTS -N2

" Interpret (a)nd run
map <Leader>a :w<CR>:!runhaskell %<CR>
map <Leader>A :w<CR>:!runhaskell %

" (p)rofile
map <Leader>p :w<CR>:!ghc -fglasgow-exts --make -W -prof -auto-all '%' -o '%<' && ./'%<' +RTS -p -RTS && cat '%<.prof'<CR>
map <Leader>P :w<CR>:!ghc -fglasgow-exts --make -W -prof -auto-all '%' -o '%<' && ./'%<' +RTS -p -RTS && cat '%<.prof'

" (l)int
map <Leader>l :w<CR>:! hlint --color '%'<CR>
map <Leader>L :w<CR>:! hlint --color '%'

" (s)earch hoogle
map <Leader>s :! hoogle 
map <Leader>S :! hoogle --info "
