let mapleader = ' '

nmap gf :vert wincmd f<CR>
nmap gF :vert wincmd F<CR>
nmap <leader>z :call <SID>SynStack()<CR>

nnoremap gf :vs <cfile><CR>
nnoremap  :vert stjump<CR>
vnoremap < <gv  " visual shifting (does not exit Visual mode)
vnoremap > >gv
nnoremap > >>
nnoremap < <<
nnoremap j gj
nnoremap k gk
nnoremap K kJ
nnoremap ,c :vert wincmd <C-]><CR>
nnoremap ,f :CommandT<cr>
nnoremap ,s :w\|!git add %;git commit -m 'autocommitting %'<cr>
nnoremap ,q :wqa<cr>
nmap cop :set paste!<cr>       " works great in insert mode <C-o>cop
