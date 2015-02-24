" Vim syntax file
" Language:     Notes
" Maintainer:   Tim Pope <vimNOSPAM@tpope.org>
" Filenames:    *.markdown, *.md, etc.
" Last Change:  2013 May 30

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'notes'
endif

runtime! syntax/html.vim
unlet! b:current_syntax

if !exists('g:notes_fenced_languages')
  let g:notes_fenced_languages = []
endif
for s:type in map(copy(g:notes_fenced_languages),'matchstr(v:val,"[^=]*$")')
  if s:type =~ '\.'
    let b:{matchstr(s:type,'[^.]*')}_subtype = matchstr(s:type,'\.\zs.*')
  endif
  exe 'syn include @notesHighlight'.substitute(s:type,'\.','','g').' syntax/'.matchstr(s:type,'[^.]*').'.vim'
  unlet! b:current_syntax
endfor
unlet! s:type

syn sync minlines=10
syn case ignore

syn match notesValid '[<>]\c[a-z/$!]\@!'
syn match notesValid '&\%(#\=\w*;\)\@!'

syn match notesLineStart "^[<@]\@!" nextgroup=@notesBlock,htmlSpecialChar

syn cluster notesBlock contains=notesH1,notesH2,notesH3,notesH4,notesH5,notesH6,notesBlockquote,notesListMarker,notesOrderedListMarker,notesCodeBlock,notesRule
syn cluster notesInline contains=notesLineBreak,notesLinkText,notesItalic,notesBold,notesCode,notesEscape,@htmlTop,notesError

syn match notesH1 "^.\+\n=\+$" contained contains=@notesInline,notesHeadingRule,notesAutomaticLink
syn match notesH2 "^.\+\n-\+$" contained contains=@notesInline,notesHeadingRule,notesAutomaticLink

syn match notesHeadingRule "^[=-]\+$" contained

syn region notesH1 matchgroup=notesHeadingDelimiter start="##\@!"      end="#*\s*$" keepend oneline contains=@notesInline,notesAutomaticLink contained
syn region notesH2 matchgroup=notesHeadingDelimiter start="###\@!"     end="#*\s*$" keepend oneline contains=@notesInline,notesAutomaticLink contained
syn region notesH3 matchgroup=notesHeadingDelimiter start="####\@!"    end="#*\s*$" keepend oneline contains=@notesInline,notesAutomaticLink contained
syn region notesH4 matchgroup=notesHeadingDelimiter start="#####\@!"   end="#*\s*$" keepend oneline contains=@notesInline,notesAutomaticLink contained
syn region notesH5 matchgroup=notesHeadingDelimiter start="######\@!"  end="#*\s*$" keepend oneline contains=@notesInline,notesAutomaticLink contained
syn region notesH6 matchgroup=notesHeadingDelimiter start="#######\@!" end="#*\s*$" keepend oneline contains=@notesInline,notesAutomaticLink contained

syn match notesBlockquote ">\%(\s\|$\)" contained nextgroup=@notesBlock

syn region notesCodeBlock start="    \|\t" end="$" contained

" TODO: real nesting
syn match notesListMarker "\%(\t\| \{0,4\}\)[-*+]\%(\s\+\S\)\@=" contained
syn match notesOrderedListMarker "\%(\t\| \{0,4}\)\<\d\+\.\%(\s\+\S\)\@=" contained

syn match notesRule "\* *\* *\*[ *]*$" contained
syn match notesRule "- *- *-[ -]*$" contained

syn match notesLineBreak " \{2,\}$"

syn region notesIdDeclaration matchgroup=notesLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=notesUrl skipwhite
syn match notesUrl "\S\+" nextgroup=notesUrlTitle skipwhite contained
syn region notesUrl matchgroup=notesUrlDelimiter start="<" end=">" oneline keepend nextgroup=notesUrlTitle skipwhite contained
syn region notesUrlTitle matchgroup=notesUrlTitleDelimiter start=+"+ end=+"+ keepend contained
syn region notesUrlTitle matchgroup=notesUrlTitleDelimiter start=+'+ end=+'+ keepend contained
syn region notesUrlTitle matchgroup=notesUrlTitleDelimiter start=+(+ end=+)+ keepend contained

syn region notesLinkText matchgroup=notesLinkTextDelimiter start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=notesLink,notesId skipwhite contains=@notesInline,notesLineStart
syn region notesLink matchgroup=notesLinkDelimiter start="(" end=")" contains=notesUrl keepend contained
syn region notesId matchgroup=notesIdDelimiter start="\[" end="\]" keepend contained
syn region notesAutomaticLink matchgroup=notesUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline

let s:concealends = has('conceal') ? ' concealends' : ''
exe 'syn region notesItalic matchgroup=notesItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=notesLineStart' . s:concealends
exe 'syn region notesItalic matchgroup=notesItalicDelimiter start="\S\@<=_\|_\S\@=" end="\S\@<=_\|_\S\@=" keepend contains=notesLineStart' . s:concealends
exe 'syn region notesBold matchgroup=notesBoldDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=notesLineStart,notesItalic' . s:concealends
exe 'syn region notesBold matchgroup=notesBoldDelimiter start="\S\@<=__\|__\S\@=" end="\S\@<=__\|__\S\@=" keepend contains=notesLineStart,notesItalic' . s:concealends
exe 'syn region notesBoldItalic matchgroup=notesBoldItalicDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend contains=notesLineStart' . s:concealends
exe 'syn region notesBoldItalic matchgroup=notesBoldItalicDelimiter start="\S\@<=___\|___\S\@=" end="\S\@<=___\|___\S\@=" keepend contains=notesLineStart' . s:concealends

syn region notesCode matchgroup=notesCodeDelimiter start="`" end="`" keepend contains=notesLineStart
syn region notesCode matchgroup=notesCodeDelimiter start="`` \=" end=" \=``" keepend contains=notesLineStart
syn region notesCode matchgroup=notesCodeDelimiter start="^\s*```.*$" end="^\s*```\ze\s*$" keepend

syn match notesFootnote "\[^[^\]]\+\]"
syn match notesFootnoteDefinition "^\[^[^\]]\+\]:"

if main_syntax ==# 'notes'
  for s:type in g:notes_fenced_languages
    exe 'syn region notesHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\..*','','').' matchgroup=notesCodeDelimiter start="^\s*```\s*'.matchstr(s:type,'[^=]*').'\>.*$" end="^\s*```\ze\s*$" keepend contains=@notesHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\.','','g')
  endfor
  unlet! s:type
endif

syn match notesEscape "\\[][\\`*_{}()#+.!-]"
syn match notesError "\w\@<=_\w\@="

hi def link notesH1                    htmlH1
hi def link notesH2                    htmlH2
hi def link notesH3                    htmlH3
hi def link notesH4                    htmlH4
hi def link notesH5                    htmlH5
hi def link notesH6                    htmlH6
hi def link notesHeadingRule           notesRule
hi def link notesHeadingDelimiter      Delimiter
hi def link notesOrderedListMarker     notesListMarker
hi def link notesListMarker            htmlTagName
hi def link notesBlockquote            Comment
hi def link notesRule                  PreProc

hi def link notesFootnote              Typedef
hi def link notesFootnoteDefinition    Typedef

hi def link notesLinkText              htmlLink
hi def link notesIdDeclaration         Typedef
hi def link notesId                    Type
hi def link notesAutomaticLink         notesUrl
hi def link notesUrl                   Float
hi def link notesUrlTitle              String
hi def link notesIdDelimiter           notesLinkDelimiter
hi def link notesUrlDelimiter          htmlTag
hi def link notesUrlTitleDelimiter     Delimiter

hi def link notesItalic                htmlItalic
hi def link notesItalicDelimiter       notesItalic
hi def link notesBold                  htmlBold
hi def link notesBoldDelimiter         notesBold
hi def link notesBoldItalic            htmlBoldItalic
hi def link notesBoldItalicDelimiter   notesBoldItalic
hi def link notesCodeDelimiter         Delimiter

hi def link notesEscape                Special
hi def link notesError                 Error

let b:current_syntax = "notes"
if main_syntax ==# 'notes'
  unlet main_syntax
endif


" ---------------------------------------
" ---------------------------------------
" ---------------------------------------
"  CUSTOMIZATIONS FOR NOTES FILES
" ---------------------------------------
" ---------------------------------------
" ---------------------------------------
"
hi def link notesCode           Statement
hi def link notesCodeDelimiter  Statement


" ---------------------------------------
" when copying the markdown syntax file
" separate the syntax colors between the
"   *italic* and _italic_
"
" also:
"   *italic* and _italic_
"
" just to give the vim colors more flavor
" ---------------------------------------

" vim:set sw=2:
