"----------"
" Settings "
"----------"

set expandtab

"------------------"
" Helper Functions "
"------------------"

" https://github.com/ujihisa/neco-ghc
setlocal omnifunc=necoghc#omnifunc

function! s:JustTheModules()

	" Save position
	let l:olda = @a
	normal! ma

	" Create a temporary file for ghci to work with
	let l:mypath = tempname()
	let l:mypath = l:mypath . '.hs'

	" Send imports to file
	execute ':redir >' . l:mypath
	execute ':g/^import/'
	execute ':redir END'

	" Run ghci
	execute ':silent !ghci -i. ' . l:mypath

	" Delete the file
	execute ':silent !rm ' . l:mypath

	" Refresh the screen to fix 'silent' issues
	execute ':redraw!'

	" Restore position
	normal! `a
	let @a = l:olda
endfunction

"-----------"
" Shortcuts "
"-----------"

" typ(e) of expressio(n)
set isk+='
map <buffer> <Leader>e :w<CR>me"eyy:.!cabal exec -- ghc -i./src -i. "%" -e ":t <cword>"<CR>"epkI-- <esc>`ej
map <buffer> <Leader>n :set paste<CR>:w<CR>me:let haskinfo=system("cabal --no-require-sandbox exec -- ghc -i./src -i. \"" . expand("%") . "\" -e \":i " . expand("<cword>") . "\"")<CR>O{-<CR><c-r>=haskinfo<CR>-}<esc>`e:set nopaste<CR>

" (b)uild
map <buffer> <Leader>b :w<CR>:!ghc --make -hidir /tmp -odir /tmp  -O2 -W "%" -o "%<"<CR>
map <buffer> <Leader>B :w<CR>:!ghc --make -hidir /tmp -odir /tmp  -O2 -W "%" -o "%<"

" (i)nterpret
map <buffer> <Leader>i :w<CR>:!cabal --no-require-sandbox exec -- ghci -fno-warn-type-defaults -fdefer-type-errors -Wall -i. -i./src "%"<CR>
map <buffer> <Leader>I :w<CR>:!cabal --no-require-sandbox exec -- ghci -fno-warn-type-defaults -fdefer-type-errors -Wall -i. -i./src "%"

" interperet with just the (m)odule imports
map <buffer> <Leader>m :w<CR>:call <SID>JustTheModules()<CR>
map <buffer> <Leader>M :w<CR>:call <SID>JustTheModules()

" (t)est with quickcheck
map <buffer> <Leader>t :w<CR>:!cabal --no-require-sandbox exec -- quickcheck +names "%"<CR>
map <buffer> <Leader>T :w<CR>:!cabal --no-require-sandbox exec -- quickcheck +names "%"

" (r)un built version
map <buffer> <Leader>r :w<CR>:! cabal exec -- ghc --make -hidir /tmp -odir /tmp  -O2 -W "%" -o "%<" && ./%<<CR>
map <buffer> <Leader>R :w<CR>:! cabal exec -- ghc --make -hidir /tmp -odir /tmp  -O2 -W "%" -o "%<" && ./%<

" (c)un concurrent built version
map <buffer> <Leader>c :w<CR>:! cabal exec -- ghc --make -hidir /tmp -odir /tmp  -W -O2 -with-rtsopts=-N -threaded "%" -o "%<" && ./%< <CR>
map <buffer> <Leader>C :w<CR>:! cabal exec -- ghc --make -hidir /tmp -odir /tmp  -W -O2 -with-rtsopts=-N -threaded "%" -o "%<" && ./%<

" Interpret (a)nd run
map <buffer> <Leader>a :w<CR>:! cabal exec -- runhaskell -i. -i./src %<CR>
map <buffer> <Leader>A :w<CR>:! cabal exec -- runhaskell -i. -i./src %

" (p)rofile
map <buffer> <Leader>p :w<CR>:!ghc --make -hidir /tmp -odir /tmp  -rtsopts -W -prof -auto-all "%" -o "%<" && ./"%<" +RTS -p -RTS && cat "%<.prof"<CR>
map <buffer> <Leader>P :w<CR>:!ghc --make -hidir /tmp -odir /tmp  -rtsopts -W -prof -auto-all "%" -o "%<" && ./"%<" +RTS -p -RTS && cat "%<.prof"

" (l)int
map <buffer> <Leader>l :w<CR>:! hlint --color "%"<CR>
map <buffer> <Leader>L :w<CR>:! hlint --color "%"

" (s)earch hoogle
map <buffer> <Leader>s :! hoogle search --color 
map <buffer> <Leader>S :! hoogle --info "

" Cabal (f)unctions

" (c)onfigure
map <buffer> <Leader>fc :w<CR>:! cabal configure<CR>
map <buffer> <Leader>fC :w<CR>:! cabal configure

" (b)uild
map <buffer> <Leader>fb :w<CR>:! cabal build<CR>
map <buffer> <Leader>fB :w<CR>:! cabal build

" (i)nstall
map <buffer> <Leader>fi :w<CR>:! cabal install<CR>
map <buffer> <Leader>fI :w<CR>:! cabal install

" (r)un
map <buffer> <Leader>fr :w<CR>:! ./dist/build/*/*(*)<CR>
map <buffer> <Leader>fR :w<CR>:! ./dist/build/*/*(*)<CR>

" build (a)nd install
map <buffer> <Leader>fa :w<CR>:! cabal build && cabal install<CR>
map <buffer> <Leader>fA :w<CR>:! cabal build && cabal install
