setlocal foldmethod=indent
setlocal foldcolumn=4

map <buffer> <localleader>r :!egrep -v '\sDONE$' % \| egrep '^\S'  <CR>
map <buffer> <localleader>d :!egrep    '\sDONE$' % \| egrep '^\S'  <CR>
map <buffer> <localleader>g :!                        egrep '^\S' %<CR>
map <buffer> <localleader>a zCV{dma/^Done\.\.\.<CR>jp`azz
map <buffer> <localleader>p yyp>>_D"+]p
