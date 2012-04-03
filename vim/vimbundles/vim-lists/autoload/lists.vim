" Vim syntax file
" Description:    For use with ~/bin/list and the files in ~/lists
" Maintainer:     Joshua Toyota
" Last Change:    2010-03-18 23:01:32
" Version:        0.1
"
" These changes are from ~/.vim/syntax/javascript.vim
" Changes:      1, Get the vimdiff problem fixed finally. 
"                Matthew Gallant reported the problem and test the fix. ;)
"               2, Follow the suggestioin from Ingo Karkat.
"                The 'foldtext' and 'foldlevel' settings should only be 
"                changed if the file being edited is pure JavaScript, 
"                not if JavaScript syntax is embedded inside other syntaxes.
"               3, Remove function FT_JavaScriptDoc(). 
"                Since VIM do the better than me. 
"
" TODO:
"  - Put something here...

syntax clear
let main_syntax = 'lists'
let b:current_syntax = "lists"

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

hi link listTime listM12

syn match listM09  /[0-9 ]\?[0-9. ]\?[0-9][BKMG]/
syn match listM09  /\[[^[\]]*\]/
syn match listNS   /([^ )]*)/
syn match listM03   /(-)/
syn match listOpen /( )/
syn match listSmX  /(x)/
syn match listSmX  /([\/]).*/
syn match listX    /(X).*/
syn match listM12  /(!).*/
syn match listSmX  /(josh @ [^)]\+)/
syn match listTime /\v([{]\s*)?\d\d\d\d-\d\d-\d\d(\s*[}])?/
syn match listTime /\v([{]\s*)?..:..:..(\s*[}])?/

syntax region listM11 start="\[\[" end="\]\]"

"  syn  match listSmX /((.*))/
syntax region listSmX start="((" end="))"

"  syn  match listNS /\[\[\[.*\]\]\]/
syntax region listNS start="\[\{3}" end="\]\{3}"

syntax region listM06 start="\[\{4}" end="\]\{4}"

syntax region listM07 start="(((" end=")))"

" (region) [[ highlight list M11 ]]
" (region) [[[ highlight list M11 ]]]
" (region) [[[[ highlight list M06 ]]]]

" (region) (( highlight list SmX ))
" (region) ((( highlight list M07 )))

