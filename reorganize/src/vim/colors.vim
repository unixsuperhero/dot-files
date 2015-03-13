hi SignColumn  term=standout ctermfg=4 ctermbg=black guifg=DarkBlue guibg=black
hi def link markdownCode           Statement
hi def link markdownCodeDelimiter  Statement
hi! link fsize Directory      "cterm=none ctermfg=4 ctermbg=Black
hi flink cterm=none ctermfg=3 ctermbg=0
hi fRedCheck cterm=standout ctermfg=Red ctermbg=Black
hi fchecked cterm=bold ctermfg=2 ctermbg=0
hi funchecked cterm=bold ctermfg=1 ctermbg=0
hi fother cterm=bold ctermfg=3 ctermbg=0
hi ftime cterm=none ctermfg=Green ctermbg=Black
hi j cterm=none ctermfg=White ctermbg=Cyan
  hi listOpen cterm=none ctermfg=1 ctermbg=0
  hi listSmX cterm=bold ctermfg=2 ctermbg=0
  hi listX cterm=none ctermfg=0 ctermbg=1
  hi listNS cterm=bold ctermfg=3 ctermbg=0
  hi listM01 cterm=none ctermfg=0 ctermbg=6
  hi listM02 cterm=none ctermfg=0 ctermbg=White
  hi listM03 cterm=none ctermfg=0 ctermbg=3
  hi listM04 cterm=none ctermfg=0 ctermbg=4
  hi listM05 cterm=none ctermfg=0 ctermbg=5
  hi listM06 cterm=none ctermfg=0 ctermbg=2
  hi listM07 cterm=reverse ctermfg=white ctermbg=0
  hi listM08 cterm=reverse ctermfg=lightblue ctermbg=white
  hi listM09 cterm=none ctermfg=6 ctermbg=0
  hi listM10 cterm=none ctermfg=White ctermbg=0
  hi listM11 cterm=none ctermfg=4 ctermbg=0
  hi listM12 cterm=none ctermfg=5 ctermbg=0
  hi listM13 cterm=none ctermfg=white ctermbg=0
  hi listM14 cterm=none ctermfg=lightblue ctermbg=white
  syn keyword listOpen listOpen
  syn keyword listSmX listSmX
  syn keyword listX listX
  syn keyword listNS listNS
  syn keyword listM01 listM01
  syn keyword listM02 listM02
  syn keyword listM03 listM03
  syn keyword listM04 listM04
  syn keyword listM05 listM05
  syn keyword listM06 listM06
  syn keyword listM07 listM07
  syn keyword listM08 listM08
  syn keyword listM09 listM09
  syn keyword listM10 listM10
  syn keyword listM11 listM11
  syn keyword listM12 listM12
  syn keyword listM13 listM13
  syn keyword listM14 listM14
hi LineNr cterm=none ctermfg=Red ctermbg=Black
hi IncSearch cterm=none ctermfg=White ctermbg=Cyan
hi Search cterm=none ctermfg=White ctermbg=Cyan
hi Comment cterm=none ctermfg=Gray  " Generic highlight changes
hi String cterm=none ctermfg=DarkGreen
hi treeDir cterm=none ctermfg=Cyan
hi treeUp cterm=none ctermfg=DarkYellow
hi treeCWD cterm=none ctermfg=DarkYellow
hi netrwDir cterm=none ctermfg=Cyan
hi PreProc ctermfg=4
hi SpecialKey ctermfg=5
hi NonText ctermfg=3
hi Underlined ctermfg=2
hi link a ErrorMsg
hi link b StatusLine
hi link c Search
hi link d DiffChange
hi popMatch1 cterm=none ctermfg=0 ctermbg=1
hi popMatch2 cterm=none ctermfg=0 ctermbg=6
hi popMatch3 cterm=none ctermfg=0 ctermbg=White
hi popMatch4 cterm=reverse ctermfg=0 ctermbg=White
hi popMatch5 cterm=none ctermfg=0 ctermbg=3
hi popMatch6 cterm=none ctermfg=0 ctermbg=4
hi popMatch7 cterm=none ctermfg=0 ctermbg=5
hi popMatch8 cterm=none ctermfg=0 ctermbg=2
hi popMatch9 cterm=reverse ctermfg=white ctermbg=0
hi popMatch10 cterm=reverse ctermfg=lightblue ctermbg=white
hi Visual term=reverse cterm=reverse guibg=LightGrey
  syn match listM09  /[0-9 ]\?[0-9. ]\?[0-9][BKMG]/
  syn match listM09  /\[[^[\]]*\]/
  syn match listNS   /\[\[\[.*\]\]\]/
  syn match listNS   /([^ ]*)/
  syn match listOpen /( )/
  syn match listSmX  /(x)/
  syn match listX    /(X \?.*)/
  syn match listSmX  /(josh @ [^)]\+)/
  syn match listSmX  /((.*))/
  syn match listTime /\d\d\d\d-\d\d-\d\d ..:..:../
