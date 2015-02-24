autocmd BufNewFile,BufRead */notes/*
      \ if &ft =~# '^\%(markdown\)$' |
      \   set ft=notes |
      \ else |
      \   setf notes |
      \ endif
