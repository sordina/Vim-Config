"-----------------"
" Tab conversion  "
"-----------------"

" (r)un
map <Leader>r :w<CR>:!ocaml -I . %<CR>
map <Leader>R :w<CR>:!ocaml -I . %

" Compile (a)nd run
map <Leader>a <Leader>c:!./%<<CR>

" (c)ompile
map <Leader>c :w<CR>:! ocamlc -I . % -o %<<CR>
map <Leader>C :w<CR>:! ocamlc -I . % -o %<

" (i)nterpret
map <Leader>i :w<CR>:! rlwrap ocaml -I . -init %<CR>
map <Leader>I :w<CR>:! rlwrap ocaml -I . -init %
