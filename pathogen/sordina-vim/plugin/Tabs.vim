" Display tabs as 4 spaces wide. When expandtab is set, use 4 spaces.
set shiftwidth=2
set tabstop=2

function TabsOrSpaces()
    " Determines whether to use spaces or tabs on the current buffer.
    if getfsize(bufname("%")) > 256000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs > 0 || numSpaces > 0
      if numTabs > numSpaces
          setlocal noexpandtab
      else
          setlocal expandtab
      endif
    end
endfunction

autocmd BufReadPost * call TabsOrSpaces()
